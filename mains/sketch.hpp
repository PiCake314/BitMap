
void image(map::Mapper &m){
	map::shapes::ShapePtr c = std::make_unique<map::shapes::Circle>(map::Point{static_cast<double>(width)/2, static_cast<double>(height)/2}, 100, map::clr::RED, true);
	m.draw(c.get());

}


void video(map::Mapper &m){

}

