#include "Mapper.hpp"
#include "../Structs/Shapes/Shapes.hpp"
#include "HelperFuncs.cpp"

#define INIT_STATE false

// image mode
map::Mapper::Mapper(std::string fn, Size size, Loadtype type)
: m_Filename(fn), m_Size{size.height, size.width}, m_FPS(0), m_Current_frame(0), m_PType("P3"), m_Max(255), m_Set_state(INIT_STATE), m_XCenter(0), m_YCenter(0)
{
    assert(fn.length() > 4 );
    assert(fn.substr(fn.length()-4, 4) == ".ppm");
    

    if(type == Loadtype::edit) loadFile();
    else resetFile();
}

// video mode
map::Mapper::Mapper(std::string fn, Size size, int fps, Loadtype type)
: m_Filename(MANGLED_PPM), m_Filename_vid(fn), m_Size{size.height, size.width}, m_FPS(fps), m_Current_frame(0), m_PType("P3"), m_Max(255), m_Set_state(INIT_STATE), m_XCenter(0), m_YCenter(0)
{
    assert(fn.length() > 4 );
    assert(fn.substr(fn.length()-4, 4) == ".mp4");

    if(type == Loadtype::edit) loadFile();
    else resetFile();
}


map::Mapper::~Mapper(){
    if(m_Map) delete[] m_Map;
}


void map::Mapper::loadFont(const std::string &fnt, const std::string &ppm, clr::RGB transparent_color){
    fnt::FontLoader(m_Letters, m_Spacing, fnt, ppm);
    std::clog << "Font loaded" << std::endl;
    m_Transparent_color = transparent_color;
}


void map::Mapper::setFPS(int fps){
    m_FPS = fps;
}


int map::Mapper::getFPS() const{
    return m_FPS;
}


void map::Mapper::doSet(){
    m_Set_state = true;
}


void map::Mapper::noSet(){
    m_Set_state = false;
}


void map::Mapper::setState(){

    setInfo();
    std::string fn = OUTPUT_PATH + m_Filename;
    std::ofstream fout(fn, std::ios::app);

    for(int i=0; i<m_Size.height; i++){
        for(int j=0; j<m_Size.width; j++)
            fout << m_Map[i*m_Size.width + j] << " ";
        fout << '\n';
    }

    fout.close();
}


void map::Mapper::setFile(std::string fn){
    m_Filename = fn;
}


map::Size map::Mapper::getSize() const{
    return m_Size;
}



void map::Mapper::fillWhite(){
    for(int i=0; i<m_Size.height; i++)
        for(int j=0; j<m_Size.width; j++)
            m_Map[i*m_Size.width + j] = map::clr::RGB(255, 255, 255);

    if(m_Set_state) setState();
}



void map::Mapper::fill(map::clr::RGB color){
    for(int i=0; i<m_Size.height; i++)
        for(int j=0; j<m_Size.width; j++)
            *(m_Map + i * m_Size.width + j) = color;
    
    if(m_Set_state) setState();
}



void map::Mapper::randomize(){
    srand(time(0));

    for(int i=0; i<m_Size.height; i++)
        for(int j=0; j<m_Size.width; j++)
            *(m_Map + i * m_Size.width + j) = map::clr::RGB(rand()%256, rand()%256, rand()%256);

    if(m_Set_state) setState();
}



void map::Mapper::randomizeGrey(){
    srand(time(0));

    for(int i=0; i<m_Size.height; i++)
        for(int j=0; j<m_Size.width; j++){
            int c = rand()%256;
            *(m_Map + i * m_Size.width + j) = map::clr::RGB(c, c, c);
        }

    if(m_Set_state) setState();
}



map::clr::RGB map::Mapper::getColorAt(Point p){
    if(p.x >= 0 && p.x < m_Size.height && p.y >= 0 && p.y < m_Size.width)
        return *(m_Map + int(p.x * m_Size.width + p.y));

    return map::clr::RGB();
}



void map::Mapper::drawAt(Point p, map::clr::RGB color){
    if(p.x >= 0 && p.x < m_Size.height && p.y >= 0 && p.y < m_Size.width)
        m_Map[int(p.x*m_Size.width + p.y)] = color;

    if(m_Set_state) setState();
}



