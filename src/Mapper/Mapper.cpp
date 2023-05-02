#include "Mapper.hpp"
#include "HelperFuncs.cpp"


Mapper::Mapper(std::string fn, int height, int width, Loadtype type)
: m_pType("P3"), m_size(height, width), m_max(255), m_set_state(true), m_xCenter(0), m_yCenter(0)
{
    assert(fn.length() > 4 );
    assert(fn.substr(fn.length()-4, 4) == ".ppm");
    m_filename = fn;

    if(type == Loadtype::load) loadFile();
    else resetFile();
}



map::Mapper::~Mapper(){
    delete[] m_map;
}



void Mapper::doSet(){
    m_set_state = true;
}



void Mapper::noSet(){
    m_set_state = false;
}



void map::Mapper::resetFile(){
    std::cout << "RESET!" << std::endl;
    m_map = new clr::RGB[m_size.height * m_size.width];
    fillWhite();
}



void map::Mapper::loadFile(){
    std::cout << "LOAD!" << std::endl;
    std::string P;
    std::string h;
    std::string w;
    std::string M;
    
    std::string filename = OUTPUT_PATH + m_filename;
    std::ifstream fin(filename);
    assert(fin.is_open() == true);

    std::string spaces;

    std::getline(fin, P);
    std::cout << "P: " << P << std::endl;
    fin >> w;
    std::cout << "W: " << w << std::endl;
    fin >> h;
    std::cout << "H: " << h << std::endl;
    fin >> M;
    std::cout << "M: " << M << std::endl;


    std::cout << "Meow :3" << std::endl;
    assert(areValidString(P, h, w, M) == true);        
    std::cout << "Meow :3" << std::endl;

    m_pType = P;
    m_size.height = std::stoi(h);
    m_size.width = std::stoi(w);
    m_max = std::stoi(M);

    int r;
    int g;
    int b;
    std::string garbage;
    
    // clr::RGB arr[s.height*s.width];
    m_map = new clr::RGB[m_size.height*m_size.width]();

    for(int i = 0; i < m_size.height; i++){
        for(int j = 0; j < m_size.width; j++){
            fin >> r >> g >> b;
            m_map[i*m_size.width + j] = clr::RGB(r, g, b);
        }
        std::getline(fin, garbage);
    }

    fin.close();
}



void map::Mapper::setFile(std::string fn){
    m_filename = fn;
}



void map::Mapper::fillWhite(){
    for(int i=0; i<m_size.height; i++)
        for(int j=0; j<m_size.width; j++)
            m_map[i*m_size.width + j] = clr::RGB(255, 255, 255);

    if(m_set_state) setState();
}



void map::Mapper::fillColor(clr::RGB color){
    for(int i=0; i<m_size.height; i++)
        for(int j=0; j<m_size.width; j++)
            *(m_map + i * m_size.width + j) = color;
    
    if(m_set_state) setState();
}



void map::Mapper::randomize(){
    srand(time(NULL));

    for(int i=0; i<m_size.height; i++)
        for(int j=0; j<m_size.width; j++)
            *(m_map + i * m_size.width + j) = clr::RGB(rand()%256, rand()%256, rand()%256);

    if(m_set_state) setState();
}



void map::Mapper::randomizeGrey(){
    srand(time(NULL));

    for(int i=0; i<m_size.height; i++)
        for(int j=0; j<m_size.width; j++){
            int c = rand()%256;
            *(m_map + i * m_size.width + j) = clr::RGB(c, c, c);
        }

    if(m_set_state) setState();
}



clr::RGB map::Mapper::getColorAt(Point p){
    if(p.x >= 0 && p.x < m_size.height && p.y >= 0 && p.y < m_size.width)
        return *(m_map + int(p.x * m_size.width + p.y));

    return clr::RGB();
}



void map::Mapper::drawAt(Point p, clr::RGB color){
    if(p.x >= 0 && p.x < m_size.height && p.y >= 0 && p.y < m_size.width)
        m_map[int(p.x*m_size.width + p.y)] = color;

    if(m_set_state) setState();
}



