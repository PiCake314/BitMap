#include "Mapper.hpp"
#include "../Structs/Shapes/Shapes.hpp"
#include "../Utility/ThreadSafeQueue.hpp"
#include "../Utility/HelperFuncs.hpp"
#include "../Utility/Command.hpp"

#include <thread>
#include <mutex>
#include <limits>

#define INIT_STATE false

using namespace map::util;

// image mode
map::Mapper::Mapper(std::string_view fn, Size size, Loadtype type)
: m_Filename(fn),
m_Size{size.width, size.height},
m_FPS{0}, m_Delta{0}, m_Current_frame{0},
m_PType("P3"), m_Max(255), m_Set_state(INIT_STATE),
m_XCenter{0}, m_YCenter{0}, m_Root_pix_per_lock(100)
{
    assert(fn.length() > 4 );
    assert(fn.substr(fn.length()-4, 4) == ".ppm");
    

    if(type == Loadtype::edit) loadFile();
    else resetFile();

    m_Fonts.push_back(fnt::Font{DEFUALT_FONT}); // default font "Minecraft"


    if(m_Size.height * m_Size.width > size_t(m_Root_pix_per_lock)){
        // each lock will be responsible for m_Root_pix_per_lock^2 pixels
        const size_t h = m_Size.height/m_Root_pix_per_lock;
        const size_t w = m_Size.width/m_Root_pix_per_lock;

        m_Locks.resize(h);
        // for(auto &row : m_Locks) row.reserve(w);

        for(size_t i = 0; i < h; ++i){
            for(size_t j = 0; j < w; ++j){
                // std::clog << std::setw(3) << i*w + j << ' ';
                m_Locks[i].emplace_back();
            }
            // std::clog << std::endl;
        }
    }

}

// video mode
map::Mapper::Mapper(std::string_view fn, Size size, size_t fps, Loadtype type)
: m_Filename(MANGLED_PPM), m_Filename_vid(fn),
m_Size{size.width, size.height},
m_FPS(fps), m_Delta(1./fps), m_Current_frame{0},
m_PType("P3"), m_Max(255), m_Set_state(INIT_STATE),
m_XCenter{0}, m_YCenter{0}, m_Root_pix_per_lock{0}
{
    assert(fn.length() > 4 && "Filename too short");
    assert(fn.substr(fn.length()-4, 4) == ".mp4" && "Only .mp4 files are supported");

    if(type == Loadtype::edit) loadFile();
    else resetFile();

    m_Fonts.push_back(fnt::Font{DEFUALT_FONT}); // default font "Minecraft"
}


map::Mapper::~Mapper(){
    if(m_Map) delete[] m_Map;
}


void map::Mapper::loadFont(std::string_view fontname){

    if(std::find_if(m_Fonts.begin(), m_Fonts.end(),
        [&fontname](const fnt::Font &f){ return f.getFontname() == fontname; }
    ) == m_Fonts.end()) // making sure the font doesn't already exist
        m_Fonts.push_back(fnt::Font{fontname});

    // m_Fonts.push_back(fnt::Font{fontname});
}


// void map::Mapper::setFPS(int fps){
//     m_FPS = fps;
// }


size_t map::Mapper::getFPS() const { return m_FPS; }

void map::Mapper::doSet(){ m_Set_state = true ; }
void map::Mapper::noSet(){ m_Set_state = false; }




// void map::Mapper::setFile(std::string fn){
//     m_Filename = fn;
// }


map::Size map::Mapper::getSize() const{
    return m_Size;
}


// deprecated
void map::Mapper::fillWhite(){
    for(size_t i = 0; i < m_Size.height; i++)
        for(size_t j = 0; j < m_Size.width; j++)
            m_Map[i*m_Size.width + j] = clr::RGB(255, 255, 255);

    if(m_Set_state) setState();
}



void map::Mapper::fill(clr::RGB color){
    for(size_t i = 0; i < m_Size.height; i++)
        for(size_t j = 0; j < m_Size.width; j++)
            m_Map[i * m_Size.width + j] = color;
    
    if(m_Set_state) setState();
}



template <bool grey_scale>
void map::Mapper::randomize(){
    for(size_t i = 0; i < m_Size.height; i++)
        for(size_t j = 0; j < m_Size.width; j++)
            if constexpr(grey_scale){
                const int c = rand() % 256;
                 m_Map[i * m_Size.width + j] = clr::RGB(c, c, c);
            }
            else m_Map[i * m_Size.width + j] = clr::RGB(rand() % 256, rand() %256, rand() % 256);

    if(m_Set_state) setState();
}


// deprecated
void map::Mapper::randomizeGrey(){
    for(size_t i = 0; i < m_Size.height; i++)
        for(size_t j = 0; j < m_Size.width; j++){
            int c = rand() % 256;
            m_Map[i * m_Size.width + j] = clr::RGB(c, c, c);
        }

    if(m_Set_state) setState();
}


// deprecated
map::clr::RGB map::Mapper::getColorAt(Point p){
    if(p.x >= 0 && p.x < m_Size.height && p.y >= 0 && p.y < m_Size.width)
        return m_Map[int(p.x * m_Size.width + p.y)];

    throw std::out_of_range("Invalid point");

    // return clr::RGB();
}


// deprecated
void map::Mapper::drawAt(Point p, clr::RGB color){
    if(p.x >= 0 && p.x < m_Size.height && p.y >= 0 && p.y < m_Size.width)
        m_Map[int(p.x*m_Size.width + p.y)] = color;

    if(m_Set_state) setState();
}



