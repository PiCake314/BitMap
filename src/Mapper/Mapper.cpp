#include "Mapper.hpp"
#include "../Utility/ThreadSafeQueue.hpp"
#include "../Utility/HelperFuncs.hpp"
#include "../Utility/Command.hpp"

#include <thread>
#include <mutex>
#include <limits>

using namespace map::util;

// image mode
map::Mapper::Mapper(std::filesystem::path fn, Size size)
: m_Filename{std::move(fn)},
m_Size{size.width, size.height},
m_FPS{0}, m_Delta{0}, m_Current_frame{0},
m_PType("P3"), m_Max(255), m_Set_state(INIT_STATE), m_Root_pix_per_lock(100)
{
    resetFile();

    // maybe it's better to lazy load the default font
    // m_Fonts.push_back(fnt::Font{DEFUALT_FONT}); // default font "Minecraft"


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
map::Mapper::Mapper(std::filesystem::path fn, Size size, size_t fps)
: m_Filename(dirs::MANGLED_PPM), m_Filename_vid{std::move(fn)},
m_Size{size.width, size.height},
m_FPS{fps}, m_Delta{1./fps}, m_Current_frame{0},
m_PType{"P3"}, m_Max{255}, m_Set_state{INIT_STATE}, m_Root_pix_per_lock{0}
{
    resetFile();

    if(not std::filesystem::exists(dirs::TEMP)) // maybe the check is not needed?
        std::filesystem::create_directory(dirs::TEMP);

    // check if 

    // lazy load the default font
    // m_Fonts.push_back(fnt::Font{DEFUALT_FONT}); // default font "Minecraft"
}


map::Mapper::~Mapper(){
    if(m_Map) delete[] m_Map; // use std::unique_ptr<clr::RGB[]> or std::vector<clr::RGB> instead at some point
}


void map::Mapper::loadFont(const std::string_view fontname) {

    if(std::find_if(
        m_Fonts.begin(),
        m_Fonts.end(),
        [&fontname](const fnt::Font &f){ return f.getFontname() == fontname; }
    ) == m_Fonts.end()) // making sure the font doesn't already exist
        m_Fonts.emplace_back(fontname);
}


std::ptrdiff_t map::Mapper::loadImage(const std::filesystem::path &image_path, double scale) {
    const auto iter =
        std::find_if(
            m_Images.begin(),
            m_Images.end(),
            [&image_path, scale](const ImageBuffer &image){
                return image.getFilename() == image_path and image.getScale() == scale;
            }
        );

    if(iter == m_Images.end()){
        m_Images.emplace_back(image_path, scale);

        return m_Images.size() - 1;
    }

    // return iter - m_Images.begin();
    return std::distance(m_Images.begin(), iter);
}



// void map::Mapper::setFPS(int fps){
//     m_FPS = fps;
// }


size_t map::Mapper::getFPS() const noexcept { return m_FPS; }

void map::Mapper::doSet(){ m_Set_state = true ; }
void map::Mapper::noSet(){ m_Set_state = false; }




// void map::Mapper::setFile(std::string fn){
//     m_Filename = fn;
// }


map::Size map::Mapper::getSize() const noexcept {
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
void map::Mapper::randomize() noexcept {
    for(size_t i = 0; i < m_Size.height; i++)
        for(size_t j = 0; j < m_Size.width; j++)
            if constexpr(grey_scale){
                const auto c = rand() % 256;
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
map::clr::RGB map::Mapper::getColorAt(const Point &p){
    if(p.x >= 0 && p.x < m_Size.height && p.y >= 0 && p.y < m_Size.width)
        return m_Map[int(p.x * m_Size.width + p.y)];

    throw std::out_of_range("Invalid point");

    // return clr::RGB();
}


// deprecated
void map::Mapper::drawAt(const Point &p, clr::RGB color){
    if(p.x >= 0 && p.x < m_Size.height && p.y >= 0 && p.y < m_Size.width)
        m_Map[int(p.x*m_Size.width + p.y)] = color;

    if(m_Set_state) setState();
}



template <bool called_from_shape_class>
void map::Mapper::drawLine(const Point &p1, const Point &p2, clr::RGB color, int thickness){

    if constexpr(not called_from_shape_class) color.depth = 1;


    if(thickness < 2) thickness = 2;

    const int half_thickness = thickness/2;

    size_t i_start = std::clamp<size_t>(std::min(p1.y, p2.y) - half_thickness, 0, m_Size.height);
    size_t i_end = std::clamp<size_t>(std::max(p1.y, p2.y) + half_thickness, 0, m_Size.height);

    size_t j_start = std::clamp<size_t>(std::min(p1.x, p2.x) - half_thickness, 0, m_Size.width);
    size_t j_end = std::clamp<size_t>(std::max(p1.x, p2.x) + half_thickness, 0, m_Size.width);

    if(std::abs(p2.x - p1.x) > std::numeric_limits<double>::epsilon()){ // not equal 0
        // #pragma omp parallel for simd collapse(2)
        for(size_t i = i_start; i < i_end; i++){
            for(size_t j = j_start; j < j_end; j++){
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
        for(size_t i = i_start; i < i_end; i++){
            for(size_t j = j_start; j <=j_end; j++){
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
        std::vector<map::renderables::shapes::Line> lines;
        const size_t num_lines = points.size() - 1;
        for(size_t i = 0; i < num_lines; i++)
            lines.push_back(map::renderables::shapes::Line(points[i], points[i+1], {.color = color, .thickness = thick}));

        lines.push_back(map::renderables::shapes::Line(points.back(), points.front(), {.color = color, .thickness = thick}));
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
void map::Mapper::drawRect(double height, double width, Point center, clr::RGB color, bool filled, bool thick , Alignment alignment){

    if constexpr(not called_from_shape_class){
        color.depth = 1;
    }


    if(height < 0) height = m_Size.height/10;
    if(width < 0) width   = m_Size.height/10;

    if(height < 1)
        height *= m_Size.height;
    
    if(width < 1)
        width *= m_Size.width;

    if(center.x < 1)
        center.x *= m_Size.height;

    if(center.y < 1)
        center.y *= m_Size.width;


    switch (alignment){
        case Alignment::center:
            center.x = m_Size.width/2;
            center.y = m_Size.height/2;
            break;

        case Alignment::none:
            break;
    }


    if(filled){
        size_t i_start = size_t(std::max(center.y - height/2 - 1, 0.));
        size_t i_end = size_t(std::min(center.y + height/2, double(m_Size.height)));

        size_t j_start = size_t(std::max(center.x - width/2 - 1, 0.));
        size_t j_end = size_t(std::min(center.x + width/2, double(m_Size.width)));
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
        const double cxmw = std::max(center.x - width/2 - 1, 0.);
        const double cymh = std::max(center.y - height/2 - 1, 0.);
        const double cyph = std::min(center.y + height/2 - 1, m_Size.height -1.);
        const double cxpw = std::min(center.x + width/2 - 1, m_Size.width -1.);

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

template void map::Mapper::drawRect<true> (double, double, Point, clr::RGB, bool, bool, Alignment);
template void map::Mapper::drawRect<false>(double, double, Point, clr::RGB, bool, bool, Alignment);

// template <>
// void map::Mapper::drawRect<false>(Point center, double h, double w, clr::RGB color, bool filled, bool thick, RectAlignment alignment){
//     color.depth = 1;
//     drawRect<true>(center, h, w, color, filled, thick, alignment);
// }


template <bool called_from_shape_class>
void map::Mapper::drawCircle(int r, Point center, clr::RGB color, bool filled, bool inverted, int thickness, Alignment alignment){

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

template void map::Mapper::drawCircle<true> (int, Point, clr::RGB, bool, bool, int, Alignment);
template void map::Mapper::drawCircle<false>(int, Point, clr::RGB, bool, bool, int, Alignment);


// !!! so apparently these templates need to be instantiated manually (why?) and the function bellow was doing that for me. The 2 lines above are need to explicitly instantiate the templates but I'm not sure why the compiler cannot do that on its own..
// template <>
// void map::Mapper::drawCircle<false>(Point center, int r, clr::RGB color, bool filled, bool inverted, int thickness, Alignment alignment){
//     color.depth = 1;
//     drawCircle<true>(center, r, color, filled, inverted, thickness, alignment);
// }


template <bool called_from_shape_class>
void map::Mapper::drawEllipse(const Point &center, int r1, int r2, clr::RGB color, bool filled, bool inverted, int thickness, Alignment alignment){

    if constexpr(not called_from_shape_class) color.depth = 1;


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
    if(m_Fonts.size() == 0) throw std::runtime_error("No fonts loaded");

    if(fontname == "") fontname = m_Fonts.back().getFontname(); // default to the latest font added

    const auto iter = std::find_if(
        m_Fonts.begin(),
        m_Fonts.end(),
        [fontname](const fnt::Font &f){ return f.getFontname() == fontname; }
    );
    assert(iter != m_Fonts.end() && "Font not found");

    const fnt::Font &font = *iter;

    // calculating the center of the text
    const size_t textHeight = font['a'].size.height + size_t(font['a'].offset.y);
    const size_t textWidth = std::accumulate(text.begin(), text.end(), 0, [&font](size_t acc, char c){ return acc + font[c].offset.x + font[c].xadvance; });


    switch(alignment){
        case Alignment::center:
            center.x = (m_Size.width/2);
            center.y = (m_Size.height/2);
            break;

        case Alignment::top:
            center.x = (m_Size.width/2);
            center.y = 0;
            break;

        case Alignment::bottom:
            center.x = (m_Size.width/2);
            center.y = m_Size.height;
            break;

        case Alignment::left:
            center.x = 0;
            center.y = (m_Size.height/2);
            break;

        case Alignment::right:
            center.x = m_Size.width;
            center.y = (m_Size.height/2);
            break;

        case Alignment::none:
            break;
    }

    const ssize_t i_base = center.y - textHeight/2;
    ssize_t j_start = center.x - textWidth/2;

    const clr::RGB &transparent_color = font.getTransparentColor();

    // drawing the text
    for(char c : text){
        const fnt::Letter &l = font[c];

        const ssize_t i_start = i_base + l.offset.y;
        j_start += l.offset.x;

        for(ssize_t i = std::max(i_start, ssize_t(0)); i < i_start + l.size.height; ++i){
            for(ssize_t j = std::max(j_start, ssize_t(0)); j < j_start + l.size.width; ++j){
                if(safePoint({j, i})){
                    const clr::RGB &pixel = l.buffer[(i - i_start)*l.size.width + (j - j_start)];

                    if(pixel != transparent_color ){
                        m_Map[i*m_Size.width + j] = pixel;
                    }
                }
            }
        }

        j_start += l.xadvance + font.getSpacing().width;
    }

    if(m_Set_state) setState();
}



void map::Mapper::drawImage(const std::filesystem::path &path, Point point, const double scale, const Alignment alignment){

    const ssize_t index = loadImage(path, scale);
    const auto &image = m_Images[index];
    const Size size = image.getSize();


    if(alignment != Alignment::none) point = align(alignment, m_Size, size);


    const ssize_t i_start = point.y - size.height/2;
    const ssize_t j_start = point.x - size.width/2;

    const ssize_t i_end = std::min<ssize_t>(point.y + size.height/2, m_Size.height);
    const ssize_t j_end = std::min<ssize_t>(point.x + size.width/2, m_Size.width);



    for(ssize_t i = std::max<ssize_t>(i_start, 0); i < i_end; ++i){
        for(ssize_t j = std::max<ssize_t>(j_start, 0); j < j_end; ++j){
            const clr::RGB &pixel = image[(i - i_start)*size.width + (j - j_start)];

            if(safePoint({j, i}) and pixel != image.getTransparentColor()){
                m_Map[i * m_Size.width + j] = pixel;
            }
        }
    }


    if(m_Set_state) setState();
}


void map::Mapper::drawLatex(const std::string_view latex, Point point, const double scale, const Alignment alignment) {
    map::renderables::Latex l{latex, point, {.scale = scale, .alignment = alignment}};
    draw(l);
}




void map::Mapper::draw(map::renderables::Renderable &s){
    s.draw(this);
}


template <bool locked>
void map::Mapper::draw(const map::renderables::RenderablePtr s){


    s->draw(this);

    // ! Fix multithreading at some point..
    // if constexpr(locked){
    //     std::vector<std::unique_lock<std::mutex>> locks;
    //     for(auto [i, j] : s->getLocks(m_Size, m_Root_pix_per_lock)){
    //         locks.emplace_back(m_Locks[i][j]);
    //     }

    //     s->draw(this);
    // }
    // else s->draw(this);
}



void map::Mapper::draw(std::vector<renderables::RenderablePtr> &&shapes_vec, const int num_threads){
    // naive implementation
    if(num_threads == 1){
        for(auto &shape : shapes_vec){
            draw(std::move(shape));
        }

        return;
    }

    // map::util::ThreadSafeQueue queue{std::move(shapes_vec)};
    // constexpr bool multithreaded = true;

    // std::vector<std::thread> threads;
    // bool s = m_Set_state;
    // m_Set_state = false;
    // for(int i = 0; i < num_threads; ++i){
    //     threads.emplace_back([&queue, this]{
    //         while(!queue.isEmpty()){
    //             renderables::RenderablePtr shape = queue.dequeue();
    //             draw<multithreaded>(std::move(shape));
    //         }
    //     });
    // }

    // for(auto &thread : threads) thread.join();

    // m_Set_state = s;

    if(m_Set_state) setState();
}


void map::Mapper::bezierCurve(std::vector<Point> pts, double dt, clr::RGB color, bool thick) {
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

    if(m_Set_state = s; m_Set_state) setState();
}



void map::Mapper::plot(ssize_t(*func)(size_t), clr::RGB color, size_t thickness){
    for (size_t j = 0; j < m_Size.width; ++j){
        // size_t value = (func(int(j) - int(m_Size.width)/2) + m_Size.height/2);
        const auto value = func(j);



        for(size_t y = std::max<size_t>(value - thickness, 0); y < std::min<size_t>(value + thickness, m_Size.height); ++y){
            for(size_t x = std::max<size_t>(j - thickness, 0); x < std::min<size_t>(j + thickness, m_Size.width); ++x){
                if(safePoint({x, y}) and Point::distSqrd({j, value}, {x, y}) <= std::pow(thickness/2., 2)){
                    m_Map[y*m_Size.width + x] = color;
                }
            }
        }


        // bool safe = safePoint({j, value});
        // if (){
        //     auto &pixel = m_Map[value*m_Size.width + j];
        //     // if(color.depth > pixel.depth) 
        //     pixel = color;
        // }
    }

    if(m_Set_state) setState();
}



void map::Mapper::plot(double(*func)(double, double), double(*res)(double, double), clr::RGB color){
    for (size_t i = 0; i < m_Size.height; i++)
        for (size_t j = 0; j < m_Size.width; j++){
            if (abs(func(j - m_Size.width/2, m_Size.height/2 - i) - (res(j - m_Size.width/2, m_Size.height/2 - i))) <= 5){
                auto &pixel = m_Map[i*m_Size.width + j];
                // if(color.depth > pixel.depth) 
                pixel = color;
            }
        }

    if(m_Set_state) setState();
}



void map::Mapper::plot(bool (*func)(size_t x, size_t y), clr::RGB color){
    for (size_t i = 0; i < m_Size.height; ++i)
        for (size_t j = 0; j < m_Size.width; ++j){
            if (func(j, i)){
                auto &pixel = m_Map[i*m_Size.width + j];
                // if(color.depth > pixel.depth) 
                pixel = color;
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


void map::Mapper::animate(map::renderables::RenderablePtr (*provider)(const size_t, const size_t, const double), const std::chrono::duration<double> &duration){
    assert(m_FPS > 0 && "FPS must be greater than 0!");

    std::filesystem::create_directories(map::dirs::TEMP);


    std::clog << "Beginning Scene:\n";
    const size_t frames = size_t(std::chrono::duration_cast<std::chrono::seconds>(duration).count() * m_FPS);

    std::vector<clr::RGB> temp(m_Map, m_Map + m_Size.width * m_Size.height);
    const size_t temp_size = temp.size() * sizeof(clr::RGB);

    for(size_t frame = 0; frame <= frames; ++frame){
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


void map::Mapper::animate(map::renderables::Renderables (*provider)(const size_t, const size_t, const double), const std::chrono::duration<double> &duration){
    assert(m_FPS > 0 && "FPS must be greater than 0!");

    std::filesystem::create_directories(map::dirs::TEMP);


    std::clog << "Beginning Scene:\n";
    const size_t frames = size_t(std::chrono::duration_cast<std::chrono::seconds>(duration).count() * m_FPS);

    std::vector<clr::RGB> temp(m_Map, m_Map + m_Size.width * m_Size.height);
    const size_t temp_size = temp.size() * sizeof(clr::RGB);

    for(size_t frame = 0; frame <= frames; frame++){
        // copy(temp, m_Map); // can be replaced with memcpy
        memcpy(m_Map, &temp[0], temp_size);
        // auto shape = provider(frame, frames, m_Delta);
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


void map::Mapper::wait(const std::chrono::duration<double> &duration) noexcept {
    const size_t frames = size_t(std::chrono::duration_cast<std::chrono::seconds>(duration).count() * m_FPS);

    for(size_t i = 0; i < frames; ++i){
        std::clog << "wait: " << i << '/' << frames << '\n';

        saveFrame();
    }
}


// ----------------------- Video Related Functions ----------------------- //

void map::Mapper::saveFrame() {
    assert(m_FPS > 0);
    // if(m_FPS <= 0) throw std::runtime_error("FPS must be greater than 0!");

    using std::operator""s;

    const std::string command = "magick "s + m_Filename.string() + " " + (dirs::TEMP / pngMangledWithFrame(m_Current_frame)).string();
    std::system(command.c_str());

    ++m_Current_frame;
}


void map::Mapper::render() const {
    assert(m_FPS > 0 && "FPS must be greater than 0!");

    using std::operator""s;

    std::filesystem::create_directories(map::dirs::TEMP);


    std::string video_command =
        ("ffmpeg -framerate " + std::to_string(m_FPS) + " -i ") +
        (map::dirs::TEMP / (map::dirs::MANGLED.c_str() + "%d.png"s)).c_str() + " -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p ";

    // are there any audios?
    video_command += m_Sounds.size() ? map::dirs::TEMP / map::dirs::MANGLED_MP4 : m_Filename_vid;

	std::system(video_command.c_str());

    if(auto size = m_Sounds.size(); size){

        Command audio_command;
        audio_command.addInput(map::dirs::TEMP / map::dirs::MANGLED_MP4);

        // getting unique sounds
        std::set<renderables::Audio, decltype([](const auto &a, const auto &b){ return a.filename < b.filename; })> sounds;
        for(const auto& [sound, frame] : m_Sounds) sounds.insert(sound);

        // adding all the sounds to the command
        for(const auto &sound : sounds){
            audio_command.addInput(sound.filename);
        }


        // audio_command += " -filter_complex \""; // begin filter_complex
        audio_command.startFilter();

        // applying the filters to every sound
        for(size_t i{}; i < size; ++i){
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

        audio_command.addOutput(m_Filename_vid);


        // std::clog << "\n\n" << audio_command.getCommand() << "\n\n";
        std::system(audio_command.getCommand().c_str());
    
    }
}


void map::Mapper::clearFrames() const {
    // assert(m_FPS > 0 && "FPS must be greater than 0!");
    if(m_FPS <= 0) throw std::runtime_error("FPS must be greater than 0!");

    using std::operator""s;

    std::system(("rm "s + (map::dirs::TEMP / "*.png").string()).c_str());
    std::system(("rm "s + m_Filename.string()).c_str());

    if(m_Sounds.size()) std::system(("rm " / map::dirs::TEMP / map::dirs::MANGLED_MP4).c_str());
}


// ----------------------- Operators ----------------------- //

map::clr::RGB& map::Mapper::operator[](const Point& p) noexcept {
    return m_Map[size_t(p.y) * m_Size.width + size_t(p.x)];
}

map::clr::RGB& map::Mapper::operator[](const size_t i) noexcept {
    return m_Map[i];
}


map::clr::RGB& map::Mapper::at(const Point& p){
    if(not safePoint(p)) throw std::out_of_range("Point out of range");

    return m_Map[size_t(p.y) * m_Size.width + size_t(p.x)];
}

map::clr::RGB& map::Mapper::at(const size_t i){
    if(i < 0 or i >= m_Size.height * m_Size.width) throw std::out_of_range("Index out of range");

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


map::clr::RGB *map::Mapper::begin() noexcept {
    return m_Map;
}

map::clr::RGB *map::Mapper::end() noexcept {
    return m_Map + m_Size.height * m_Size.width;
}

const map::clr::RGB *map::Mapper::cbegin() const noexcept {
    return m_Map;
}

const map::clr::RGB *map::Mapper::cend() const noexcept {
    return m_Map + m_Size.height * m_Size.width;
}


/* --------------------------- Private Functions --------------------------- */

void map::Mapper::setInfo(){
    // Ensuring the directories exists
    // std::filesystem::create_directories(map::dirs::PPMS_DIR);

    std::ofstream fout(m_Filename, std::ios::trunc);

    assert(fout.is_open());
    assert(areValid(m_Filename.c_str(), m_PType, m_Size.height, m_Size.width, m_Max));


    fout << m_PType << std::endl;
    fout << m_Size.width << " " << m_Size.height << std::endl;
    fout << m_Max << std::endl;

    // fout.close(); // RAII handles it
}


void map::Mapper::setState(){
    setInfo();

    std::ofstream fout(m_Filename, std::ios::app);

    for(size_t i = 0;  i < m_Size.height; ++i){
        for(size_t j = 0; j < m_Size.width; ++j)
            fout << m_Map[i*m_Size.width + j] << " ";
        fout << '\n';
    }

    // fout.close(); // RAII handles it
}


void map::Mapper::resetFile(){
    if(m_Map) delete[] m_Map;

    m_Map = new clr::RGB[m_Size.height * m_Size.width];

    fill();
}



// void map::Mapper::loadFile(){
//     std::clog << "LOAD!\n";
//     std::string P; // P type
//     std::string h; // height
//     std::string w; // width
//     std::string M; // mode
    
//     std::string filename = PPM_OUTPUT_PATH + m_Filename;
//     std::cerr << filename << std::endl;
//     std::ifstream fin(filename);
//     assert(fin.is_open());

//     std::string spaces;

//     std::getline(fin, P);
//     std::clog << "P: " << P << std::endl;
//     fin >> w;
//     std::clog << "W: " << w << std::endl;
//     fin >> h;
//     std::clog << "H: " << h << std::endl;
//     fin >> M;
//     std::clog << "M: " << M << std::endl;


//     assert(areValidString(P, h, w, M));


//     m_PType = P;
//     m_Size.height = std::stoul(h);
//     m_Size.width = std::stoul(w);
//     m_Max = std::stoul(M);

//     int r;
//     int g;
//     int b;
//     std::string garbage;
    
//     if(m_Map) delete[] m_Map;
//     m_Map = new clr::RGB[m_Size.height*m_Size.width];

//     for(size_t i = 0; i < m_Size.height; i++){
//         for(size_t j = 0; j < m_Size.width; j++){
//             fin >> r >> g >> b;
//             m_Map[i*m_Size.width + j] = clr::RGB(r, g, b);
//         }
//         std::getline(fin, garbage);
//     }

//     // fin.close(); // RAII takes care of it
// }