void map::Mapper::drawLine(Point p1, Point p2, clr::RGB color, bool thick){
    if(p2.y - p1.y != 0){
        float slope = (p2.y - p1.y) / (p2.x - p1.x);
        float b = p1.y - slope * p1.x;

        int i_start = std::min(p1.y, p2.y);
        int i_end = std::max(p1.y, p2.y);
        int j_start = std::min(p1.x, p2.x);
        int j_end = std::max(p1.x, p2.x);

        // for(auto [i, j] : outter_prod(i_start, i_end, j_start, j_end)){
            for(int i = i_start; i < i_end; i++){
                for(int j = j_start; j < j_end; j++){
                    if(i == int(slope*j + b) || i == int(slope*j + b)-thick || i == int(slope*j + b)+thick){
                        // if(i >= i_start && i <= i_end && j >= j_start && j <= j_end)
                        if(i*m_size.width + j >= 0 && i*m_size.width + j < m_size.width * m_size.height){
                            m_map[i*m_size.width + j] = color;
                        }
                    }
                }
            }
        // }
    }
    else{
        int i_start = p1.x<p2.x?p1.x:p2.x;
        int i_end = p1.x>p2.x?p1.x:p2.x;

        for(int i = m_size.height - 1; i >= 0; i--)
            if(i >= i_start && i <= i_end)
                if(i*m_size.width + int(p1.y) >= 0 && i*m_size.width + int(p1.y) < m_size.width * m_size.height)
                    m_map[i*m_size.width + int(p1.y)] = color;
    }

    if(m_set_state) setState();
}



void map::Mapper::drawTri(Point p1, Point p2, Point p3, clr::RGB color, bool thick){
    bool s = m_set_state;
    m_set_state = false;

    drawLine(p1, p2, color, thick);
    drawLine(p2, p3, color, thick);
    drawLine(p1, p3, color, thick);

    m_set_state = s;

    if(m_set_state) setState();
}



void map::Mapper::drawFourPoints(Point points[], clr::RGB color, bool thick){

    // orderFourPoints(points);

    Point p1 = points[0];
    Point p2 = points[1];
    Point p3 = points[2];
    Point p4 = points[3];

    float slope1 = (p2.x-p1.x)/(p2.y-p1.y);
    float b1 = p1.x - slope1*p1.y;

    float slope2 = (p3.x-p2.x)/(p3.y-p2.y);
    float b2 = p2.x - slope2*p2.y;

    float slope3 = (p4.x-p3.x)/(p4.y-p3.y);
    float b3 = p3.x - slope3*p3.y;

    float slope4 = (p1.x-p4.x)/(p1.y-p4.y);
    float b4 = p4.x - slope4*p4.y;

    for(int i = 0; i < m_size.height; i++)
        for(int j = 0; j < m_size.width; j++)
            if(
                i >= int(slope1*j + b1)+thick &&
                (p2.y == p3.y ? j <= p2.y : i >= int(slope2*j + b2)+thick) &&
                i <= int(slope3*j + b3)+thick &&
                (p1.y == p4.y ? j >= p1.y : i <= int(slope4*j + b4)+thick)
            )
                    m_map[i*m_size.width + j] = color;


    if(m_set_state) setState();
}



void map::Mapper::drawMulti(std::vector<Point> points, clr::RGB color, bool thick){
    assert(points.size() >= 2);
    for(int i=0; i<points.size()-1; i++)
        drawLine(points[i], points[i+1], color, thick);


    if(m_set_state) setState();
}