template <bool called_from_shape_class>
void map::Mapper::drawLine(const Point &p1, const Point &p2, clr::RGB color, int thickness){

    if constexpr(not called_from_shape_class){
        color.depth = 1;
    }


    if(thickness < 2) thickness = 2;

    const int half_thickness = thickness/2;

    size_t i_start = size_t(std::clamp(std::min(p1.y, p2.y) - half_thickness, 0., m_Size.height -1.));
    size_t i_end = size_t(std::clamp(std::max(p1.y, p2.y) + half_thickness, 0., m_Size.height -1.));

    size_t j_start = size_t(std::clamp(std::min(p1.x, p2.x) - half_thickness, 0., m_Size.width -1.));
    size_t j_end = size_t(std::clamp(std::max(p1.x, p2.x) + half_thickness, 0., m_Size.width -1.));


    if(std::abs(p2.x - p1.x) < std::numeric_limits<double>::epsilon()){
        // #pragma omp parallel for simd collapse(2)a
        for(size_t i = i_start; i <= i_end; i++){
            for(size_t j = j_start; j <= j_end; j++){
                if(distFromLineSquared(p1, p2, {double(j), double(i)}) <= std::pow(thickness/2., 2)){
                    auto &pixel = m_Map[i*m_Size.width + j];
                    if(color.depth > pixel.depth) pixel = color;
                }
            }
        }
    }
    else{
        // i_start -= thickness/2; j_start -= thickness/2;
        // i_end += thickness/2; j_end += thickness/2;
        for(size_t i = i_start; i <= i_end; i++){
            for(size_t j = j_start; j <= j_end; j++){
                auto &pixel = m_Map[i*m_Size.width + j];
                if(color.depth > pixel.depth) pixel = color;
            }
        }
    }

    if(m_Set_state) setState();
}

template void map::Mapper::drawLine<true> (const Point&, const Point&, clr::RGB, int);
template void map::Mapper::drawLine<false>(const Point&, const Point&, clr::RGB, int);

// template <>
// void map::Mapper::drawLine<false>(Point p1, Point p2, clr::RGB color, int thickness){
//     color.depth = 1;
//     drawLine<true>(p1, p2, color, thickness);
// }


template <bool called_from_shape_class>
void map::Mapper::drawTri(const Point &p1, const Point &p2, const Point &p3, clr::RGB color, int thickness){

    if constexpr(not called_from_shape_class){
        color.depth = 1;
    }


    bool s = m_Set_state;
    m_Set_state = false;

    drawLine(p1, p2, color, thickness);
    drawLine(p2, p3, color, thickness);
    drawLine(p1, p3, color, thickness);

    m_Set_state = s;

    if(m_Set_state) setState();
}

template void map::Mapper::drawTri<true> (const Point&, const Point&, const Point&, clr::RGB, int);
template void map::Mapper::drawTri<false>(const Point&, const Point&, const Point&, clr::RGB, int);

// template <>
// void map::Mapper::drawTri<false>(Point p1, Point p2, Point p3, clr::RGB color, int thickness){
//     color.depth = 1;
//     drawTri<true>(p1, p2, p3, color, thickness);
// }



void map::Mapper::drawFourPoints(Point points[], clr::RGB color, bool thick){

    // orderFourPoints(points);

    const Point &p1 = points[0];
    const Point &p2 = points[1];
    const Point &p3 = points[2];
    const Point &p4 = points[3];

    const double slope1 = (p2.y - p1.y)/(p2.x - p1.x);
    const double b1 = p1.y - slope1*p1.x;

    const double slope2 = (p3.y - p2.y)/(p3.x - p2.x);
    const double b2 = p2.y - slope2*p2.x;

    const double slope3 = (p4.y - p3.y)/(p4.x - p3.x);
    const double b3 = p3.y - slope3*p3.x;

    const double slope4 = (p1.y - p4.y)/(p1.x - p4.x);
    const double b4 = p4.y - slope4*p4.x;

    for(size_t i = 0; i < m_Size.height; i++)
        for(size_t j = 0; j < m_Size.width; j++)
            if(
                i >= (slope1*j + b1) + thick &&
                (std::abs(p2.x - p3.x) < std::numeric_limits<double>::epsilon() ? j <= p2.x : i >= (slope2*j + b2) + thick) &&
                i <= (slope3*j + b3) + thick &&
                (std::abs(p1.x - p4.x) < std::numeric_limits<double>::epsilon() ? j >= p1.x : i <= (slope4*j + b4) + thick)
            ){
                auto &pixel = m_Map[i*m_Size.width + j];
                if(color.depth > pixel.depth) pixel = color;
            }


    if(m_Set_state) setState();
}


