#include "Rect.hpp"


map::shapes::Rect::Rect(Point p, int w, int h, Data &&d)
: Shape(p, d.color, d.thickness, {{p.x - w/2, p.y - h/2}, {p.x + w/2, p.y - h/2}, {p.x + w/2, p.y + h/2}, {p.x - w/2, p.y + h/2}}),
width(w), height(h), filled(d.filled), rectAlignment(d.rectAlignment)
{}


void map::shapes::Rect::rotate(double angle){
    for(auto &point : points){
        point -= center;

        double ROT_MAT[2][2] = {
            {cos(angle), -sin(angle)},
            {sin(angle), cos(angle)}
        };

        point = ROT_MAT * point;
        point += center;
    }
}


map::shapes::ShapePtr map::shapes::Rect::rotated(double angle) const {
    ShapePtr r = std::make_unique<Rect>(*this);
    r->rotate(angle);
    return r;
}


void map::shapes::Rect::shift(Point p){
    center += p;
}


map::shapes::ShapePtr map::shapes::Rect::shifted(Point p) const {
    ShapePtr r = std::make_unique<Rect>(*this);
    r->shift(p);
    return r;
}


void map::shapes::Rect::draw(Mapper *m) const {
    m->drawRect(center, height, width, color, filled, thickness, rectAlignment);
}