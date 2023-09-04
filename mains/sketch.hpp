#include "../src/Mapper/Mapper.hpp" // importing the library

extern int height, width; // importing the height and width of the canvas



void canvas(map::Mapper &m){
    std::vector<map::Point> star;
    for(int i = 0; i < 5; i++){
        star.push_back({width/2. + 100*cos(i * 2 * M_PI/5), height/2. + 100*sin(i * 2 * M_PI/5)});
        star.push_back({width/2. + 50*cos((i + .5) * 2 * M_PI/5), height/2. + 50*sin((i + .5) * 2 * M_PI/5)});
    }

    // std::cout << "Points:\n";
    // for(const auto &p : star)
    //     std::cout << p << '\n';

    m.drawPolygon(star, map::clr::RGB(100, 20, 150), true);
}