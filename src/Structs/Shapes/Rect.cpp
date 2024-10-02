#include "Rect.hpp"

map::shapes::Rect::Rect(Point p, size_t w, size_t h, Data &&d)
: Shape( p, d.color, d.filled, d.thickness, {{p.x - w/2, p.y - h/2}, {p.x + w/2, p.y - h/2}, {p.x + w/2, p.y + h/2}, {p.x - w/2, p.y + h/2}}),
width_(w), height_(h), alignment(d.alignment)
{

    switch(alignment){
        case map::Alignment::center :
            center = {Config::width/2., Config::height/2.};
            break;

        case map::Alignment::none:
            center = p;
            break;
    }

    points =
    {
        {center.x - w/2, center.y - h/2},
        {center.x + w/2, center.y - h/2},
        {center.x + w/2, center.y + h/2},
        {center.x - w/2, center.y + h/2}
    };

    // for(auto &point : points){
    //     std::clog << point << std::endl;
    // }
}

void map::shapes::Rect::draw(Mapper *m) const {
    m->drawRect<true>(center, height_, width_, color, filled, thickness, alignment);
}

map::shapes::ShapePtr map::shapes::Rect::clone() const {
    return std::make_unique<Rect>(*this);
}
