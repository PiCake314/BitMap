#include "Ellipse.hpp"


map::shapes::Ellipse::Ellipse(Point p, int r1, int r2, Data &&d)
: Shape(p, d.color, d.thickness), r1(r1), r2(r2), filled(d.filled), inverted(d.inverted), alignment(d.alignment)
{}


void map::shapes::Ellipse::rotate(double angle) {}


map::shapes::ShapePtr map::shapes::Ellipse::rotated(double angle) const { return std::make_unique<Ellipse>(*this); }


void map::shapes::Ellipse::shift(Point p){
    center += p;
}


map::shapes::ShapePtr map::shapes::Ellipse::shifted(Point p) const {
    ShapePtr e = std::make_unique<Ellipse>(*this);
    e->shift(p);
    return e;
}


void map::shapes::Ellipse::draw(Mapper *m) const {
    m->drawEllipse(center, r1, r2, color, filled, inverted, thickness, alignment);
}