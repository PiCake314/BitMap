#include "Line.hpp"


map::shapes::Line::Line(Point c, int len, double angle, Data &&d)
: Shape(c, d.color, d.thickness, {}), length(len), angle(angle) {}


map::Point map::shapes::Line::start() const {
    return {center.x - length/2 * cos(angle), center.y - length/2 * sin(angle)};
}


map::Point map::shapes::Line::end() const {
    return {center.x + length/2 * cos(angle), center.y + length/2 * sin(angle)};
}


void map::shapes::Line::rotate(double a){
    angle += a;
}


map::shapes::ShapePtr map::shapes::Line::rotated(double angle) const {
    ShapePtr l = std::make_unique<Line>(*this);
    l->rotate(angle);
    return l;
}


void map::shapes::Line::shift(Point p){
    center += p;
}

map::shapes::ShapePtr map::shapes::Line::shifted(Point p) const {
    ShapePtr l = std::make_unique<Line>(*this);
    l->shift(p);
    return l;
}


void map::shapes::Line::draw(Mapper *m) const {
    m->drawLine(start(), end(), color, thickness);
}