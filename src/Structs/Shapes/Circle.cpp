#include "Circle.hpp"


map::shapes::Circle::Circle(Point p, int r, Data &&d)
: Shape(p, d.color, d.thickness), radius(r), filled(d.filled), inverted(d.inverted), alignment(d.alignment)
{}


void map::shapes::Circle::rotate(double angle) {}


map::shapes::ShapePtr map::shapes::Circle::rotated(double angle) const { return std::make_unique<Circle>(*this); }


void map::shapes::Circle::draw(Mapper *m) const {
    m->drawCircle(center, radius, color, filled, inverted, thickness, alignment);
}