void map::Mapper::drawLine(Point p1, Point p2, map::clr::RGB color, int thickness){

    int i_start = std::clamp(std::min(p1.y, p2.y), 0., m_Size.height-1.);
    int i_end = std::clamp(std::max(p1.y, p2.y), 0., m_Size.height - 1.);

    int j_start = std::clamp(std::min(p1.x, p2.x), 0., m_Size.width - 1.);
    int j_end = std::clamp(std::max(p1.x, p2.x), 0., m_Size.width - 1.);


    if(p2.x - p1.x != 0){
        // #pragma omp parallel for simd collapse(2)a
        for(int i = i_start; i <= i_end; i++){
            for(int j = j_start; j <= j_end; j++){
                if(distFromLine(p1, p2, {float(j), float(i)}) <= (thickness/2)*(thickness/2)){
                    m_Map[i*m_Size.width + j] = color;
                }
            }
        }
    }
    else for(int i = i_start; i <= i_end; i++){
            for(int j = j_start; j < j_end; j++){
                m_Map[i*m_Size.width + j] = color;
            }
        }

    if(m_Set_state) setState();
}



void map::Mapper::drawTri(Point p1, Point p2, Point p3, map::clr::RGB color, int thickness){
    bool s = m_Set_state;
    m_Set_state = false;

    drawLine(p1, p2, color, thickness);
    drawLine(p2, p3, color, thickness);
    drawLine(p1, p3, color, thickness);

    m_Set_state = s;

    if(m_Set_state) setState();
}



void map::Mapper::drawFourPoints(Point points[], map::clr::RGB color, bool thick){

    // orderFourPoints(points);

    Point p1 = points[0];
    Point p2 = points[1];
    Point p3 = points[2];
    Point p4 = points[3];

    float slope1 = (p2.y - p1.y)/(p2.x - p1.x);
    float b1 = p1.y - slope1*p1.x;

    float slope2 = (p3.y - p2.y)/(p3.x - p2.x);
    float b2 = p2.y - slope2*p2.x;

    float slope3 = (p4.y - p3.y)/(p4.x - p3.x);
    float b3 = p3.y - slope3*p3.x;

    float slope4 = (p1.y - p4.y)/(p1.x - p4.x);
    float b4 = p4.y - slope4*p4.x;

    for(int i = 0; i < m_Size.height; i++)
        for(int j = 0; j < m_Size.width; j++)
            if(
                i >= int(slope1*j + b1)+thick &&
                (p2.x == p3.x ? j <= p2.x : i >= int(slope2*j + b2)+thick) &&
                i <= int(slope3*j + b3)+thick &&
                (p1.x == p4.x ? j >= p1.x : i <= int(slope4*j + b4)+thick)
            )
                    m_Map[i*m_Size.width + j] = color;


    if(m_Set_state) setState();
}



void map::Mapper::drawMulti(std::vector<Point> points, map::clr::RGB color, bool thick){
    assert(points.size() >= 2);
    int limit = points.size() - 1;
    for(int i = 0; i < limit; i++)
        drawLine(points[i], points[i+1], color, thick);


    if(m_Set_state) setState();
}



void map::Mapper::drawRect(Point center, float height, float width, map::clr::RGB color, bool filled, bool thick , RectAlignment alignment){
    if(height < 0) height = m_Size.height/10;
    


    if(width < 0) width = m_Size.height/10;

    if(height < 1)
        height *= m_Size.height;
    
    if(width < 1)
        width *= m_Size.width;

    if(center.x < 1)
        center.x *= m_Size.height;

    if(center.y < 1)
        center.y *= m_Size.width;


    switch (alignment){
        case RectAlignment::Rcenter:
            center.x = m_Size.width/2;
            center.y = m_Size.height/2;
            break;

        case RectAlignment::Rtop_left:
            center.x = width/2;
            center.y = height/2;
            break;

        case RectAlignment::Rtop_right:
            center.x = m_Size.width - width/2;
            center.y = height/2;
            break;

        case RectAlignment::Rbottom_left:
            center.x = width/2;
            center.y = m_Size.height - height/2;
            break;

        case RectAlignment::Rbottom_right:
            center.x = m_Size.width - width/2;
            center.y = m_Size.height - height/2;
            break;

        case RectAlignment::Rwidth:
            width = m_Size.width;
            center.x = m_Size.width/2;
            break;
        
        case RectAlignment::Rheight:
            height = m_Size.height;
            center.y = m_Size.height/2;
            break;
        
        case RectAlignment::Rnone:
            break;
    }


    if(filled){
        int i_start = std::max(center.y - height/2 - 1, 0.0);
        int i_end = std::min(center.y + height/2, (double)m_Size.height);

        int j_start = std::max(center.x - width/2 - 1, 0.0);
        int j_end = std::min(center.x + width/2, (double)m_Size.width);

        for(int i = i_start; i <= i_end; i++){
            for(int j = j_start; j <= j_end; ++j){
                if(i >= 0 && i < m_Size.height && j >= 0 && j < m_Size.width)
                m_Map[i*m_Size.width + j] = color;
            }
        }
    }
    else{
        drawLine(
            Point(center.x - height/2 - 1, center.y - width/2 - 1),
            Point(center.x - height/2 - 1, center.y + width/2 - 1),
            color, thick
        );


        drawLine(
            Point(center.x - height/2 - 1, center.y + width/2 - 1),
            Point(center.x + height/2 - 1, center.y + width/2 - 1),
            color, thick
        );


        drawLine(
            Point(center.x + height/2 - 1, center.y + width/2 - 1),
            Point(center.x + height/2 - 1, center.y - width/2 - 1),
            color, thick
        );


        drawLine(
            Point(center.x + height/2 - 1, center.y - width/2 - 1),
            Point(center.x - height/2 - 1, center.y - width/2 - 1),
            color, thick
        );
    }

    if(m_Set_state) setState();
}



