#include "Line.hpp"


map::shapes::Line::Line(Point c, int len, double angle, Data &&d)
: Shape(c, d.color, d.thickness, {}), length(len), angle(angle),
m_start({center.x - length/2 * cos(angle), center.y - length/2 * sin(angle)}),
m_end({center.x + length/2 * cos(angle), center.y + length/2 * sin(angle)})
{
    points.push_back(m_start);
    points.push_back(m_end);
}


map::shapes::Line::Line(Point s, Point e, Data &&d)
: Shape({(s.x + e.x)/2, (s.y + e.y)/2}, d.color, d.thickness, {}),
length(Point::dist(s, e)),
angle(std::atan2(e.y - s.y, e.x - s.x)),
m_start(s), m_end(e)
{
    points.push_back(m_start);
    points.push_back(m_end);
}


map::Point map::shapes::Line::start() const {
    return points.at(0);
}


map::Point map::shapes::Line::end() const {
    return points.at(1);
}


void map::shapes::Line::rotate(double a){
    angle += a;

    points.at(0) = {center.x - length/2 * cos(angle), center.y - length/2 * sin(angle)};
    points.at(1) = {center.x + length/2 * cos(angle), center.y + length/2 * sin(angle)};
}


map::shapes::ShapePtr map::shapes::Line::rotated(double angle) const {
    ShapePtr l = std::make_unique<Line>(*this);
    l->rotate(angle);
    return l;
}


void map::shapes::Line::shift(Point p){
    center += p;

    points.at(0) = {center.x - length/2 * cos(angle), center.y - length/2 * sin(angle)};
    points.at(1) = {center.x + length/2 * cos(angle), center.y + length/2 * sin(angle)};
}

map::shapes::ShapePtr map::shapes::Line::shifted(Point p) const {
    ShapePtr l = std::make_unique<Line>(*this);
    l->shift(p);
    return l;
}


bool map::shapes::Line::on(Point p) const {
    const Point p1 = start();
    const Point p2 = end();


    if(p.x < std::min(p1.x, p2.x) || p.x > std::max(p1.x, p2.x) || p.y < std::min(p1.y, p2.y) || p.y > std::max(p1.y, p2.y))
        return false;

    const double a = p2.y - p1.y;
    const double b = p1.x - p2.x;
    const double c = p2.x*p1.y - p1.x*p2.y;

    // calculates distance the distance squared 
    return (std::abs(a*p.x + b*p.y + c) * std::abs(a*p.x + b*p.y + c))/(a*a + b*b) <= std::pow(this->thickness/2., 2);
}


void map::shapes::Line::draw(Mapper *m) const {
    m->drawLine(start(), end(), color, thickness);
}