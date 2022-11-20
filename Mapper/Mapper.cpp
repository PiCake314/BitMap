#include "Mapper.hpp"
#include <cassert>


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

Mapper::Mapper(std::string fn, std::string p, int height, int width, int m, std::string type){
    assert(fn.length() > 4 );
    assert(fn.substr(fn.length()-4, 4) == ".ppm");
    m_filename = fn;
    m_pType = p;
    m_size.height = height;
    m_size.width = width;
    m_max = m;
    m_set_state = true;

    if(type == "load")
        loadFile();
    else
        resetFile();
}


map::Mapper::~Mapper(){
    delete[] m_map;
}


void map::Mapper::isSet(bool s){
    m_set_state = s;
}


bool map::Mapper::getIsSet(){
    return m_set_state;
}


void map::Mapper::resetFile(){
    std::cout << "RESET!" << std::endl;
    // m_pType = "P3";
    // m_size.height = 500;
    // m_size.width = 500;
    // m_max = 255;

    // clr::RGB arr[10000];
    m_map = new clr::RGB[m_size.height * m_size.width];

    fillWhite();
    if(m_set_state) setState();
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
    std::cout << P << std::endl;
    fin >> w;
    std::cout << w << std::endl;
    fin >> h;
    std::cout << h << std::endl;
    fin >> spaces;
    std::getline(fin, spaces);
    std::cout << spaces << std::endl;
    std::getline(fin, M);
    std::cout << M << std::endl;


    std::cout << "Meow :3" << std::endl;
    assert(areValidString(P, h, w, M) == true);        
    std::cout << "Meow :3" << std::endl;

    m_pType = P;
    m_size.height = std::stoi(h);
    m_size.width = std::stoi(w);
    m_max = std::stod(M);

    int r;
    int g;
    int b;
    std::string garbage;
    
    // clr::RGB arr[s.height*s.width];
    m_map = new clr::RGB[m_size.height*m_size.width]();

    for(int i = 0; i < m_size.height; i++){
        for(int j = 0; j < m_size.width; j++){
            fin >> r >> g >> b;
            m_map[i*m_size.width + j] = clr::RGB(r, b, g);
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

        for(int i=0; i<m_size.height; i++)
            for(int j=0; j<m_size.width; j++)
                if(i == int(slope*j + b) || i == int(slope*j + b)-thick || i == int(slope*j + b)+thick)
                    if(i >= (p1.x<p2.x?p1.x:p2.x) && i <= (p1.x>p2.x?p1.x:p2.x) && 
                       j >= (p1.y<p2.y?p1.y:p2.y) && j <= (p1.y>p2.y?p1.y:p2.y))
                        m_map[i*m_size.width + j] = color;
    }
    else
        for(int i=m_size.height-1; i>=0; i--)
            if(i >= (p1.x<p2.x?p1.x:p2.x) && i <= (p1.x>p2.x?p1.x:p2.x))
                m_map[i*m_size.width + int(p1.y)] = color;


    if(m_set_state) setState();
}


void map::Mapper::drawTri(Point p1, Point p2, Point p3, clr::RGB color, bool thick){

    // setState();
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

    for(int i=0; i<m_size.height; i++)
        for(int j=0; j<m_size.width; j++)
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


void map::Mapper::drawRect(float top, float  left, float height, float width, clr::RGB color, std::string alignment){
    if(height < 0) height = m_size.height/10;
    
    if(width < 0) width = m_size.height/10;

    if(height < 1)
        height *= m_size.height;
    
    if(width < 1)
        width *= m_size.width;

    if(top < 1)
        top *= m_size.height;

    if(left < 1)
        left *= m_size.width;


    if(alignment == "center"){
        top = (m_size.height-height)/2;
        left = (m_size.width-width)/2;
    }
    else if(alignment == "top-left"){
        height = m_size.height/2;
        width = m_size.width/2;
        top = 0;
        left = 0;
    }
    else if(alignment == "top-right"){
        height = m_size.height/2;
        width = m_size.width/2;
        top = 0;
        left = m_size.width-width;
    }
    else if(alignment == "bottom-left"){
        height = m_size.height/2;
        width = m_size.width/2;
        top = m_size.height-height;
        left = 0;
    }
    else if(alignment == "bottom-right"){
        height = m_size.height/2;
        width = m_size.width/2;
        top = m_size.height-height;
        left = m_size.width-width;
    }
    else if(alignment == "width"){
        width = m_size.width;
        left = 0;
    }
    else if(alignment == "height"){
        height = m_size.height;
        top = 0;
    }

    for(int i = (top>=0?top:0); i<(top+height<m_size.height?top+height:m_size.height); i++)
        for(int j=(left>=0?left:0); j<(left+width<m_size.width?left+width:m_size.width); ++j)
            if(i*m_size.width + j >= 0 && i*m_size.width + j < m_size.height * m_size.width)
                m_map[i*m_size.width + j] = color;

    if(m_set_state) setState();
}


void map::Mapper::drawCircle(int top, int left, int r, clr::RGB color, bool filled, bool inverted, std::string alignment){
    if(r < 0) r = m_size.height/10;
    
    if(alignment == "center"){
        top = (m_size.height/2) - r;
        left = (m_size.width/2) - r;
    }

    if(alignment == "top"){
        top = 0;
        left = (m_size.width/2) - r;
    }

    if(alignment == "bottom"){
        top = m_size.height - 2*r;
        left = (m_size.width/2) - r;
    }

    if(alignment == "left"){
        top = (m_size.height/2) - r;
        left = 0;
    }

    if(alignment == "right"){
        top = (m_size.height/2) - r;
        left = m_size.width - 2*r;
    }

    int topMid = top+r;
    int leftMid = left+r;

    if(inverted){
        color.red = 255 - color.red;
        color.green = 255 - color.green;
        color.blue = 255 - color.blue;
    }

    if(filled){
        for(int i=(top>=0?top:0); i<(top+2*r<m_size.height?top+2*r:m_size.height); i++)
            for(int j=(left>=0?left:0); j<(left+2*r<m_size.width?left+2*r:m_size.width); j++)
                if((inverted? -1 : 1)*((i-top-r)*(i-top-r) + (j-left-r)*(j-left-r)) <= r*r*((inverted? -1 : 1)))
                        m_map[i*m_size.width + j] = color;
    }
    else
        for(int i=(top>=0?top:0); i<(top+2*r<m_size.height?top+2*r:m_size.height); i++)
            for(int j=(left>=0?left:0); j<(left+2*r<m_size.width?left+2*r:m_size.width); j++)
                if(
                    (i-top-r)*(i-top-r) + (j-left-r)*(j-left-r) >= r*r - r &&
                    (i-top-r)*(i-top-r) + (j-left-r)*(j-left-r) <= r*r + r
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


void map::Mapper::drawEllipse(int top, int left, int r1, int r2, clr::RGB color, bool filled, bool inverted, std::string alignment){
    if(r1 < 0) r1 = m_size.height/10;
    
    if(r2 < 0) r2 = m_size.height/10;
    
    if(alignment == "center"){
        top = (m_size.height/2) - r1;
        left = (m_size.width/2) - r2;
    }

    if(alignment == "top"){
        top = 0;
        left = (m_size.width/2) - r2;
    }

    if(alignment == "bottom"){
        top = m_size.height - 2*r1;
        left = (m_size.width/2) - r2;
    }

    if(alignment == "left"){
        top = (m_size.height/2) - r1;
        left = 0;
    }

    if(alignment == "right"){
        top = (m_size.height/2) - r1;
        left = m_size.width - 2*r2;
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


// void map::Mapper::bezierCubicCurve(Point pts[], float dt, clr::RGB color, bool thick){
//     Point l1;
//     Point l2;
//     Point l3;

//     Point ll1;
//     Point ll2;

//     Point curr;
//     Point prev = pts[0];

//     bool s = m_set_state;
//     m_set_state = false;
//     for(float a = 0; a < 1+dt/2; a += dt){
//         l1 = lerp(pts[0], pts[1], a);
//         l2 = lerp(pts[1], pts[2], a);
//         l3 = lerp(pts[2], pts[3], a);
//         ll1 = lerp(l1, l2, a);
//         ll2 = lerp(l2, l3, a);

//         curr = lerp(ll1, ll2, a);

//         std::cout << curr << std::endl;
    
//         drawLine(prev, curr, color, thick);
//         prev = curr;
//     }
//     m_set_state = s;

//     if(m_set_state) setState();
// }


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
        // std::cout << curr << std::endl;
    
        drawLine(prev, curr, color, thick);
        prev = curr;
    }
    m_set_state = s;


    if(m_set_state) setState();
}



void map::Mapper::fold(Fold f){
    // bool evenH = m_size.height % 2 == 0;
    // bool evenW = m_size.width % 2 == 0;

    if(f == map::l2r)
        for(int i = 0; i < m_size.height; i++)
            for(int j = 0; j < m_size.width/2; j++)
                m_map[(i+1)*m_size.width - j] = m_map[i*m_size.width + j];


    if(f == map::r2l)
        for(int i = 0; i < m_size.height; i++)
            for(int j = 0; j < m_size.width/2; j++)
            m_map[i*m_size.width + j] = m_map[(i+1)*m_size.width - j];

    if(f == map::t2b)
        for(int i = 0; i < m_size.height/2; i++)
            for(int j = 0; j < m_size.width; j++)
                m_map[((m_size.height/2)*m_size.width) + i*m_size.width + j] = m_map[((m_size.height/2)*m_size.width) - i*m_size.width - j];

    if(f == map::b2t)
        for(int i = 0; i < m_size.height/2; i++)
            for(int j = 0; j < m_size.width; j++)
                m_map[i*m_size.width + j] = m_map[(m_size.height*m_size.width) - i*m_size.width - j];


    if(m_set_state) setState();
}



//================================================

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