void map::Mapper::drawRect(Point center, float height, float width, clr::RGB color, bool filled, bool thick , RectAlignment alignment){
    if(height < 0) height = m_size.height/10;
    


    if(width < 0) width = m_size.height/10;

    if(height < 1)
        height *= m_size.height;
    
    if(width < 1)
        width *= m_size.width;

    if(center.x < 1)
        center.x *= m_size.height;

    if(center.y < 1)
        center.y *= m_size.width;


    switch (alignment){
        case RectAlignment::Rcenter:
            center.x = (m_size.height-height)/2;
            center.y = (m_size.width-width)/2;
            break;

        case RectAlignment::Rtop_left:
            center.x = height/2;
            center.y = width/2;
            break;

        case RectAlignment::Rtop_right:
            height = m_size.height/2;
            width = m_size.width/2;
            center.x = 0;
            center.y = m_size.width-width;
            break;

        case RectAlignment::Rbottom_left:
            height = m_size.height/2;
            width = m_size.width/2;
            center.x = m_size.height-height;
            center.y = 0;
            break;

        case RectAlignment::Rbottom_right:
            height = m_size.height/2;
            width = m_size.width/2;
            center.x = m_size.height-height;
            center.y = m_size.width-width;
            break;

        case RectAlignment::Rwidth:
            width = m_size.width;
            center.y = m_size.width/2;
            break;
        
        case RectAlignment::Rheight:
            height = m_size.height;
            center.x = m_size.height/2;
            break;
        
        case RectAlignment::Rnone:
            break;
    }


    if(filled){
        int iStart = center.x - height/2 - 1 >= 0 ? center.x - height/2 : 0;
        int iLim = center.x + height/2 < m_size.height ? center.x + height/2 : m_size.height;

        int j_start = center.y - width/2 - 1 >= 0 ? center.y - width/2 : 0;
        int jLim = center.y + width/2 < m_size.width ? center.y + width/2 : m_size.width;

        for(int i = iStart; i < iLim; i++)
            for(int j = j_start; j < jLim; ++j)
                if(i*m_size.width + j >= 0 && i*m_size.width + j < m_size.height * m_size.width)
                    m_map[i*m_size.width + j] = color;
    }
    else{
        drawLine(
            Point(center.x - height/2 - 1, center.y - width/2 - 1),
            Point(center.x - height/2 - 1, center.y + width/2 - 1),
        color, thick);


        drawLine(
            Point(center.x - height/2 - 1, center.y + width/2 - 1),
            Point(center.x + height/2 - 1, center.y + width/2 - 1),
        color, thick);


        drawLine(
            Point(center.x + height/2 - 1, center.y + width/2 - 1),
            Point(center.x + height/2 - 1, center.y - width/2 - 1),
        color, thick);


        drawLine(
            Point(center.x + height/2 - 1, center.y - width/2 - 1),
            Point(center.x - height/2 - 1, center.y - width/2 - 1),
        color, thick);
    }

    if(m_set_state) setState();
}



void map::Mapper::drawCircle(Point center, int r, clr::RGB color, bool filled, bool inverted, int thickness, Alignment alignment){
    thickness = thickness < 2 ? 2 : thickness;

    if(r < 0) r = m_size.height/10;

    switch (alignment){
        case Alignment::center:
            center.x = (m_size.height/2) - r;
            center.y = (m_size.width/2) - r;
            break;

        case Alignment::top:
            center.x = 0;
            center.y = (m_size.width/2) - r;
            break;

        case Alignment::bottom:
            center.x = m_size.height - 2*r;
            center.y = (m_size.width/2) - r;
            break;

        case Alignment::left:
            center.x = (m_size.height/2) - r;
            center.y = 0;
            break;

        case Alignment::right:
            center.x = (m_size.height/2) - r;
            center.y = m_size.width - 2*r;
            break;
        
        case Alignment::none:
            break;
    }


    int topMid = center.x+r;
    int leftMid = center.y+r;

    if(inverted){
        color.red = 255 - color.red;
        color.green = 255 - color.green;
        color.blue = 255 - color.blue;
    }

    int iBeg = center.x-r >= 0 ? center.x-r : 0;
    int jBeg = center.y-r >= 0 ? center.y-r : 0;

    int iLim = center.x + 2*r < m_size.height ? center.x + 2*r : m_size.height;
    int jLim = center.y + 2*r < m_size.width ? center.y + 2*r : m_size.width;

    if(inverted){
        for(int i = 0; i < m_size.height; i++)
            for(int j = 0; j < m_size.width; j++)
                if(-((i - center.x) * (i - center.x) + (j-center.y)*(j-center.y)) <= -r*r)
                    m_map[i*m_size.width + j] = color;
    }
    else if(filled){
        for(int i = iBeg; i < iLim; i++)
            for(int j = jBeg; j < jLim; j++)
                if(((i-center.x)*(i-center.x) + (j-center.y)*(j-center.y)) <= r*r)
                        m_map[i*m_size.width + j] = color;
    }
    else
        for(int i = iBeg; i < iLim; i++)
            for(int j = jBeg; j < jLim; j++)
                if(
                    (i-center.x)*(i-center.x) + (j-center.y)*(j-center.y) >= r*r - thickness*r &&
                    (i-center.x)*(i-center.x) + (j-center.y)*(j-center.y) <= r*r + r
                )
                    m_map[i*m_size.width + j] = color;

    // for(int i=top; i<top+2*r; i++){
    //     for(int j=left; j<left+2*r; j++){
    //         if((i-topMid)*(i-topMid0) + (j-leftMid)*(j-leftMid) <= r*r){
    //             map[i*s.width + j] = color;
    //         }
    //     }
    // }

    if(m_set_state) setState();
}



