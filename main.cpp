#include <iostream>
#include "Mapper/Mapper.hpp"
#include <string>



int main(int argc, char** argv){
    if(argc < 2){
        std::cerr << "Usage: ./a.out + <command> (reset/load)" << std::endl;
        return 0;
    }

    Mapper m("output.ppm", "P3", 100, 100, 255, argv[1]);

    // m.fillWhite();

    // m.drawCircle("", RGB(100, 0, 100), 100, 235, 55);

    m.drawRect("center", RGB(255, 0, 0));

    // m.drawCircle("", RGB(0, 0, 0), 200, 200, 100);
    
}