template <bool called_from_shape_class>
void map::Mapper::drawPolygon(const std::vector<Point>& points, clr::RGB color, bool filled, int thick){
    assert(points.size() > 2 && "use drawLine() when size() == 2");

    if constexpr(not called_from_shape_class){
        color.depth = 1;
    }


    if(!filled){
        const size_t limit = points.size() - 1;
        for(size_t i = 0; i < limit; ++i)
            drawLine(points[i], points[i+1], color, thick);

        drawLine(points.back(), points.front(), color, thick);
    }
    else{
        std::vector<map::shapes::Line> lines;
        const size_t num_lines = points.size() - 1;
        for(size_t i = 0; i < num_lines; i++)
            lines.push_back(map::shapes::Line(points[i], points[i+1], {.color = color, .thickness = thick}));

        lines.push_back(map::shapes::Line(points.back(), points.front(), {.color = color, .thickness = thick}));
        const size_t size = lines.size(); // count how many times you cross a line


        for(size_t i = 0; i < m_Size.height; i++){
            std::vector<double> intersections;

            for(size_t ind = 0; ind < size; ++ind){
                const auto &line = lines[ind];
                const Point &p1 = line.start();
                const Point &p2 = line.end();

                // Check if the scanline intersects with the current line segment
                if((p1.y <= i && p2.y > i) || (p2.y <= i && p1.y > i)){
                    double x_intersect = p1.x + (i - p1.y) / (p2.y - p1.y) * (p2.x - p1.x);

                    intersections.push_back(x_intersect);
                }
            }

            // Sort intersections in ascending order
            std::ranges::sort(intersections);

            // Fill the pixels between pairs of intersections
            const size_t s = intersections.size();
            for(size_t j = 0; j < s; j += 2) {
                size_t start_x = std::max(size_t(0), static_cast<size_t>(std::round(intersections[j])));
                size_t end_x = std::min(m_Size.width - 1, static_cast<size_t>(std::round(intersections[j + 1])));

                for(size_t x = start_x; x <= end_x; ++x) {
                    auto &pixel = m_Map[i * m_Size.width + x];
                    if(color.depth > pixel.depth) pixel = color;
                }
            }
        }
    }

    if(m_Set_state) setState();
}

template void map::Mapper::drawPolygon<true> (const std::vector<Point>&, clr::RGB, bool, int);
template void map::Mapper::drawPolygon<false>(const std::vector<Point>&, clr::RGB, bool, int);

// template <>
// void map::Mapper::drawPolygon<false>(const std::vector<Point>& points, clr::RGB color, bool filled, int thick){
//     color.depth = 1;
//     drawPolygon<true>(points, color, filled, thick);
// }



template <bool called_from_shape_class>
void map::Mapper::drawRect(Point center, double h, double w, clr::RGB color, bool filled, bool thick , RectAlignment alignment){

    if constexpr(not called_from_shape_class){
        color.depth = 1;
    }


    if(h < 0) h = m_Size.height/10;
    if(w < 0) w   = m_Size.height/10;

    if(h < 1)
        h *= m_Size.height;
    
    if(w < 1)
        w *= m_Size.width;

    if(center.x < 1)
        center.x *= m_Size.height;

    if(center.y < 1)
        center.y *= m_Size.width;


    switch (alignment){
        case RectAlignment::center:
            center.x = m_Size.width/2;
            center.y = m_Size.height/2;
            break;

        case RectAlignment::top_left:
            center.x = w/2;
            center.y = h/2;
            break;

        case RectAlignment::top_right:
            center.x = m_Size.width - w/2;
            center.y = h/2;
            break;

        case RectAlignment::bottom_left:
            center.x = w/2;
            center.y = m_Size.height - h/2;
            break;

        case RectAlignment::bottom_right:
            center.x = m_Size.width - w/2;
            center.y = m_Size.height - h/2;
            break;

        case RectAlignment::width:
            w = m_Size.width;
            center.x = m_Size.width/2;
            break;
        
        case RectAlignment::height:
            h = m_Size.height;
            center.y = m_Size.height/2;
            break;
        
        case RectAlignment::none:
            break;
    }


    if(filled){
        size_t i_start = size_t(std::max(center.y - h/2 - 1, 0.));
        size_t i_end = size_t(std::min(center.y + h/2, double(m_Size.height)));

        size_t j_start = size_t(std::max(center.x - w/2 - 1, 0.));
        size_t j_end = size_t(std::min(center.x + w/2, double(m_Size.width)));
        for(size_t i = i_start; i <= i_end; i++){
            for(size_t j = j_start; j <= j_end; ++j){
                if(i < m_Size.height and j < m_Size.width){ // i/j could never be less than zero since they're size_t + we're taking the max above
                    auto &pixel = m_Map[i*m_Size.width + j];
                    if(color.depth > pixel.depth) pixel = color;
                }
            }
        }
    }
    else{
        const double cxmw = std::max(center.x - w/2 - 1, 0.);
        const double cymh = std::max(center.y - h/2 - 1, 0.);
        const double cyph = std::min(center.y + h/2 - 1, m_Size.height -1.);
        const double cxpw = std::min(center.x + w/2 - 1, m_Size.width -1.);

        drawLine(
            Point(cxmw, cymh),
            Point(cxmw, cyph),
            color, thick
        );


        drawLine(
            Point(cxmw, cyph),
            Point(cxpw, cyph),
            color, thick
        );


        drawLine(
            Point(cxpw, cyph),
            Point(cxpw, cymh),
            color, thick
        );


        drawLine(
            Point(cxpw, cymh),
            Point(cxmw, cymh),
            color, thick
        );
    }

    if(m_Set_state) setState();
}

template void map::Mapper::drawRect<true> (Point, double, double, clr::RGB, bool, bool, RectAlignment);
template void map::Mapper::drawRect<false>(Point, double, double, clr::RGB, bool, bool, RectAlignment);

// template <>
// void map::Mapper::drawRect<false>(Point center, double h, double w, clr::RGB color, bool filled, bool thick, RectAlignment alignment){
//     color.depth = 1;
//     drawRect<true>(center, h, w, color, filled, thick, alignment);
// }