void map::Mapper::drawEllipse(Point center, int r1, int r2, clr::RGB color, bool filled, bool inverted, int thickness, Alignment alignment){
    float thick = float(thickness) / 100;

    if(r1 < 0) r1 = m_size.height/10;
    
    if(r2 < 0) r2 = m_size.height/10;

    int top = center.y - r1;
    int left = center.x - r2;


    switch (alignment){
        case Alignment::center:
            top = (m_size.height/2) - r1;
            left = (m_size.width/2) - r2;
            break;

        case Alignment::top:
            top = 0;
            left = (m_size.width/2) - r2;
            break;

        case Alignment::bottom:
            top = m_size.height - 2*r1;
            left = (m_size.width/2) - r2;
            break;

        case Alignment::left:
            top = (m_size.height/2) - r1;
            left = 0;
            break;

        case Alignment::right:
            top = (m_size.height/2) - r1;
            left = m_size.width - 2*r2;
            break;
        
        case Alignment::none:
            break;
    }


    // if(filled){
    //     for(int i = 0; i < m_size.height; i++){
    //         for(int j = 0; j < m_size.width; j++){
    //             int inv = (inverted ? -1 : 1);
    //             int equation = (std::pow((i - top - r1), 2) + std::pow((j - left - r2), 2)) * inv;

    //             if(equation < r1 * r2 * inv){
    //                 m_map[i * m_size.width + j] = color;
    //             }
    //         }
    //     }
    // }
    // else for(int i = std::max(top, 0); i < std::min(top + 2 * r1,  m_size.height); i++){
    //     for(int j = std::max(left, 0); j <= std::min(left + 2 * r2, m_size.width); j++){
    //         int equation = std::pow((i - top - r1), 2) + std::pow((j - left - r2), 2);

    //         if(equation >= r1 * r1 - r1 && equation <= r2 * r2 + r2){
    //             m_map[i * m_size.width + j] = color;
    //         }
    //     }
    // }
    
    if(inverted){
        clr::RGB invColor = color.invert();
        for(int i = 0; i < m_size.height; i++){
            for(int j = 0; j < m_size.width; j++){
                float equation = std::pow((i - top - r1), 2) / std::pow(r1, 2) + std::pow((j - left - r2), 2) / std::pow(r2, 2);


                if(equation > 1){
                    m_map[i * m_size.width + j] = invColor;
                }
            }
        }
    }
    else if(filled){
        for(int i = std::max(top, 0); i < std::min(top + 2 * r1,  m_size.height); i++){
            for(int j = std::max(left, 0); j <= std::min(left + 2 * r2, m_size.width); j++){
                float equation = std::pow((i - top - r1), 2) / std::pow(r1, 2) + std::pow((j - left - r2), 2) / std::pow(r2, 2);

                if(equation <= 1){
                    m_map[i * m_size.width + j] = color;
                }
            }
        }
    }
    else for(int i = std::max(top, 0); i < std::min(top + 2 * r1 + 1,  m_size.height); i++){
        for(int j = std::max(left, 0); j <= std::min(left + 2 * r2 + 1, m_size.width); j++){
            float equation = std::pow((i - top - r1), 2) / std::pow(r1, 2) + std::pow((j - left - r2), 2) / std::pow(r2, 2);

            // if(equation >= r1 * r1 - r1 && equation <= r2 * r2 + r2){
            //     m_map[i * m_size.width + j] = color;
            // }

            if(equation <= 1 + thick && equation >= 1 - thick){
                m_map[i * m_size.width + j] = color;
            }
        }
    }


    if(m_set_state) setState();
}


