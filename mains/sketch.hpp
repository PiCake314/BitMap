

map::shapes::ShapePtr scene(int frame, const int frames){
	return std::make_unique<map::shapes::Circle>(map::shapes::Circle(map::Point{0 + width *(float(frame)/frames), float(height/2)}, 20));
}


void image(map::Mapper &m){
	map::shapes::ShapePtr c = std::make_unique<map::shapes::Circle>(map::Point{static_cast<double>(width)/2, static_cast<double>(height)/2}, 100, map::clr::RED, true);
	m.draw(c.get());

}


void video(map::Mapper &m){

}

