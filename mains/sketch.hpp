#include "../src/Mapper/Mapper.hpp"

void canvas(map::Mapper &m){
	map::shapes::ShapePtr c1 = std::make_unique<map::shapes::Circle>(map::Point{static_cast<double>(width)/2, static_cast<double>(height)/2}, 100, map::clr::RED, true);

    m.draw(c1.get());
}