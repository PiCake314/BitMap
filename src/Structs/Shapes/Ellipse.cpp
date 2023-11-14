#include "Ellipse.hpp"


map::shapes::Ellipse::Ellipse(Point p, int r1, int r2, Data &&d)
: Shape(p, d.color, d.thickness), r1(r1), r2(r2), filled(d.filled), inverted(d.inverted), alignment(d.alignment)
{}


void map::shapes::Ellipse::rotate(double angle) {
    throw std::runtime_error("Ellipse::rotate() is not implemented");
}

map::shapes::ShapePtr map::shapes::Ellipse::rotated(double angle) const {
    throw std::runtime_error("Ellipse::rotated() is not implemented");

    return std::make_unique<Ellipse>(*this);
}


void map::shapes::Ellipse::draw(Mapper *m) const {
    m->drawEllipse(center, r1, r2, color, filled, inverted, thickness, alignment);
}