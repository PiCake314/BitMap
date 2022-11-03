#include "Mapper.hpp"
#include <cassert>


bool isNumber(std::string s){
    for(char &c : s)
        if(!isdigit(c))
            return false;

    return true;
}

bool isValidP(std::string P){
    return (P == "P3" || P == "P5");
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


/*==============================================================================================*/

Mapper::Mapper(std::string fn, std::string p, int height, int width, int m, std::string type){
    assert(fn.length() > 4 );
    assert(fn.substr(fn.length()-4, 4) == ".ppm");
    m_filename = fn;
    m_pType = p;
    m_s.height = height;
    m_s.width = width;
    m_max = m;
    if(type == "load")
        loadFile();
    else
        resetFile();
}


Mapper::~Mapper(){
    delete[] m_map;
}


void Mapper::resetFile(){
    std::cout << "RESET!" << std::endl;
    // m_pType = "P3";
    // m_s.height = 500;
    // m_s.width = 500;
    // m_max = 255;

    // RGB arr[10000];
    m_map = new RGB[m_s.height * m_s.width];

    fillWhite();
    setState();
}

void Mapper::loadFile(){
    std::cout << "LOAD!" << std::endl;
    std::string P;
    std::string h;
    std::string w;
    std::string M;

    std::ifstream fin(m_filename);
    assert(fin.is_open() == true);

    std::string spaces;

    std::getline(fin, P);
    fin >> h;
    fin >> w;
    std::getline(fin, spaces);
    std::getline(fin, M);

    assert(areValidString(P, h, w, M) == true);

    m_pType = P;
    m_s.height = std::stoi(h);
    m_s.width = std::stoi(w);
    m_max = std::stod(M);

    int r;
    int g;
    int b;
    std::string garbage;
    
    // RGB arr[s.height*s.width];
    m_map = new RGB[m_s.height*m_s.width]();

    for(int i=0; i<m_s.height; i++){
        for(int j=0; j<m_s.width; j++){
            fin >> r >> g >> b;
            m_map[i*m_s.width + j] = RGB(r, b, g);
        }
        std::getline(fin, garbage);
    }

    fin.close();
}

void Mapper::fillWhite(){
    for(int i=0; i<m_s.height; i++)
        for(int j=0; j<m_s.width; j++)
            m_map[i*m_s.width + j] = RGB(255, 255, 255);

    setState();
}


void Mapper::fillColor(RGB color){
    for(int i=0; i<m_s.height; i++)
        for(int j=0; j<m_s.width; j++)
            *(m_map + i * m_s.width + j) = color;
}


void Mapper::randomize(){
    srand(time(NULL));

    for(int i=0; i<m_s.height; i++)
        for(int j=0; j<m_s.width; j++)
            *(m_map + i * m_s.width + j) = RGB(rand()%256, rand()%256, rand()%256);

    setState();
}


void Mapper::randomizeGrey(){
    srand(time(NULL));

    for(int i=0; i<m_s.height; i++)
        for(int j=0; j<m_s.width; j++){
            int c = rand()%256;
            *(m_map + i * m_s.width + j) = RGB(c, c, c);
        }

    setState();
}


void Mapper::drawLine(Point p1, Point p2, RGB color, bool thick){
    if(p2.y - p1.y != 0){
        float slope = float(p2.x-p1.x)/float(p2.y-p1.y);
        float b = float(p1.x) - float(slope*p1.y);

        for(int i=0; i<m_s.height; i++)
            for(int j=0; j<m_s.width; j++)
                if(i == int(slope*j + b) || i == int(slope*j + b)-thick || i == int(slope*j + b)+thick)
                    if(i >= (p1.x<p2.x?p1.x:p2.x) && i <= (p1.x>p2.x?p1.x:p2.x) && 
                    j >= (p1.y<p2.y?p1.y:p2.y) && j <= (p1.y>p2.y?p1.y:p2.y))
                        m_map[i*m_s.width + j] = color;
    }
    else{
        for(int i=m_s.height-1; i>=0; i--)
            if(i >= (p1.x<p2.x?p1.x:p2.x) && i <= (p1.x>p2.x?p1.x:p2.x))
                m_map[i*m_s.width + int(p1.y)] = color;
            

    }


    setState();
}


void Mapper::drawTri(Point p1, Point p2, Point p3, RGB color, bool thick){
    drawLine(p1, p2, color, thick);
    drawLine(p2, p3, color, thick);
    drawLine(p3, p1, color, thick);
}


void Mapper::drawMulti(std::vector<Point> points, RGB color, bool thick){
    assert(points.size() >= 2);
    for(int i=0; i<points.size()-1; i++)
        drawLine(points[i], points[i+1], color, thick);
}


void Mapper::drawRect(float top, float  left, float height, float width, RGB color, std::string alignment){
    // int small_side = height < width ? height : width;
    // int tall_side = height > width ? height : width;

    if(height < 1)
        height *= m_s.height;
    
    if(width < 1)
        width *= m_s.width;

    if(top < 1)
        top *= m_s.height;

    if(left < 1)
        left *= m_s.width;



    if(alignment == "center"){
        top = (m_s.height-height)/2;
        left = (m_s.width-width)/2;
    }
    else if(alignment == "top-left"){
        height = m_s.height/2;
        width = m_s.width/2;
        top = 0;
        left = 0;
    }
    else if(alignment == "top-right"){
        height = m_s.height/2;
        width = m_s.width/2;
        top = 0;
        left = m_s.width-width;
    }
    else if(alignment == "bottom-left"){
        height = m_s.height/2;
        width = m_s.width/2;
        top = m_s.height-height;
        left = 0;
    }
    else if(alignment == "bottom-right"){
        height = m_s.height/2;
        width = m_s.width/2;
        top = m_s.height-height;
        left = m_s.width-width;
    }
    else if(alignment == "width"){
        width = m_s.width;
        left = 0;
    }
    else if(alignment == "height"){
        height = m_s.height;
        top = 0;
    }

    for(int i = (top>=0?top:0); i<(top+height<m_s.height?top+height:m_s.height); i++)
        for(int j=(left>=0?left:0); j<(left+width<m_s.width?left+width:m_s.width); ++j)
            if(i*m_s.width + j >= 0 && i*m_s.width + j < m_s.height * m_s.width)
                m_map[i*m_s.width + j] = color;

    setState();
}


void Mapper::drawCircle(int top, int left, int r, RGB color, std::string alignment){
    if(alignment == "center"){
        top = (m_s.height/2) - r;
        left = (m_s.width/2) - r;
    }

    if(alignment == "top"){
        top = 0;
        left = (m_s.width/2) - r;
    }

    if(alignment == "bottom"){
        top = m_s.height - 2*r;
        left = (m_s.width/2) - r;
    }

    if(alignment == "left"){
        top = (m_s.height/2) - r;
        left = 0;
    }

    if(alignment == "right"){
        top = (m_s.height/2) - r;
        left = m_s.width - 2*r;
    }

    int topMid = top+r;
    int leftMid = left+r;


    for(int i=(top>=0?top:0); i<top+2*r; i++)
        for(int j=(left>=0?left:0); j<left+2*r; j++)
            if((i-top-r)*(i-top-r) + (j-left-r)*(j-left-r) <= r*r)
                if(i*m_s.width + j >= 0 && i*m_s.width + j < m_s.height*m_s.width)
                    m_map[i*m_s.width + j] = color;

    // for(int i=top; i<top+2*r; i++){
    //     for(int j=left; j<left+2*r; j++){
    //         if((i-topMid)*(i-topMid0) + (j-leftMid)*(j-leftMid) <= r*r){
    //             map[i*s.width + j] = color;
    //         }
    //     }
    // }

    setState();
}

void Mapper::setInfo(){
    std::ofstream fout(m_filename, std::ios::trunc);

    assert(fout.is_open() == true);
    assert(areValid(m_filename, m_pType, m_s.height, m_s.width, m_max) == true);

    fout << m_pType << std::endl;
    fout << m_s.width << " " << m_s.height << std::endl;
    fout << m_max << std::endl;

    fout.close();
}

void Mapper::setState(){
    setInfo();

    std::ofstream fout(m_filename, std::ios::app);

    for(int i=0; i<m_s.height; i++){
        for(int j=0; j<m_s.width; j++)
            fout << m_map[i*m_s.width + j].Pixel() << " ";
        fout << '\n';
    }
}