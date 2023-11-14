#include "Rect.hpp"


map::shapes::Rect::Rect(Point p, int w, int h, Data &&d)
: Shape(p, d.color, d.thickness, {{p.x - w/2, p.y - h/2}, {p.x + w/2, p.y - h/2}, {p.x + w/2, p.y + h/2}, {p.x - w/2, p.y + h/2}}),
width(w), height(h), filled(d.filled), rectAlignment(d.rectAlignment)
{}

void map::shapes::Rect::draw(Mapper *m) const {
    m->drawRect(center, height, width, color, filled, thickness, rectAlignment);
}