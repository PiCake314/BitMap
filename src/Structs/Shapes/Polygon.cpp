#include "Polygon.hpp"



map::shapes::Polygon::Polygon(std::vector<Point> pts, Data &&d)
: Shape{
    std::accumulate(pts.begin(), pts.end(), Point(), [](Point p1, Point p2){ return p1 + p2; })/pts.size(),
    d.color,
    d.filled,
    d.thickness,
    pts
}
{}

void map::shapes::Polygon::draw(Mapper *m) const {
    m->drawPolygon<true>(points, color, filled, thickness);
}

map::shapes::ShapePtr map::shapes::Polygon::clone() const {
    return std::make_unique<Polygon>(*this);
}
