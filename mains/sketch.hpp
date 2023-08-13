#include "../src/Mapper/Mapper.hpp"

void image(map::Mapper &m){
	map::shapes::ShapePtr c1 = std::make_unique<map::shapes::Circle>(map::Point{float(width)/2, float(height)/2}, 100, map::clr::RED, true);

    m.draw(c1.get());
}


void video(map::Mapper &m){

}