void map::Mapper::drawCircle(Point center, int r, map::clr::RGB color, bool filled, bool inverted, int thickness, Alignment alignment){
    thickness = thickness < 2 ? 2 : thickness;

    if(r < 0) r = m_Size.height/10;

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
            center.x = m_Size.width - r;
            center.y = (m_Size.height/2);
            break;

        case Alignment::left:
            center.x = (m_Size.width/2);
            center.y = 0;
            break;

        case Alignment::right:
            center.x = (m_Size.width/2);
            center.y = m_Size.height - r;
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

    int i_start = center.y - r >= 0 ? center.y - r : 0;
    int j_start = center.x - r >= 0 ? center.x - r : 0;

    int i_end = center.y + 2*r < m_Size.height ? center.y + 2*r : m_Size.height;
    int j_end = center.x + 2*r < m_Size.width ? center.x + 2*r : m_Size.width;

    if(inverted){
        for(int i = 0; i < m_Size.height; i++)
            for(int j = 0; j < m_Size.width; j++)
                if(-((i - center.y) * (i - center.y) + (j-center.x)*(j-center.x)) <= -r*r)
                    m_Map[i*m_Size.width + j] = color;
    }
    else if(filled){
        for(int i = i_start; i < i_end; i++)
            for(int j = j_start; j < j_end; j++)
                if(((i - center.y) * (i - center.y) + (j - center.x) * (j - center.x)) <= r*r)
                        m_Map[i*m_Size.width + j] = color;
    }
    else
        for(int i = i_start; i < i_end; i++)
            for(int j = j_start; j < j_end; j++)
                if(
                    (i-center.y)*(i-center.y) + (j-center.x)*(j-center.x) >= r*r - thickness*r
                 && (i-center.y)*(i-center.y) + (j-center.x)*(j-center.x) <= r*r + r
                )
                    m_Map[i*m_Size.width + j] = color;

    // for(int i=top; i<top+2*r; i++){
    //     for(int j=left; j<left+2*r; j++){
    //         if((i-topMid)*(i-topMid0) + (j-leftMid)*(j-leftMid) <= r*r){
    //             map[i*s.width + j] = color;
    //         }
    //     }
    // }

    if(m_Set_state) setState();
}