template <bool called_from_shape_class>
void map::Mapper::drawCircle(Point center, int r, clr::RGB color, bool filled, bool inverted, int thickness, Alignment alignment){

    if constexpr(not called_from_shape_class){
        color.depth = 1;
    }


    // thickness = thickness < 2 ? 2 : thickness;
    if(thickness < 2) thickness = 2; // this does the above but without the unnecessary assignment

    if(r < 0) r = int(m_Size.height/10);

    switch (alignment){
        case Alignment::center:
            center.x = (m_Size.width/2);
            center.y = (m_Size.height/2);
            break;

        case Alignment::top:
            center.x = 0;
            center.y = (m_Size.height/2);
            break;

        case Alignment::bottom:
            center.x = m_Size.width - size_t(r);
            center.y = (m_Size.height/2);
            break;

        case Alignment::left:
            center.x = (m_Size.width/2);
            center.y = 0;
            break;

        case Alignment::right:
            center.x = (m_Size.width/2);
            center.y = m_Size.height - size_t(r);
            break;

        case Alignment::none:
            break;
    }


    // int topMid = center.x+r; // not sure what this was for...
    // int leftMid = center.y+r;

    if(inverted){
        color.red = 255 - color.red;
        color.green = 255 - color.green;
        color.blue = 255 - color.blue;
    }

    size_t i_start = center.y - r >= 0 ? size_t(center.y - r) : 0;
    size_t j_start = center.x - r >= 0 ? size_t(center.x - r) : 0;

    size_t i_end = center.y + 2*r < m_Size.height ? size_t(center.y + 2*r) : m_Size.height;
    size_t j_end = center.x + 2*r < m_Size.width  ? size_t(center.x + 2*r) : m_Size.width;

    if(inverted){
        for(size_t i = 0; i < m_Size.height; i++)
            for(size_t j = 0; j < m_Size.width; j++)
                if(-((i - center.y) * (i - center.y) + (j-center.x)*(j-center.x)) <= -r*r){
                    auto &pixel = m_Map[i*m_Size.width + j];
                    if(color.depth > pixel.depth) pixel = color;
                }
    }
    else if(filled){
        for(size_t i = i_start; i < i_end; i++)
            for(size_t j = j_start; j < j_end; j++)
                if(((i - center.y) * (i - center.y) + (j - center.x) * (j - center.x)) <= r*r){
                        auto &pixel = m_Map[i*m_Size.width + j];
                        if(color.depth > pixel.depth) pixel = color;
                }
    }
    else for(size_t i = i_start; i < i_end; i++)
            for(size_t j = j_start; j < j_end; j++){
                const auto eq = (i-center.y)*(i-center.y) + (j-center.x)*(j-center.x);
                if(eq >= r*r - thickness*r and eq <= r*r + r){
                    auto &pixel = m_Map[i*m_Size.width + j];
                    if(color.depth > pixel.depth) pixel = color;
                }
            }

    // for(int i=top; i<top+2*r; i++){
    //     for(int j=left; j<left+2*r; j++){
    //         if((i-topMid)*(i-topMid0) + (j-leftMid)*(j-leftMid) <= r*r){
    //             map[i*s.width + j] = color;
    //         }
    //     }
    // }

    if(m_Set_state) setState();
}

template void map::Mapper::drawCircle<true> (Point, int, clr::RGB, bool, bool, int, Alignment);
template void map::Mapper::drawCircle<false>(Point, int, clr::RGB, bool, bool, int, Alignment);


// !!! so apparently these templates need to be instantiated manually (why?) and the function bellow was doing that for me. The 2 lines above are need to explicitly instantiate the templates but I'm not sure why the compiler cannot do that on its own..
// template <>
// void map::Mapper::drawCircle<false>(Point center, int r, clr::RGB color, bool filled, bool inverted, int thickness, Alignment alignment){
//     color.depth = 1;
//     drawCircle<true>(center, r, color, filled, inverted, thickness, alignment);
// }


template <bool called_from_shape_class>
void map::Mapper::drawEllipse(const Point &center, int r1, int r2, clr::RGB color, bool filled, bool inverted, int thickness, Alignment alignment){

    if constexpr(not called_from_shape_class){
        color.depth = 1;
    }


    double thick = double(thickness) / 100.;

    if(r1 < 0) r1 = static_cast<int>(m_Size.height/10);
    if(r2 < 0) r2 = static_cast<int>(m_Size.height/10);

    size_t top = size_t(center.y - r1);
    size_t left = size_t(center.x - r2);


    switch (alignment){
        case Alignment::center:
            top = static_cast<size_t>((m_Size.height/2) - size_t(r1));
            left = static_cast<size_t>((m_Size.width/2) - size_t(r2));
            break;

        case Alignment::top:
            top = 0;
            left = static_cast<size_t>((m_Size.width/2) - size_t(r2));
            break;

        case Alignment::bottom:
            top = static_cast<size_t>(m_Size.height - 2* size_t(r1));
            left = static_cast<size_t>((m_Size.width/2) - size_t(r2));
            break;

        case Alignment::left:
            top = static_cast<size_t>((m_Size.height/2) - size_t(r1));
            left = 0;
            break;

        case Alignment::right:
            top = static_cast<size_t>((m_Size.height/2) - size_t(r1));
            left = static_cast<size_t>(m_Size.width - 2*  size_t(r2));
            break;

        case Alignment::none:
            break;
    }


    // if(filled){
    //     for(int i = 0; i < m_Size.height; i++){
    //         for(int j = 0; j < m_Size.width; j++){
    //             int inv = (inverted ? -1 : 1);
    //             int equation = (std::pow((i - top - r1), 2) + std::pow((j - left - r2), 2)) * inv;

    //             if(equation < r1 * r2 * inv){
    //                 m_Map[i * m_Size.width + j] = color;
    //             }
    //         }
    //     }
    // }
    // else for(int i = std::max(top, 0); i < std::min(top + 2 * r1,  m_Size.height); i++){
    //     for(int j = std::max(left, 0); j <= std::min(left + 2 * r2, m_Size.width); j++){
    //         int equation = std::pow((i - top - r1), 2) + std::pow((j - left - r2), 2);

    //         if(equation >= r1 * r1 - r1 && equation <= r2 * r2 + r2){
    //             m_Map[i * m_Size.width + j] = color;
    //         }
    //     }
    // }

    if(inverted){
        clr::RGB invColor = color.inverted();
        for(size_t i = 0; i < m_Size.height; i++){
            for(size_t j = 0; j < m_Size.width; j++){
                const double equation = std::pow((i - top - size_t(r1)), 2) / std::pow(r1, 2) + std::pow((j - left - size_t(r2)), 2) / std::pow(r2, 2);


                if(equation > 1){
                    auto &pixel = m_Map[i*m_Size.width + j];
                    if(invColor.depth > pixel.depth) pixel = invColor;
                }
            }
        }
    }
    else if(filled){
        for(size_t i = std::max(top, size_t(0)); i < std::min(top + 2 * size_t(r1),  m_Size.height); i++){
            for(size_t j = std::max(left, size_t(0)); j <= std::min(left + 2 * size_t(r2), m_Size.width); j++){
                const double equation = std::pow((i - top - size_t(r1)), 2) / std::pow(r1, 2) + std::pow((j - left - size_t(r2)), 2) / std::pow(r2, 2);

                if(equation <= 1){
                    auto &pixel = m_Map[i*m_Size.width + j];
                    if(color.depth > pixel.depth) pixel = color;
                }
            }
        }
    }
    else for(size_t i = std::max(top, size_t(0)); i < std::min(top + 2 * size_t(r1) + 1,  m_Size.height); i++){
        for(size_t j = std::max(left, size_t(0)); j <= std::min(left + 2 * size_t(r2) + 1, m_Size.width); j++){
            double equation = std::pow((i - top - size_t(r1)), 2) / std::pow(r1, 2) + std::pow((j - left - size_t(r2)), 2) / std::pow(r2, 2);

            // if(equation >= r1 * r1 - r1 && equation <= r2 * r2 + r2){
            //     m_Map[i * m_Size.width + j] = color;
            // }

            if(equation <= 1 + thick && equation >= 1 - thick){
                m_Map[i * m_Size.width + j] = color;
            }
        }
    }


    if(m_Set_state) setState();
}

