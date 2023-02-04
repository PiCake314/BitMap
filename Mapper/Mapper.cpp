#include "Mapper.hpp"


using namespace map;

bool isNumber(std::string s){
    for(char &c : s)
        if(!isdigit(c))
            return false;

    return true;
}

bool isValidP(std::string P){
    return (P == "P3" || P == "P5" || P == "P6");
}

bool isValidHeight(int height){
    return (height >= 1);
}

bool isValidWidth(int width){
    return (width >= 1);
}

bool isValidMax(int max){
    return (max <= 255);
}

bool areValid(std::string fn, std::string P, int h, int w, int M){
    return (isValidP(P) && isValidHeight(h) && isValidWidth(w) && isValidMax(M));
}

bool areValidString(std::string p, std::string h, std::string w, std::string m){
    return (isNumber(h) && isNumber(w) && isNumber(m) && isValidP(p) &&  isValidHeight(std::stoi(h)) && isValidWidth(std::stoi(w)) && isValidMax(std::stoi(m)));
}

// Point findTopLeft(Point Ps[]){
//     Point ret = Ps[0];
//     for(int i=1; i<4; i++)
//         if(Ps[i].x + Ps[i].y < ret.x + ret.y)
//             ret = Ps[i];

//     return ret;
// }

// Point findTopRight(Point Ps[]){
//     Point ret = Ps[0];
//     for(int i=1; i<4; i++)
//         if(Ps[i].x < ret.x && Ps[i].y > ret.y)
//             ret = Ps[i];

//     return ret;
// }

// Point findBottomRight(Point Ps[]){
//     Point tl = findTopLeft(Ps);

//     Point ret = Ps[0];
//     for(int i=1; i<4; i++)
//         if(Ps[i].x + Ps[i].y > ret.x + ret.y)
//             ret = Ps[i];

//     return ret;
// }

// Point findBottomLeft(Point Ps[]){
//     Point ret = Ps[0];
//     for(int i=1; i<4; i++)
//         if(Ps[i].x > ret.x && Ps[i].y < ret.y)
//             ret = Ps[i];

//     return ret;
// }

// void orderFourPoints(Point Ps[]){
//     Ps[0] = findTopLeft(Ps), Ps[1] = findTopRight(Ps), Ps[2] = findBottomRight(Ps), Ps[3] = findBottomLeft(Ps);
// }


Point lerp(Point p1, Point p2, float dt){
    int x =  p1.x + (p2.x-p1.x)*dt;
    int y =  p1.y + (p2.y-p1.y)*dt;

    return Point(x, y);
}

/*==============================================================================================*/