// template <class T>
// requires std::is_base_of<Shape, T>::value
void map::Mapper::draw(std::variant<shapes::Line, shapes::Circle, shapes::Rect, shapes::Triangle, shapes::Ellipse> s){
    using namespace shapes;

    switch (s.index()){

        case ShapeType::line:{
            auto shape = std::get<Line>(s);
            drawLine(shape.start(), shape.end(), shape.color, shape.thickness);
            break;
        }

        case ShapeType::circle:{
            auto shape = std::get<Circle>(s);
            drawCircle(shape.center, shape.radius, shape.color, shape.filled, shape.inverted, shape.thickness, shape.alignment);
            break;
        }

        case ShapeType::rect:{
            auto shape = std::get<Rect>(s);
            drawRect(shape.center, shape.height, shape.width, shape.color, shape.filled, shape.thickness, shape.rectAlignment);
            break;
        }

        case ShapeType::triangle:{
            auto shape = std::get<Triangle>(s);
            drawTri(shape.points[0], shape.points[1], shape.points[2], shape.color, shape.thickness);
            break;
        }

        case ShapeType::ellipse:{
            auto shape = std::get<Ellipse>(s);
            drawEllipse(shape.center, shape.r1, shape.r2, shape.color, shape.filled, shape.inverted, shape.thickness, shape.alignment);
            break;
        }
        
        default:
            break;
    }


    // if constexpr(std::is_same_v<T, Circle>){
    //     drawCircle(shape.center, shape.radius, shape.color, shape.filled, shape.inverted, shape.alignment);
    // }
    // else if constexpr(std::is_same_v<T, map::Rect>){
    //     drawRect(shape.top, shape.left, shape.height, shape.width, shape.color, shape.filled, shape.inverted, shape.alignment);
    // }
    // else if constexpr(std::is_same_v<T, map::Ellipse>){
    //     drawEllipse(shape.top, shape.left, shape.r1, shape.r2, shape.color, shape.filled, shape.inverted, shape.alignment);
    // }
    // else if constexpr(std::is_same_v<T, map::Line>){
    //     drawLine(shape.p1, shape.p2, shape.color, shape.thick);
    // }
    // else if constexpr(std::is_same_v<T, map::Triangle>){
    //     drawTri(shape.p1, shape.p2, shape.p3, shape.color, shape.filled);
    // }
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
    // else if constexpr(std::is_same_v<T, BezierQuadCurve>){
    //     drawBezierQuadCurve(shape.p1, shape.p2, shape.c, shape.dt, shape.color, shape.thick);
    // }
    // else if constexpr(std::is_same_v<T, BezierMultiCurve>){
    //     drawBezierMultiCurve(shape.pts, shape.dt, shape.color, shape.thick);
    // }
    // else if constexpr(std::is_same_v<T, BezierMultiQuadCurve>){
    //     drawBezierMultiQuadCurve(shape.pts, shape.dt, shape.color, shape.thick);
    // }
    // else if constexpr(std::is_same_v<T, BezierMultiMultiCurve>){
    //     drawBezierMultiMultiCurve(shape.pts, shape.dt, shape.color, shape.thick);
    // }
    // else if constexpr(std::is_same_v<T, BezierMultiMultiQuadCurve>){
    //     drawBezierMultiMultiQuadCurve(shape.pts, shape.dt, shape.color, shape.thick);
    // }
}



void map::Mapper::bezierQuadCurve(Point p1, Point p2, Point c, float dt, clr::RGB color, bool thick){
    Point l1;
    Point l2;

    Point curr;
    Point prev = p1;

    bool s = m_set_state;
    m_set_state = false;
    for(float a = 0; a < 1+dt/2; a += dt){
        l1 = lerp(p1, c, a);
        l2 = lerp(c, p2, a);
        curr = lerp(l1, l2, a);
    
        drawLine(prev, curr, color, thick);
        prev = curr;
    }
    m_set_state = s;

    if(m_set_state) setState();
}



void map::Mapper::bezierMultiCurve(std::vector<Point> pts, float dt, clr::RGB color, bool thick){
    assert(pts.size() >= 2);

    int l = pts.size();
    
    Point curr;
    Point prev = pts[0];

    bool s = m_set_state;
    m_set_state = false;
    for(float a = 0; a < 1+dt/2; a += dt){
        std::vector<std::vector<Point>> lerpVec = {pts};
        for(int i = 1; i < l; i++){
            if(l + 1 - i > 1) lerpVec.push_back(std::vector<Point>());
            for(int j = 1; j < l + 1 - i; j++){
                drawLine(lerpVec[i-1][j-1], lerpVec[i-1][j], clr::RGB(200, 150, 0));
                lerpVec[i].push_back(lerp(lerpVec[i-1][j-1], lerpVec[i-1][j], a));
            }
        }
        curr = lerp(lerpVec[lerpVec.size()-2][0], lerpVec[lerpVec.size()-2][1], a);

        drawLine(prev, curr, color, thick);
        prev = curr;
    }
    m_set_state = s;


    if(m_set_state) setState();
}



void map::Mapper::plot(int(*func)(int), clr::RGB color, bool thick){
    for (int i = 0; i < m_size.height; i++)
        for (int j = 0; j < m_size.width; j++){
            int value = (m_size.height/2 - func(j - m_size.width/2));
            if (value <= i + thick && value >= i - thick)
                m_map[i*m_size.width + j] = color;
        }

    if(m_set_state) setState();
}