template void map::Mapper::drawEllipse<true> (const Point&, int, int, clr::RGB, bool, bool, int, Alignment);
template void map::Mapper::drawEllipse<false>(const Point&, int, int, clr::RGB, bool, bool, int, Alignment);

// template <>
// void map::Mapper::drawEllipse<false>(Point center, int r1, int r2, clr::RGB color, bool filled, bool inverted, int thickness, Alignment alignment){
//     color.depth = 1;
//     drawEllipse<true>(center, r1, r2, color, filled, inverted, thickness, alignment);
// }



void map::Mapper::drawText(std::string_view text, Point center, std::string_view fontname, Alignment alignment){
    if(fontname == "") fontname = m_Fonts.back().getFontname(); // default to the latest font added

    int index = -1;
    for(size_t i = 0; i < m_Fonts.size(); ++i){
        if(m_Fonts[i].getFontname() == fontname){
            index = int(i);
            break;
        }
    }
    assert(index != -1 && "Font not found");

    const fnt::Font &font = m_Fonts[size_t(index)];


 

    // calculating the center of the text
    const size_t textHeight = font['a'].height + size_t(font['a'].yoffset);
    const size_t textWidth = std::accumulate(text.begin(), text.end(), size_t(0), [&font](int acc, char c){ return acc + font[c].xoffset + font[c].xadvance; });

    // Replaced with std::accumulate to enforce const correctness
    // for(char c : text){
    //     textWidth += font[c].xoffset;
    //     textWidth += font[c].xadvance;
    // }


    switch(alignment){
        case Alignment::center:
            center.x = (m_Size.width/2) - textWidth/2;
            center.y = (m_Size.height/2) - textHeight/2;
            break;

        case Alignment::top:
            center.x = (m_Size.width/2) - textWidth/2;
            center.y = 0;
            break;

        case Alignment::bottom:
            center.x = (m_Size.width/2) - textWidth/2;
            center.y = m_Size.height - textHeight;
            break;

        case Alignment::left:
            center.x = 0;
            center.y = (m_Size.height/2) - textHeight/2;
            break;

        case Alignment::right:
            center.x = m_Size.width - textWidth;
            center.y = (m_Size.height/2) - textHeight/2;
            break;

        case Alignment::none:
            break;
    }

    const size_t i_base = size_t(std::max(center.y - textHeight/2, 0.));
    size_t j_start = size_t(std::max(center.x - textWidth/2, 0.));

    const clr::RGB &transparent_color = font.getTransparentColor();

    // drawing the text
    for(char c : text){
        const fnt::Letter &l = font[c];

        size_t i_start = i_base + size_t(l.yoffset);
        j_start += size_t(l.xoffset);

        for(size_t i = i_start; i < i_start + l.height; ++i){
            for(size_t j = j_start; j < j_start + l.width; ++j){
                const clr::RGB &pixel = l.buffer[(i - i_start)*l.width + (j - j_start)];

                if(pixel != transparent_color and safePoint({j, i})){
                    m_Map[i*m_Size.width + j] = pixel;
                }
            }
        }

        j_start += size_t(l.xadvance) + font.getSpacing().width;
    }

    if(m_Set_state) setState();
}


void map::Mapper::draw(map::shapes::Shape* s){
    s->draw(this);
}