void map::Mapper::drawEllipse(Point center, int r1, int r2, map::clr::RGB color, bool filled, bool inverted, int thickness, Alignment alignment){
    float thick = float(thickness) / 100;

    if(r1 < 0) r1 = m_Size.height/10;
    
    if(r2 < 0) r2 = m_Size.height/10;

    int top = center.y - r1;
    int left = center.x - r2;


    switch (alignment){
        case Alignment::center:
            top = (m_Size.height/2) - r1;
            left = (m_Size.width/2) - r2;
            break;

        case Alignment::top:
            top = 0;
            left = (m_Size.width/2) - r2;
            break;

        case Alignment::bottom:
            top = m_Size.height - 2*r1;
            left = (m_Size.width/2) - r2;
            break;

        case Alignment::left:
            top = (m_Size.height/2) - r1;
            left = 0;
            break;

        case Alignment::right:
            top = (m_Size.height/2) - r1;
            left = m_Size.width - 2*r2;
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
        map::clr::RGB invColor = color.inverted();
        for(int i = 0; i < m_Size.height; i++){
            for(int j = 0; j < m_Size.width; j++){
                float equation = std::pow((i - top - r1), 2) / std::pow(r1, 2) + std::pow((j - left - r2), 2) / std::pow(r2, 2);


                if(equation > 1){
                    m_Map[i * m_Size.width + j] = invColor;
                }
            }
        }
    }
    else if(filled){
        for(int i = std::max(top, 0); i < std::min(top + 2 * r1,  m_Size.height); i++){
            for(int j = std::max(left, 0); j <= std::min(left + 2 * r2, m_Size.width); j++){
                float equation = std::pow((i - top - r1), 2) / std::pow(r1, 2) + std::pow((j - left - r2), 2) / std::pow(r2, 2);

                if(equation <= 1){
                    m_Map[i * m_Size.width + j] = color;
                }
            }
        }
    }
    else for(int i = std::max(top, 0); i < std::min(top + 2 * r1 + 1,  m_Size.height); i++){
        for(int j = std::max(left, 0); j <= std::min(left + 2 * r2 + 1, m_Size.width); j++){
            float equation = std::pow((i - top - r1), 2) / std::pow(r1, 2) + std::pow((j - left - r2), 2) / std::pow(r2, 2);

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



void map::Mapper::drawText(std::string_view text, Point center, Alignment alignment){
    assert(m_Letters.size() > 0 && "No font loaded");
 
    // calculating the center of the text
    int textHeight = m_Letters['a'].height + m_Letters['a'].yoffset;
    int textWidth = 0;
    for(char c : text){
        textWidth += m_Letters[c].xoffset;
        textWidth += m_Letters[c].width;
        textWidth += m_Letters[c].xadvance;
    }

    int i_start = std::max(center.y - textHeight/2, 0.0);
    int j_start = std::max(center.x - textWidth/2, 0.0);

    // switch (alignment){
    //     case Alignment::center:
    //         center.x = (m_Size.width/2) - textWidth/2;
    //         center.y = (m_Size.height/2) - textHeight/2;
    //         break;

    //     case Alignment::top:
    //         center.x = (m_Size.width/2) - textWidth/2;
    //         center.y = 0;
    //         break;

    //     case Alignment::bottom:
    //         center.x = (m_Size.width/2) - textWidth/2;
    //         center.y = m_Size.height - textHeight;
    //         break;

    //     case Alignment::left:
    //         center.x = 0;
    //         center.y = (m_Size.height/2) - textHeight/2;
    //         break;

    //     case Alignment::right:
    //         center.x = m_Size.width - textWidth;
    //         center.y = (m_Size.height/2) - textHeight/2;
    //         break;
        
    //     case Alignment::none:
    //         break;
    // }


    // drawing the text
    for(char c : text){
        fnt::Letter l = m_Letters[c - 32];
        // std::clog << char(l) << ' ';

        j_start += l.xoffset;
        i_start = l.yoffset;

        for(int i = i_start; i < i_start + l.height; i++){
            for(int j = j_start; j < j_start + l.width; j++){
                const clr::RGB &pixel = l.buffer[(i - i_start)*l.width + (j - j_start)];

                if(pixel != m_Transparent_color && safePoint({j*1., i*1.}, m_Size)){
                    m_Map[i*m_Size.width + j] = pixel;
                }
            }
        }

        j_start += l.xadvance + m_Spacing.width;
    }


    // fnt::Letter letter_c = m_Letters['c'];

    // for(int i = 0; i < letter_c.height; i++){
    //     for(int j = 0; j < letter_c.width; j++){
    //         if(letter_c.buffer[i*letter_c.width + j] != clr::BLACK){
    //             m_Map[int((center.y + i + letter_c.yoffset)*m_Size.width + center.x + j + letter_c.xoffset)] = letter_c.buffer[i*letter_c.width + j];
    //         }
    //     }
    // }

}



void map::Mapper::draw(const map::shapes::Shape *s){
    s->draw(this);

    // else if constexpr(std::is_same_v<T, Polygon>){
    //     drawPolygon(shape.pts, shape.color, shape.filled, shape.inverted);
    // }
    // else if constexpr(std::is_same_v<T, Text>){
    //     drawText(shape.text, shape.top, shape.left, shape.color, shape.alignment);
    // }
    // else if constexpr(std::is_same_v<T, Image>){
    //     drawImage(shape.img, shape.top, shape.left, shape.alignment);
    // }
    // else if constexpr(std::is_same_v<T, BezierCurve>){
    //     drawBezierCurve(shape.pts, shape.dt, shape.color, shape.thick);
    // }
}



// void map::Mapper::bezierQuadCurve(Point p1, Point p2, Point c, float dt, map::clr::RGB color, bool thick){
//     Point l1;
//     Point l2;

//     Point curr;
//     Point prev = p1;

//     bool s = m_Set_state;
//     m_Set_state = false;
//     for(float a = 0; a < 1+dt/2; a += dt){
//         l1 = lerp(p1, c, a);
//         l2 = lerp(c, p2, a);
//         curr = lerp(l1, l2, a);
    
//         drawLine(prev, curr, color, thick);
//         prev = curr;
//     }
//     m_Set_state = s;

//     if(m_Set_state) setState();
// }



void map::Mapper::bezierCurve(std::vector<Point> pts, float dt, map::clr::RGB color, bool thick){
    assert(pts.size() >= 2);

    int l = pts.size();
    
    Point curr;
    Point prev = pts[0];

    bool s = m_Set_state;
    m_Set_state = false;
    for(float a = 0; a <= 1; a += dt){
        std::vector<std::vector<Point>> lerpVec = {pts};
        for(int i = 1; i < l; i++){
            if(l + 1 - i > 1) lerpVec.push_back(std::vector<Point>());
            for(int j = 1; j < l + 1 - i; j++){
                drawLine(lerpVec[i-1][j-1], lerpVec[i-1][j], map::clr::RGB(200, 150, 0));
                lerpVec[i].push_back(lerp(lerpVec[i-1][j-1], lerpVec[i-1][j], a));
            }
        }
        curr = lerp(lerpVec[lerpVec.size()-2][0], lerpVec[lerpVec.size()-2][1], a);

        drawLine(prev, curr, color, thick);
        prev = curr;
    }
    m_Set_state = s;


    if(m_Set_state) setState();
}



void map::Mapper::plot(int(*func)(int), map::clr::RGB color, bool thick){
    for (int i = 0; i < m_Size.height; i++)
        for (int j = 0; j < m_Size.width; j++){
            int value = (m_Size.height/2 - func(j - m_Size.width/2));
            if (value <= i + thick && value >= i - thick)
                m_Map[i*m_Size.width + j] = color;
        }

    if(m_Set_state) setState();
}



void map::Mapper::plotXY(double(*func)(double, double), double(*res)(double, double), map::clr::RGB color){
    for (int i = 0; i < m_Size.height; i++)
        for (int j = 0; j < m_Size.width; j++){
            if (abs(func(j - m_Size.width/2, m_Size.height/2 - i) - (res(j - m_Size.width/2, m_Size.height/2 - i))) <= 5){
                m_Map[i*m_Size.width + j] = color;
            }
        }

    if(m_Set_state) setState();
}



void map::Mapper::plotIfTrue(bool (*func)(int x, int y), map::clr::RGB color){
    for (int i = 0; i < m_Size.height; i++)
        for (int j = 0; j < m_Size.width; j++){
            if (func(j, i)){
                m_Map[i*m_Size.width + j] = color;
            }
        }

    if(m_Set_state) setState();
}



void map::Mapper::fold(Fold f){
    // bool evenH = m_Size.height % 2 == 0;
    // bool evenW = m_Size.width % 2 == 0;

    switch (f){
        case Fold::l2r:
            for(int i = 0; i < m_Size.height; i++)
                for(int j = 0; j < m_Size.width/2; j++)
                    m_Map[(i+1)*m_Size.width - j] = m_Map[i*m_Size.width + j];
            break;

        case Fold::r2l:
            for(int i = 0; i < m_Size.height; i++)
                for(int j = 0; j < m_Size.width/2; j++)
                    m_Map[(i+1)*m_Size.width - j] = m_Map[i*m_Size.width + j];
            break;

        case Fold::t2b:

            for(int i = 0; i < m_Size.height; i++)
                for(int j = 0; j < m_Size.width/2; j++)
                    m_Map[(i+1)*m_Size.width - j] = m_Map[i*m_Size.width + j];
            break;

        case Fold::b2t:
            for(int i = 0; i < m_Size.height; i++)
                for(int j = 0; j < m_Size.width/2; j++)
                    m_Map[(i+1)*m_Size.width - j] = m_Map[i*m_Size.width + j];
            break;
    }


    if(m_Set_state) setState();
}



void map::Mapper::rotate(float angle){
    std::vector<map::clr::RGB> temp(m_Map, m_Map + m_Size.width * m_Size.height);
    
    bool s = m_Set_state;
    m_Set_state = false;
    fill();
    m_Set_state = s;

    for(int y = 0; y < m_Size.height; y++){
        for(int x = 0; x < m_Size.width; x++){
            int y2 = ((x - m_Size.width/2)*sin(angle) + (y - m_Size.height/2)*cos(angle) + m_Size.height/2);
            int x2 = ((x - m_Size.width/2)*cos(angle) - (y - m_Size.height/2)*sin(angle) + m_Size.width/2);

            if(safePoint({float(x2),float(y2)}, m_Size)){
                m_Map[y2*m_Size.width + x2] = temp[y*m_Size.width + x];
            }
        }
    }

    if(m_Set_state) setState();
}



void map::Mapper::animate(map::shapes::Shape *(*provider)(int, const int), float seconds){
    assert(m_FPS > 0 && "FPS must be greater than 0!");
    assert(m_Filename_vid != "" && "Filename must be set before calling animate()!");


    std::clog << "Beginning Scene:\n";
    int frames = seconds * m_FPS;

    std::vector<map::clr::RGB> temp(m_Map, m_Map + m_Size.width * m_Size.height);

    for(int frame = 0; frame <= frames; frame++){
        copy(temp, m_Map);
        auto shape = provider(frame, frames);
        draw(shape);
        saveFrame();
        std::clog << frame << '/' << frames << '\n';

        delete shape;
    }
    copy(temp, m_Map);

    std::clog << "Scene Ended!\n";
}


// ----------------------- Video Related Functions ----------------------- //

void map::Mapper::saveFrame(){
    std::string command = "convert " OUTPUT_PATH + m_Filename + " " VIDEO_TEMP_PATH MANGLED_PNG(m_Current_frame);
    std::system(command.c_str());
    m_Current_frame++;
}


void map::Mapper::render(const std::string &output_file) const{
	std::system(("ffmpeg -framerate " + std::to_string(m_FPS) + " -i " VIDEO_TEMP_PATH MANGLED "%d.png -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p " VIDEO_OUTPUT_PATH + output_file).c_str());
}


void map::Mapper::clearFrames() const{
    std::system("rm " VIDEO_TEMP_PATH "*.png");
}


// ----------------------- Operators ----------------------- //

map::clr::RGB &map::Mapper::operator[](Point p){
    assert(p.x >= 0 && p.x < m_Size.width && p.y >= 0 && p.y < m_Size.height);
    return m_Map[int(p.y * m_Size.width + p.x)];
}


map::clr::RGB &map::Mapper::operator[](int i){
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
    std::string fn = OUTPUT_PATH + m_Filename;
    std::ofstream fout(fn, std::ios::trunc);

    assert(fout.is_open() == true);
    assert(areValid(m_Filename, m_PType, m_Size.height, m_Size.width, m_Max) == true);


    fout << m_PType << std::endl;
    fout << m_Size.width << " " << m_Size.height << std::endl;
    fout << m_Max << std::endl;

    fout.close();
}



void map::Mapper::resetFile(){
    std::clog << "RESET!\n";
    // if(m_Map) delete[] m_Map;

    m_Map = new map::clr::RGB[m_Size.height * m_Size.width];
    fill();
}



void map::Mapper::loadFile(){
    std::clog << "LOAD!\n";
    std::string P; // P type
    std::string h; // height
    std::string w; // width
    std::string M; // mode
    
    std::string filename = OUTPUT_PATH + m_Filename;
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
    m_Size.height = std::stoi(h);
    m_Size.width = std::stoi(w);
    m_Max = std::stoi(M);

    int r;
    int g;
    int b;
    std::string garbage;
    
    // if(m_Map) delete[] m_Map;
    m_Map = new map::clr::RGB[m_Size.height*m_Size.width];

    for(int i = 0; i < m_Size.height; i++){
        for(int j = 0; j < m_Size.width; j++){
            fin >> r >> g >> b;
            m_Map[i*m_Size.width + j] = map::clr::RGB(r, g, b);
        }
        std::getline(fin, garbage);
    }

    fin.close();
}