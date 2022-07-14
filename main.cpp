#include <iostream>
#include "Mapper/Mapper.hpp"
#include <string>



int main(int argc, char** argv){
    Mapper m("output.ppm", 10, 10);

    if(argc < 2 || !isdigit(argv[1][0]) || std::stoi(argv[1]) < 1 || std::stoi(argv[1]) > 3){
        std::cout << "Usage: " << argv[0] << " <Number>" << std::endl;
        std::cout << "1. White / 2. Randomize / 3. Draw Rect" << std::endl;
        return 0;
    }

    if(std::stoi(argv[1]) == 1)
        m.fillWhite();
    else if(std::stoi(argv[1]) == 2)
        m.randomize();
    else if(std::stoi(argv[1]) == 3)
        m.drawRect(25, 25, 50, 50);
    else
        std::cout << "Error: Invalid number" << std::endl;

}