template <bool locked>
void map::Mapper::draw(const map::shapes::ShapePtr s){

    if constexpr(locked){
        std::vector<std::unique_lock<std::mutex>> locks;
        for(auto [i, j] : s->getLocks(m_Size, m_Root_pix_per_lock)){
            locks.emplace_back(m_Locks[i][j]);
        }

        s->draw(this);
    }
    else s->draw(this);


    // else if constexpr(std::is_same_v<T, Image>){
    //     drawImage(shape.img, shape.top, shape.left, shape.alignment);
    // }
    // else if constexpr(std::is_same_v<T, BezierCurve>){
    //     drawBezierCurve(shape.pts, shape.dt, shape.color, shape.thick);
    // }
}



// template<template<typename> typename FR, typename T>
// requires std::ranges::forward_range<FR<T>> &&
// std::same_as<std::ranges::range_value_t<FR<T>>, map::shapes::Shape*>
void map::Mapper::draw(std::vector<shapes::ShapePtr> &&shapes_vec, const int num_threads){
    // naive implementation
    if(num_threads == 1){
        for(auto &shape : shapes_vec){
            draw(std::move(shape));
        }

        return;
    }

    map::util::ThreadSafeQueue/*<shapes::Shape*>*/ queue{std::move(shapes_vec)};
    constexpr bool multithreaded = true;

    std::vector<std::thread> threads;
    bool s = m_Set_state;
    m_Set_state = false;
    for(int i = 0; i < num_threads; ++i){
        threads.emplace_back([&queue, this]{
            while(!queue.isEmpty()){
                shapes::ShapePtr shape = queue.dequeue();
                draw<multithreaded>(std::move(shape));
            }
        });
    }

    for(auto &thread : threads) thread.join();

    this->m_Set_state = s;
    if(this->m_Set_state) this->setState();
}


void map::Mapper::bezierCurve(std::vector<Point> pts, double dt, clr::RGB color, bool thick){
    assert(pts.size() >= 2);

    const size_t l = pts.size();

    Point curr;
    Point prev = pts[0];

    bool s = m_Set_state;
    m_Set_state = false;

    for(double d{}; d <= 1; d += dt){
        std::vector<std::vector<Point>> lerpVec = {pts};
        for(size_t i = 1; i < l; i++){
            if(l + 1 - i > 1) lerpVec.push_back(std::vector<Point>());

            for(size_t j = 1; j < l + 1 - i; j++){
                drawLine(lerpVec[i-1][j-1], lerpVec[i-1][j], clr::RGB(200, 150, 0));
                lerpVec[i].push_back(lerp(lerpVec[i-1][j-1], lerpVec[i-1][j], d));
            }

        }
        curr = lerp(lerpVec[lerpVec.size()-2][0], lerpVec[lerpVec.size()-2][1], d);

        drawLine(prev, curr, color, thick);
        prev = curr;
    }
    m_Set_state = s;


    if(m_Set_state) setState();
}



void map::Mapper::plot(size_t(*func)(size_t), clr::RGB color, bool thick){
    for (size_t i = 0; i < m_Size.height; i++)
        for (size_t j = 0; j < m_Size.width; j++){
            size_t value = (m_Size.height/2 - func(j - m_Size.width/2));
            if (value <= i + thick and value >= i - thick){
                auto &pixel = m_Map[i*m_Size.width + j];
                if(color.depth > pixel.depth) pixel = color;
            }
        }

    if(m_Set_state) setState();
}



void map::Mapper::plot(double(*func)(double, double), double(*res)(double, double), clr::RGB color){
    for (size_t i = 0; i < m_Size.height; i++)
        for (size_t j = 0; j < m_Size.width; j++){
            if (abs(func(j - m_Size.width/2, m_Size.height/2 - i) - (res(j - m_Size.width/2, m_Size.height/2 - i))) <= 5){
                auto &pixel = m_Map[i*m_Size.width + j];
                if(color.depth > pixel.depth) pixel = color;
            }
        }

    if(m_Set_state) setState();
}



void map::Mapper::plot(bool (*func)(size_t x, size_t y), clr::RGB color){
    for (size_t i = 0; i < m_Size.height; i++)
        for (size_t j = 0; j < m_Size.width; j++){
            if (func(j, i)){
                auto &pixel = m_Map[i*m_Size.width + j];
                if(color.depth > pixel.depth) pixel = color;
            }
        }

    if(m_Set_state) setState();
}



void map::Mapper::rotate(double angle){
    std::vector<clr::RGB> temp(m_Map, m_Map + m_Size.width * m_Size.height);

    bool s = m_Set_state;
    m_Set_state = false;
    fill();
    m_Set_state = s;

    for(size_t y = 0; y < m_Size.height; y++){
        for(size_t x = 0; x < m_Size.width; x++){
            size_t y2 = size_t((x - m_Size.width/2)*sin(angle) + (y - m_Size.height/2)*cos(angle) + m_Size.height/2);
            size_t x2 = size_t((x - m_Size.width/2)*cos(angle) - (y - m_Size.height/2)*sin(angle) + m_Size.width/2);

            if(safePoint({x2, y2})){
                m_Map[y2*m_Size.width + x2] = temp[y*m_Size.width + x];
            }
        }
    }

    if(m_Set_state) setState();
}



// void map::Mapper::animate(map::shapes::ShapePtr (*provider)(const double), float seconds){
//     assert(m_FPS > 0 && "FPS must be greater than 0!");
//     assert(m_Filename_vid != "" && "Filename must be set before calling animate()!");


//     std::clog << "Beginning Scene:\n";
//     const int frames = seconds * m_FPS;

//     std::vector<clr::RGB> temp(m_Map, m_Map + m_Size.width * m_Size.height);
//     const size_t temp_size = temp.size() * sizeof(clr::RGB);