void map::Mapper::plotXY(double(*func)(double, double), double(*res)(double, double), clr::RGB color){
    for (int i = 0; i < m_size.height; i++)
        for (int j = 0; j < m_size.width; j++){
            if (abs(func(j - m_size.width/2, m_size.height/2 - i) - (res(j - m_size.width/2, m_size.height/2 - i))) <= 5){
                // std::cout << "IN\n";
                m_map[i*m_size.width + j] = color;
            }
        }

    if(m_set_state) setState();
}



void map::Mapper::plotIfTrue(bool (*func)(int x, int y), clr::RGB color){
    for (int i = 0; i < m_size.height; i++)
        for (int j = 0; j < m_size.width; j++){
            if (func(j, i)){
                std::cout << "IN\n";
                m_map[i*m_size.width + j] = color;
            }
        }

    if(m_set_state) setState();
}



void map::Mapper::fold(Fold f){
    // bool evenH = m_size.height % 2 == 0;
    // bool evenW = m_size.width % 2 == 0;

    switch (f){
        case Fold::l2r:
            for(int i = 0; i < m_size.height; i++)
                for(int j = 0; j < m_size.width/2; j++)
                    m_map[(i+1)*m_size.width - j] = m_map[i*m_size.width + j];
            break;

        case Fold::r2l:
            for(int i = 0; i < m_size.height; i++)
                for(int j = 0; j < m_size.width/2; j++)
                    m_map[(i+1)*m_size.width - j] = m_map[i*m_size.width + j];
            break;

        case Fold::t2b:

            for(int i = 0; i < m_size.height; i++)
                for(int j = 0; j < m_size.width/2; j++)
                    m_map[(i+1)*m_size.width - j] = m_map[i*m_size.width + j];
            break;

        case Fold::b2t:
            for(int i = 0; i < m_size.height; i++)
                for(int j = 0; j < m_size.width/2; j++)
                    m_map[(i+1)*m_size.width - j] = m_map[i*m_size.width + j];
            break;
    }


    if(m_set_state) setState();
}


// Not done!
void Mapper::rotate(Rotate rt){
    switch(rt){

        case Rotate::cw:{
            std::vector<clr::RGB> temp(m_map, m_map+m_size.width*m_size.height);
            for(int i = 0; i < m_size.height; i++)
                for(int j = 0; j < m_size.width; j++){
                    m_map[i*m_size.width + j] = temp[(m_size.height-1-j)*m_size.width + i];
                }
                if(m_set_state) setState();
            break;
        }

        case Rotate::ccw:{
            std::vector<clr::RGB> temp(m_map, m_map+m_size.width*m_size.height);
            for(int i = 0; i < m_size.height; i++)
                for(int j = 0; j < m_size.width; j++){
                    m_map[i*m_size.width + j] = temp[j*m_size.width + (m_size.width-1-i)];
                }
                if(m_set_state) setState();
            break;
        }

        case Rotate::flip:{
            std::vector<clr::RGB> temp(m_map, m_map+m_size.width*m_size.height);
            for(int i = 0; i < m_size.height; i++)
                for(int j = 0; j < m_size.width; j++){
                    m_map[i*m_size.width + j] = temp[(m_size.height-1-i)*m_size.width + (m_size.width-1-j)];
                }
                if(m_set_state) setState();
            break;
        }
    }
}


int Mapper::dist(Point p1, Point p2){
    return sqrt(pow(p2.x-p1.x, 2) + pow(p2.y-p1.y, 2));
}



/* --------------------------- Setup Functions --------------------------- */

void map::Mapper::setInfo(){
    std::string fn = OUTPUT_PATH + m_filename;
    std::ofstream fout(fn, std::ios::trunc);

    assert(fout.is_open() == true);
    assert(areValid(m_filename, m_pType, m_size.height, m_size.width, m_max) == true);


    fout << m_pType << std::endl;
    fout << m_size.width << " " << m_size.height << std::endl;
    fout << m_max << std::endl;

    fout.close();
}



void map::Mapper::setState(){
    setInfo();
    std::string fn = OUTPUT_PATH + m_filename;
    std::ofstream fout(fn, std::ios::app);

    for(int i=0; i<m_size.height; i++){
        for(int j=0; j<m_size.width; j++)
            fout << m_map[i*m_size.width + j] << " ";
        fout << '\n';
    }

    fout.close();
}