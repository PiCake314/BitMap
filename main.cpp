#include <iostream>
#include "Mapper/Mapper.hpp"
// #include <string>


// //TODO: OUT DATED - FIX!!!
// void drawKuwaitFlag(Mapper &m){
//     m.drawRect("width", RGB(0, 255, 0), 0, 0, 0.3);

//     m.drawRect("width", RGB(255, 0, 0), 70, 0, 0.3);

//     m.drawCircle("", RGB(0, 0, 0), 50, 0, -70);
// }


int main(int argc, char** argv){
    if(argc < 2){
        std::cerr << "Usage: ./a.out + <command> (reset/load)" << std::endl;
        return 0;
    }
    //

    Mapper m("output.ppm", "P3", 100, 200, 255, argv[1]);
    
    m.drawRect("width", RGB(0, 255, 0), 0, 0, 33);

    m.drawRect("width", RGB(255, 0, 0), 67, 0, 33);

    m.drawCircle("", RGB(0, 0, 0), 50, 0, -50);
    
}