//     for(int frame = 0; frame <= frames; frame++){
//         // copy(temp, m_Map); // can be replaced with memcpy
//         memcpy(m_Map, &temp[0], temp_size);
//         // auto shape = provider(frame, frames, delta);
//         auto shape = provider(delta);
//         draw(shape.get());
//         if(!m_Set_state) setState();
//         saveFrame();
//         std::clog << frame << '/' << frames << '\n';

//         // delete shape; // for non unique_ptr
//     }
//     // copy(temp, m_Map); // can be replaced with memcpy
//     memcpy(m_Map, &temp[0], temp_size);

//     std::clog << "Scene Ended!\n";
// }


// void map::Mapper::animate(map::shapes::ShapePtr (*provider)(const int, const int), float seconds){
//     assert(m_FPS > 0 && "FPS must be greater than 0!");
//     assert(m_Filename_vid != "" && "Filename must be set before calling animate()!");


//     std::clog << "Beginning Scene:\n";
//     const int frames = seconds * m_FPS;

//     std::vector<clr::RGB> temp(m_Map, m_Map + m_Size.width * m_Size.height);
//     const size_t temp_size = temp.size() * sizeof(clr::RGB);

//     for(int frame = 0; frame <= frames; frame++){
//         // copy(temp, m_Map); // can be replaced with memcpy
//         memcpy(m_Map, &temp[0], temp_size);
//         // auto shape = provider(frame, frames, delta);
//         auto shape = provider(frame, frames);
//         draw(shape.get());
//         if(!m_Set_state) setState();
//         saveFrame();
//         std::clog << frame << '/' << frames << '\n';

//         // delete shape; // for non unique_ptr
//     }
//     // copy(temp, m_Map); // can be replaced with memcpy
//     memcpy(m_Map, &temp[0], temp_size);

//     std::clog << "Scene Ended!\n";
// }


void map::Mapper::animate(map::shapes::ShapePtr (*provider)(const int, const int, const double), double seconds){
    assert(m_FPS > 0 && "FPS must be greater than 0!");
    assert(m_Filename_vid != "" && "Filename must be set before calling animate()!");


    std::clog << "Beginning Scene:\n";
    const int frames = int(seconds * m_FPS);

    std::vector<clr::RGB> temp(m_Map, m_Map + m_Size.width * m_Size.height);
    const size_t temp_size = temp.size() * sizeof(clr::RGB);

    for(int frame = 0; frame <= frames; ++frame){
        // copy(temp, m_Map); // can be replaced with memcpy
        memcpy(m_Map, &temp[0], temp_size);

        auto shape = provider(frame, frames, m_Delta);
        draw(std::move(shape));
        if(!m_Set_state) setState();
        saveFrame();
        std::clog << frame << '/' << frames << '\n';

        // delete shape; // for non unique_ptr
    }
    // copy(temp, m_Map); // can be replaced with memcpy
    memcpy(m_Map, &temp[0], temp_size);

    std::clog << "Scene Ended!\n";
}


void map::Mapper::animate(map::shapes::Shapes (*provider)(const int, const int, const double), double seconds){
    assert(m_FPS > 0 && "FPS must be greater than 0!");
    assert(m_Filename_vid != "" && "Filename must be set before calling animate()!");


    std::clog << "Beginning Scene:\n";
    const int frames = int(seconds * m_FPS);

    std::vector<clr::RGB> temp(m_Map, m_Map + m_Size.width * m_Size.height);
    const size_t temp_size = temp.size() * sizeof(clr::RGB);

    for(int frame = 0; frame <= frames; frame++){
        // copy(temp, m_Map); // can be replaced with memcpy
        memcpy(m_Map, &temp[0], temp_size);
        // auto shape = provider(frame, frames, m_Delta);
        auto shape = provider(frame, frames, m_Delta);
        draw(std::move(shape), 1);
        if(!m_Set_state) setState();
        saveFrame();
        std::clog << frame << '/' << frames << '\n';

        // delete shape; // for non unique_ptr
    }
    // copy(temp, m_Map); // can be replaced with memcpy
    memcpy(m_Map, &temp[0], temp_size);

    std::clog << "Scene Ended!\n";
}




// ----------------------- Video Related Functions ----------------------- //

void map::Mapper::saveFrame(){
    assert(m_FPS > 0 && "FPS must be greater than 0!");

    const std::string command = "convert " PPM_OUTPUT_PATH + m_Filename + " " VIDEO_TEMP_PATH MANGLED_PNG(m_Current_frame);
    std::system(command.c_str());
    m_Current_frame++;
}


void map::Mapper::render(const std::string& output_file) const {
    assert(m_FPS > 0 && "FPS must be greater than 0!");

    std::string video_command =
        "ffmpeg -framerate " + std::to_string(m_FPS) +
        " -i " VIDEO_TEMP_PATH MANGLED "%d.png -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p ";
    
    video_command += m_Sounds.size() ? VIDEO_TEMP_PATH MANGLED_MP4 : VIDEO_OUTPUT_PATH + output_file;

	std::system(video_command.c_str());

    if(auto size = m_Sounds.size(); size){

        // std::string audio_command = "ffmpeg -i " VIDEO_TEMP_PATH MANGLED_MP4;
        Command audio_command;
        audio_command.addInput(VIDEO_TEMP_PATH MANGLED_MP4);

        // getting unique sounds
        std::set<shapes::Audio, decltype([](const auto &a, const auto &b){ return a.filename < b.filename; })> sounds;
        for(const auto& [sound, frame] : m_Sounds) sounds.insert(sound);

        // adding all the sounds to the command
        for(const auto &sound : sounds){
            audio_command.addInput(AUDIO_INPUT_PATH + sound.filename);
        }


        // audio_command += " -filter_complex \""; // begin filter_complex
        audio_command.startFilter();

        // applying the filters to every sound
        for(size_t i = 0; i < size; ++i){
            // finding the index of the sound in the set
            size_t index = 1;
            for(const auto &sound : sounds){
                if(m_Sounds[i].first.filename == sound.filename) break; // there will be only one sound with the same filename bc it's a set, so it's fine to break early

                ++index;
            }


            audio_command.pickInput(index);

            // every sound must have a delay (0 delay is beginning of the video)
            const size_t delay = m_Sounds[i].second * 1'000 / m_FPS; // in milliseconds
            audio_command.addDelay(delay);

            if(m_Sounds[i].first.speed - 1 > std::numeric_limits<double>::epsilon()) // speed != 1
                audio_command.addSpeed(m_Sounds[i].first.speed);
            
            if(m_Sounds[i].first.loop)
                audio_command.addLoop();
        }

        if(size > 1){
            audio_command.mixAudios();
        }

        audio_command.endFilter();

        audio_command.addOutput(VIDEO_OUTPUT_PATH + output_file);


        // std::clog << "\n\n" << audio_command.getCommand() << "\n\n";
        std::system(audio_command.getCommand().c_str());
    
    }
}


