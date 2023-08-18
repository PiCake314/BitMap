#include "Triangle.hpp"



map::shapes::Triangle::Triangle(Point p1, Point p2, Point p3, Data &&d)
: Shape({(p1.x + p2.x + p3.x)/3, (p1.y + p2.y + p3.y)/3}, d.color, d.thickness, {p1, p2, p3})
{}


void map::shapes::Triangle::rotate(double angle) {
    for(auto &p : points){
        p -= center;

        double ROT_MAT[2][2] = {
            {cos(angle), -sin(angle)},
            {sin(angle), cos(angle)}
        };

        p = ROT_MAT * p;
        p += center;
    }
}


map::shapes::ShapePtr map::shapes::Triangle::rotated(double angle) const {
    ShapePtr t = std::make_unique<Triangle>(*this);
    t->rotate(angle);
    return t;
}


void map::shapes::Triangle::shift(Point p){
    center += p;
}


map::shapes::ShapePtr map::shapes::Triangle::shifted(Point p) const {
    ShapePtr t = std::make_unique<Triangle>(*this);
    t->shift(p);
    return t;
}


void map::shapes::Triangle::draw(Mapper *m) const {
    // m->drawTriangle(points[0], points[1], points[2], color, thickness);
}