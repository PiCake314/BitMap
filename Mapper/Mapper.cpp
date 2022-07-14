#include "Mapper.hpp"
#include <cassert>


bool isNumber(std::string s){
    for(char &c : s){
        if(!isdigit(c))
            return false;
    }

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
    filename = fn;
    if(type == "load")
        loadFile();
    else
        resetFile();
}


Mapper::~Mapper(){
    delete[] map;
}


void Mapper::resetFile(){
    std::cout << "RESET!" << std::endl;
    pType = "P3";
    s.height = 100;
    s.width = 100;
    max = 255;

    // RGB arr[10000];
    map = new RGB[1000000];

    fillWhite();
    setState();
}

void Mapper::loadFile(){
    std::cout << "LOAD!" << std::endl;
    std::string P;
    std::string h;
    std::string w;
    std::string M;

    std::ifstream fin(filename);
    assert(fin.is_open() == true);

    std::string spaces;

    std::getline(fin, P);
    fin >> h;
    fin >> w;
    std::getline(fin, spaces);
    std::getline(fin, M);

    assert(areValidString(P, h, w, M) == true);

    pType = P;
    s.height = std::stoi(h);
    s.width = std::stoi(w);
    max = std::stod(M);

    int r;
    int g;
    int b;

    std::string garbage;
    
    // RGB arr[s.height*s.width];
    map = new RGB[s.height*s.width]();

    for(int i=0; i<s.height; i++){
        for(int j=0; j<s.width; ++j){
            fin >> r >> g >> b;
            map[i*s.width + j] = RGB(r, b, g);
        }
        std::getline(fin, garbage);
    }

    fin.close();
}

void Mapper::fillWhite(){
    for(int i=0; i<s.height; i++)
        for(int j=0; j<s.width; j++)
            map[i*s.width + j] = RGB(255, 255, 255);

    setState();
}


void Mapper::fillColor(int r, int g, int b){
    for(int i=0; i<s.height; i++)
        for(int j=0; j<s.width; j++)
            *(map + i * s.width + j) = RGB(r, g, b);
}


void Mapper::randomize(){
    srand(time(NULL));

    for(int i=0; i<s.height; i++)
        for(int j=0; j<s.width; j++)
            *(map + i * s.width + j) = RGB(rand()%256, rand()%256, rand()%256);

    setState();
}


void Mapper::randomizeGrey(){
    srand(time(NULL));

    for(int i=0; i<s.height; i++)
        for(int j=0; j<s.width; j++){
            int c = rand()%256;
            *(map + i * s.width + j) = RGB(c, c, c);
        }

    setState();
}


void Mapper::drawRect(std::string alignment, RGB color, int top, int left, int height, int width){
    if(alignment == "center"){
        height = s.height/2;
        width = s.width/2;
        top = (s.height-height)/2;
        left = (s.width-width)/2;
    }

    for(int i = top; i<top+height; i++)
        for(int j=left; j<left+width; ++j)
            map[i*s.width + j] = color;

    setState();
}


void Mapper::drawCircle(std::string alignment, RGB color, int top, int left, int r){
    if(alignment == "center"){
        top = (s.height/2) - r;
        left = (s.width/2) - r;
    }

    int topMid = top+r;
    int leftMid = left+r;

    for(int i=top; i<top+2*r; i++){
        for(int j=left; j<left+2*r; ++j){
            if((i-top-r)*(i-top-r) + (j-left-r)*(j-left-r) <= r*r){
                map[i*s.width + j] = color;
            }
        }
    }


    // for(int i=top; i<top+2*r; i++){
    //     for(int j=left; j<left+2*r; ++j){
    //         if((i-topMid)*(i-topMid0) + (j-leftMid)*(j-leftMid) <= r*r){
    //             map[i*s.width + j] = color;
    //         }
    //     }
    // }

    setState();
}

void Mapper::setInfo(){
    std::ofstream fout(filename);
    assert(fout.is_open() == true);
    assert(areValid(filename, pType, s.height, s.width, max) == true);

    fout << pType << std::endl;
    fout << s.height << " " << s.width << std::endl;
    fout << max << std::endl;

    fout.close();
}

void Mapper::setState(){
    setInfo();

    std::ofstream fout(filename, std::ios::app);

    for(int i=0; i<s.height; i++){
        for(int j=0; j<s.width; ++j)
            fout << map[i*s.width + j].Pixel() << " ";
        fout << '\n';
    }
}