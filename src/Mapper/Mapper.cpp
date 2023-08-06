#include "Mapper.hpp"
#include "../Structs/Shapes/Shapes.hpp"
#include "HelperFuncs.cpp"


map::Mapper::Mapper(std::string fn, Size size, Loadtype type)
: m_PType("P3"), m_Size(size.height, size.width), m_Max(255), m_Set_state(true), m_XCenter(0), m_YCenter(0), m_FPS(0), m_Current_frame(0)
{
    assert(fn.length() > 4 );
    assert(fn.substr(fn.length()-4, 4) == ".ppm");
    m_Filename = fn;

    if(type == Loadtype::load) loadFile();
    else resetFile();
}


map::Mapper::Mapper(std::string fn, Size size, int fps, Loadtype type)
: m_PType("P3"), m_Size(size.height, size.width), m_Max(255), m_Set_state(true), m_XCenter(0), m_YCenter(0), m_FPS(fps), m_Current_frame(0)
{
    assert(fn.length() > 4 );
    assert(fn.substr(fn.length()-4, 4) == ".ppm");
    m_Filename = fn;

    if(type == Loadtype::load) loadFile();
    else resetFile();
}



map::Mapper::~Mapper(){
    delete[] m_Map;
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



void map::Mapper::resetFile(){
    std::cout << "RESET!" << std::endl;
    m_Map = new map::clr::RGB[m_Size.height * m_Size.width];
    fill();
}



void map::Mapper::loadFile(){
    std::cout << "LOAD!" << std::endl;
    std::string P;
    std::string h;
    std::string w;
    std::string M;
    
    std::string filename = OUTPUT_PATH + m_Filename;
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

    m_PType = P;
    m_Size.height = std::stoi(h);
    m_Size.width = std::stoi(w);
    m_Max = std::stoi(M);

    int r;
    int g;
    int b;
    std::string garbage;
    
    // map::clr::RGB arr[s.height*s.width];
    m_Map = new map::clr::RGB[m_Size.height*m_Size.width]();

    for(int i = 0; i < m_Size.height; i++){
        for(int j = 0; j < m_Size.width; j++){
            fin >> r >> g >> b;
            m_Map[i*m_Size.width + j] = map::clr::RGB(r, g, b);
        }
        std::getline(fin, garbage);
    }

    fin.close();
}



void map::Mapper::setFile(std::string fn){
    m_Filename = fn;
}



// void map::Mapper::fillWhite(){
//     for(int i=0; i<m_Size.height; i++)
//         for(int j=0; j<m_Size.width; j++)
//             m_Map[i*m_Size.width + j] = map::clr::RGB(255, 255, 255);

//     if(m_Set_state) setState();
// }



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

    int i_start = std::max(std::min(p1.y, p2.y), 0.0);
    int i_end = std::min(std::max(p1.y, p2.y), double(m_Size.height - 1));

    int j_start = std::max(std::min(p1.x, p2.x), 0.0);
    int j_end = std::min(std::max(p1.x, p2.x), double(m_Size.width - 1));


    if(p2.x - p1.x != 0){
        float slope = (p2.y - p1.y) / (p2.x - p1.x);
        float b = p1.y - slope * p1.x;

            // #pragma omp parallel for simd collapse(2)
            for(int i = i_start; i <= i_end; i++){
                for(int j = j_start; j <= j_end; j++){
                    if(distFromLine(p1, p2, {float(j), float(i)}) <= (thickness/2)*(thickness/2)){
                        m_Map[i*m_Size.width + j] = color;
                    }
                }
            }
    }
    else{
        for(int i = i_start; i <= i_end; i++){
            for(int j = j_start; j < j_end; j++){
                m_Map[i*m_Size.width + j] = color;
            }
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

    float slope1 = (p2.x-p1.x)/(p2.y-p1.y);
    float b1 = p1.x - slope1*p1.y;

    float slope2 = (p3.x-p2.x)/(p3.y-p2.y);
    float b2 = p2.x - slope2*p2.y;

    float slope3 = (p4.x-p3.x)/(p4.y-p3.y);
    float b3 = p3.x - slope3*p3.y;

    float slope4 = (p1.x-p4.x)/(p1.y-p4.y);
    float b4 = p4.x - slope4*p4.y;

    for(int i = 0; i < m_Size.height; i++)
        for(int j = 0; j < m_Size.width; j++)
            if(
                i >= int(slope1*j + b1)+thick &&
                (p2.y == p3.y ? j <= p2.y : i >= int(slope2*j + b2)+thick) &&
                i <= int(slope3*j + b3)+thick &&
                (p1.y == p4.y ? j >= p1.y : i <= int(slope4*j + b4)+thick)
            )
                    m_Map[i*m_Size.width + j] = color;


    if(m_Set_state) setState();
}



void map::Mapper::drawMulti(std::vector<Point> points, map::clr::RGB color, bool thick){
    assert(points.size() >= 2);
    for(int i=0; i<points.size()-1; i++)
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
            center.x = m_Size.height/2;
            center.y = m_Size.width/2;
            break;

        case RectAlignment::Rtop_left:
            center.x = height/2;
            center.y = width/2;
            break;

        case RectAlignment::Rtop_right:
            height = m_Size.height/2;
            width = m_Size.width/2;
            center.x = 0;
            center.y = m_Size.width-width;
            break;

        case RectAlignment::Rbottom_left:
            height = m_Size.height/2;
            width = m_Size.width/2;
            center.x = m_Size.height-height;
            center.y = 0;
            break;

        case RectAlignment::Rbottom_right:
            height = m_Size.height/2;
            width = m_Size.width/2;
            center.x = m_Size.height-height;
            center.y = m_Size.width-width;
            break;

        case RectAlignment::Rwidth:
            width = m_Size.width;
            center.y = m_Size.width/2;
            break;
        
        case RectAlignment::Rheight:
            height = m_Size.height;
            center.x = m_Size.height/2;
            break;
        
        case RectAlignment::Rnone:
            break;
    }


    if(filled){
        int i_start = std::max(center.y - width/2 - 1, 0.0);
        int i_end = std::min(center.y + width/2, (double)m_Size.width);

        int j_start = std::max(center.x - height/2 - 1, 0.0);
        int j_end = std::min(center.x + height/2, (double)m_Size.height);

        for(int i = i_start; i <= i_end; i++){
            for(int j = j_start; j <= j_end; ++j){
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
            center.x = (m_Size.height/2) - r;
            center.y = (m_Size.width/2) - r;
            break;

        case Alignment::top:
            center.x = 0;
            center.y = (m_Size.width/2) - r;
            break;

        case Alignment::bottom:
            center.x = m_Size.height - 2*r;
            center.y = (m_Size.width/2) - r;
            break;

        case Alignment::left:
            center.x = (m_Size.height/2) - r;
            center.y = 0;
            break;

        case Alignment::right:
            center.x = (m_Size.height/2) - r;
            center.y = m_Size.width - 2*r;
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

    int i_start = center.y-r >= 0 ? center.y-r : 0;
    int j_start = center.x-r >= 0 ? center.x-r : 0;

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
                if(((i-center.y)*(i-center.y) + (j-center.x)*(j-center.x)) <= r*r)
                        m_Map[i*m_Size.width + j] = color;
    }
    else
        for(int i = i_start; i < i_end; i++)
            for(int j = j_start; j < j_end; j++)
                if(
                    (i-center.y)*(i-center.y) + (j-center.x)*(j-center.x) >= r*r - thickness*r &&
                    (i-center.y)*(i-center.y) + (j-center.x)*(j-center.x) <= r*r + r
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
        map::clr::RGB invColor = color.invert();
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


// template <class T>
// requires std::is_base_of<Shape, T>::value
void map::Mapper::draw(map::shapes::Shape *s){
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
                // std::cout << "IN\n";
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


// void map::Mapper::move(Shape_t shape, Point shift, int seconds){
//     int frames = seconds * m_FPS;
//     std::vector<map::clr::RGB> temp(m_Map, m_Map + m_Size.width * m_Size.height);
//     shift *= 1.0/frames;

//     switch(shape.index()){
//         case ShapeType::line:{

//             auto &line = std::get<ShapeType::line>(shape);

//             for(double frame = 0; frame < frames; frame++){
//                 copy(temp, m_Map);
//                 line.shift(shift);
//                 draw(line);
//                 saveFrame();
//                 std::cout << frame << '/' << frames << '\n';
//             }

//             break;
//         }
//     }
// }



// void map::Mapper::animate(Shape_t(*provider)(int, const int), float seconds){
//     std::cout << "Beginning Scene:\n";
//     int frames = seconds * m_FPS;

//     std::vector<map::clr::RGB> temp(m_Map, m_Map + m_Size.width * m_Size.height);

//     for(int frame = 0; frame <= frames; frame++){
//         copy(temp, m_Map);
//         auto shape = provider(frame, frames);
//         draw(shape);
//         saveFrame();
//         std::cout << frame << '/' << frames << '\n';
//     }
//     copy(temp, m_Map);

//     std::cout << "Scene Ended!\n";
// }


// int Mapper::dist(Point p1, Point p2){
//     return sqrt(pow(p2.x-p1.x, 2) + pow(p2.y-p1.y, 2));
// }


// ----------------------- Video Related Functions ----------------------- //

void map::Mapper::saveFrame(){
    std::string command = "convert " OUTPUT_PATH + m_Filename + " " VIDEO_TEMP_PATH "out" + std::to_string(m_Current_frame) + ".png";
    std::system(command.c_str());
    m_Current_frame++;
}


void map::Mapper::render(const std::string &output_file) const{
	std::system(("ffmpeg -framerate " + std::to_string(m_FPS) + " -i " VIDEO_TEMP_PATH "out%d.png -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p " VIDEO_OUTPUT_PATH + output_file).c_str());
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


map::clr::RGB *map::Mapper::begin(){
    return m_Map;
}


map::clr::RGB *map::Mapper::end(){
    return m_Map + m_Size.height * m_Size.width;
}


/* --------------------------- Setup Functions --------------------------- */

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