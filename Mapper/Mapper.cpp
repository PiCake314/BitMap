#include "Mapper.hpp"
#include <cassert>

Mapper::Mapper(std::string fn, int height, int width){
    assert(fn.length() > 4);
    assert(fn.substr(fn.length()-4, 4) == ".ppm");

    filename = fn;
    s.height = height;
    s.width = width;

    file.open(fn, std::ios::app);
    file << "P3" << std::endl;
    file << height << " " << width << std::endl;
    file << 255 << std::endl;
}


Mapper::~Mapper(){
    file.close();
}


void Mapper::fillWhite(){
    for(int i = s.height; i--;){
        for(int j = s.width; j--;)
            file << "255 255 255 ";
        file << '\n';
    }
}


void Mapper::randomize(){
    srand(time(NULL));
    
    for(int i = s.height; i--;){
        for(int j = s.width; j--;)
            file << rand()%256 << " " << rand()%256 << " " << rand()%256 << " ";
        file << '\n';
    }

}


void Mapper::randomizeGrey(){
    srand(time(NULL));

    for(int i = s.height; i--;){
        for(int j = s.width; j--;){
            int c = rand()%256;
            file << c << " " << c << " " << c << " ";
        }
        file << '\n';
    }
}


void Mapper::removePixel(){
    std::string word;
    for(int i=3; i--;){
        file >> word;
        for(int j=word.length(); j--;)
            file << '\r';
    }
}


void Mapper::drawRect(int top, int left, int len, int wid){
    for(int i=0; i<s.height; i++){
        for(int j=0; j<s.width; j++){
            if(i >= top && i < top+len && j >= left && j < left+wid){
                removePixel();
                file << "255 0 0 ";
            }
            else
                file << "255 255 255 ";
        }
        file << '\n';
    }
}


    // std::string line;
    // for(int i=top; i--;)
    //     getline(file, line);

    // std::string word;
    // for(int i=left; i--;)
    //     for(int j=3; j--;)
    //         file >> word;
    
    // for(int i=wid; i--;)
    //     for(int j=3; j--;){
    //         file >> word;
    //         for(int k=word.length()+1; k--;)
    //             file << '\r';
    //         file << '\r';
    //     }

    // for(int i=wid; i--;)
    //     file << "255 0 0 ";