void map::Mapper::clearFrames() const {
    assert(m_FPS > 0 && "FPS must be greater than 0!");

    std::system("rm " VIDEO_TEMP_PATH "*.png");
    std::system(("rm " + (PPM_OUTPUT_PATH + m_Filename)).c_str());

    if(m_Sounds.size()) std::system("rm " VIDEO_TEMP_PATH MANGLED_MP4);
}


// ----------------------- Operators ----------------------- //

map::clr::RGB &map::Mapper::operator[](const Point& p){
    return m_Map[size_t(p.y) * m_Size.width + size_t(p.x)];
}


map::clr::RGB &map::Mapper::at(const Point& p){
    return m_Map[size_t(p.y) * m_Size.width + size_t(p.x)];
}


map::clr::RGB &map::Mapper::operator[](size_t i){
    assert(i < m_Size.height * m_Size.width);
    return m_Map[i];
}

map::clr::RGB &map::Mapper::at(size_t i){
    assert(i >= 0 && i < m_Size.height * m_Size.width);
    return m_Map[i];
}

// void map::Mapper::operator=(map::Mapper &&other){
//     m_Filename = other.m_Filename;
//     m_Filename_vid = other.m_Filename_vid;
//     m_PType = other.m_PType;
//     m_Size = other.m_Size;
//     m_Max = other.m_Max;

//     if(m_Map) delete[] m_Map;
//     m_Map = other.m_Map;
//     other.m_Map = nullptr;

//     m_Set_state = other.m_Set_state;
//     m_FPS = other.m_FPS;
//     m_Current_frame = other.m_Current_frame;
// }


map::clr::RGB *map::Mapper::begin(){
    return m_Map;
}


map::clr::RGB *map::Mapper::end(){
    return m_Map + m_Size.height * m_Size.width;
}


/* --------------------------- Private Functions --------------------------- */

void map::Mapper::setInfo(){
    std::string fn = PPM_OUTPUT_PATH + m_Filename;
    std::ofstream fout(fn, std::ios::trunc);

    assert(fout.is_open());
    assert(areValid(m_Filename, m_PType, m_Size.height, m_Size.width, m_Max));


    fout << m_PType << std::endl;
    fout << m_Size.width << " " << m_Size.height << std::endl;
    fout << m_Max << std::endl;

    // fout.close(); // RAII handles it
}


void map::Mapper::setState(){

    setInfo();
    std::string fn = PPM_OUTPUT_PATH + m_Filename;
    std::ofstream fout(fn, std::ios::app);

    for(size_t i = 0;  i < m_Size.height; ++i){
        for(size_t j = 0; j < m_Size.width; ++j)
            fout << m_Map[i*m_Size.width + j] << " ";
        fout << '\n';
    }

    // fout.close(); // RAII handles it
}


void map::Mapper::resetFile(){
    std::clog << "RESET!\n";
    if(m_Map) delete[] m_Map;

    std::clog << "Width: " << m_Size.width << '\n';
    std::clog << "Height: " << m_Size.height << '\n';
    m_Map = new clr::RGB[m_Size.height * m_Size.width];
    fill();
}



void map::Mapper::loadFile(){
    std::clog << "LOAD!\n";
    std::string P; // P type
    std::string h; // height
    std::string w; // width
    std::string M; // mode
    
    std::string filename = PPM_OUTPUT_PATH + m_Filename;
    std::cerr << filename << std::endl;
    std::ifstream fin(filename);
    assert(fin.is_open());

    std::string spaces;

    std::getline(fin, P);
    std::clog << "P: " << P << std::endl;
    fin >> w;
    std::clog << "W: " << w << std::endl;
    fin >> h;
    std::clog << "H: " << h << std::endl;
    fin >> M;
    std::clog << "M: " << M << std::endl;


    assert(areValidString(P, h, w, M));


    m_PType = P;
    m_Size.height = std::stoul(h);
    m_Size.width = std::stoul(w);
    m_Max = std::stoul(M);

    int r;
    int g;
    int b;
    std::string garbage;
    
    if(m_Map) delete[] m_Map;
    m_Map = new clr::RGB[m_Size.height*m_Size.width];

    for(size_t i = 0; i < m_Size.height; i++){
        for(size_t j = 0; j < m_Size.width; j++){
            fin >> r >> g >> b;
            m_Map[i*m_Size.width + j] = clr::RGB(r, g, b);
        }
        std::getline(fin, garbage);
    }

    // fin.close(); // RAII takes care of it
}