Mapper::Mapper(std::string fn, int height, int width, Type type){
    assert(fn.length() > 4 );
    assert(fn.substr(fn.length()-4, 4) == ".ppm");
    m_filename = fn;
    m_pType = "P3";
    m_size.height = height;
    m_size.width = width;
    m_max = 255;
    m_set_state = true;

    if(type == Type::load)
        loadFile();
    else
        resetFile();
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
    
    std::string filename = "images/" + m_filename;
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
        float slope = (p2.x-p1.x)/(p2.y-p1.y);
        float b = p1.x - slope*p1.y;

        int iStart = p1.x<p2.x?p1.x:p2.x;
        int iEnd = p1.x>p2.x?p1.x:p2.x;
        int jStart = p1.y<p2.y?p1.y:p2.y;
        int jEnd = p1.y>p2.y?p1.y:p2.y;

        for(int i = 0; i < m_size.height; i++)
            for(int j = 0; j < m_size.width; j++)
                if(i == int(slope*j + b) || i == int(slope*j + b)-thick || i == int(slope*j + b)+thick)
                    if(i >= iStart && i <= iEnd && j >= jStart && j <= jEnd)
                        if(i*m_size.width + j >= 0 && i*m_size.width + j < m_size.width * m_size.height)
                            m_map[i*m_size.width + j] = color;
    }
    else{
        int iStart = p1.x<p2.x?p1.x:p2.x;
        int iEnd = p1.x>p2.x?p1.x:p2.x;

        for(int i = m_size.height - 1; i >= 0; i--)
            if(i >= iStart && i <= iEnd)
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
        case RectAlignment::center:
            center.x = (m_size.height-height)/2;
            center.y = (m_size.width-width)/2;
            break;

        case RectAlignment::top_left:
            center.x = height/2;
            center.y = width/2;
            break;

        case RectAlignment::top_right:
            height = m_size.height/2;
            width = m_size.width/2;
            center.x = 0;
            center.y = m_size.width-width;
            break;

        case RectAlignment::bottom_left:
            height = m_size.height/2;
            width = m_size.width/2;
            center.x = m_size.height-height;
            center.y = 0;
            break;

        case RectAlignment::bottom_right:
            height = m_size.height/2;
            width = m_size.width/2;
            center.x = m_size.height-height;
            center.y = m_size.width-width;
            break;

        case RectAlignment::width:
            width = m_size.width;
            center.y = m_size.width/2;
            break;
        
        case RectAlignment::height:
            height = m_size.height;
            center.x = m_size.height/2;
            break;
    }


    if(filled){
        int iStart = center.x - height/2 - 1 >= 0 ? center.x - height/2 : 0;
        int iLim = center.x + height/2 < m_size.height ? center.x + height/2 : m_size.height;

        int jStart = center.y - width/2 - 1 >= 0 ? center.y - width/2 : 0;
        int jLim = center.y + width/2 < m_size.width ? center.y + width/2 : m_size.width;

        for(int i = iStart; i < iLim; i++)
            for(int j = jStart; j < jLim; ++j)
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
                if(-((i-center.x)*(i-center.x) + (j-center.y)*(j-center.y)) <= -r*r)
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



void map::Mapper::drawEllipse(int top, int left, int r1, int r2, clr::RGB color, bool filled, bool inverted, Alignment alignment){
    if(r1 < 0) r1 = m_size.height/10;
    
    if(r2 < 0) r2 = m_size.height/10;

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
    }


    if(filled){
        for(int i=(top>=0?top:0); i<(top+2*r1<m_size.height?top+2*r1:m_size.height); i++)
            for(int j=(left>=0?left:0); j<=(left+2*r2<m_size.width?left+2*r2:m_size.width); j++)
                if((inverted? -1 : 1)*((i-top-r1)*(i-top-r1) + (j-left-r2)*(j-left-r2)) < r1*r2*((inverted? -1 : 1)))
                        m_map[i*m_size.width + j] = color;
    }
    else
        for(int i=(top>=0?top:0); i<(top+2*r1<m_size.height?top+2*r1:m_size.height); i++)
            for(int j=(left>=0?left:0); j<(left+2*r2<m_size.width?left+2*r2:m_size.width); j++)
                if(
                    (i-top-r1)*(i-top-r1) + (j-left-r2)*(j-left-r2) >= r1*r1 - r1 &&
                    (i-top-r1)*(i-top-r1) + (j-left-r2)*(j-left-r2) <= r2*r2 + r2
                )
                    m_map[i*m_size.width + j] = color;

    if(m_set_state) setState();
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
                // drawLine(lerpVec[i-1][j-1], lerpVec[i-1][j], clr::RGB(200, 150, 0));
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



void map::Mapper::fold(Fold f){
    // bool evenH = m_size.height % 2 == 0;
    // bool evenW = m_size.width % 2 == 0;

    switch (f){
        case map::l2r:
            for(int i = 0; i < m_size.height; i++)
                for(int j = 0; j < m_size.width/2; j++)
                    m_map[(i+1)*m_size.width - j] = m_map[i*m_size.width + j];
            break;

        case map::r2l:
            for(int i = 0; i < m_size.height; i++)
                for(int j = 0; j < m_size.width/2; j++)
                    m_map[(i+1)*m_size.width - j] = m_map[i*m_size.width + j];
            break;

        case map::t2b:

            for(int i = 0; i < m_size.height; i++)
                for(int j = 0; j < m_size.width/2; j++)
                    m_map[(i+1)*m_size.width - j] = m_map[i*m_size.width + j];
            break;

        case map::b2t:
            for(int i = 0; i < m_size.height; i++)
                for(int j = 0; j < m_size.width/2; j++)
                    m_map[(i+1)*m_size.width - j] = m_map[i*m_size.width + j];
            break;
    }


    if(m_set_state) setState();
}



int Mapper::dist(Point p1, Point p2){
    return sqrt(pow(p2.x-p1.x, 2) + pow(p2.y-p1.y, 2));
}



/* --------------------------- Setup Functions --------------------------- */

void map::Mapper::setInfo(){
    std::string fn = "images/" + m_filename;
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
    std::string fn = "images/" + m_filename;
    std::ofstream fout(fn, std::ios::app);

    for(int i=0; i<m_size.height; i++){
        for(int j=0; j<m_size.width; j++)
            fout << m_map[i*m_size.width + j] << " ";
        fout << '\n';
    }
}