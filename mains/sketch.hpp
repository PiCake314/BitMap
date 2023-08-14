#include "../src/Mapper/Mapper.hpp"

extern int height, width;


map::shapes::Shape *scene(int frame, const int frames){
    map::Point p{width * static_cast<double>(frame)/frames, static_cast<double>(height)/2};

    return new map::shapes::Circle{p, 150, map::clr::RED, true};
}



void canvas(map::Mapper &m){
    // bool is_filled = true;
    // map::Point center{static_cast<double>(width)/2, static_cast<double>(height)/2};
    // int radius = 150;

	// // map::shapes::ShapePtr c1 = std::make_unique<map::shapes::Circle>(center, radius, map::clr::RED, is_filled);
    // map::shapes::Circle c2{center, radius, map::clr::RED, is_filled};

    // m.draw(&c2);

    m.animate(scene, 1);

}