#include "Rect.hpp"

map::renderables::shapes::Rect::Rect(ssize_t w, ssize_t h, const Point &p, Data &&d)
: Shape(p, d.color, d.filled, d.thickness, {{p.x - w/2, p.y - h/2}, {p.x + w/2, p.y - h/2}, {p.x + w/2, p.y + h/2}, {p.x - w/2, p.y + h/2}}),
alignment(d.alignment)
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
    size = {size_t(w), size_t(h)};
}

void map::renderables::shapes::Rect::draw(Mapper *m) const {
    m->drawRect<true>(size.width, size.height, center, color, filled, thickness, alignment);
}

map::renderables::RenderablePtr map::renderables::shapes::Rect::clone() const {
    return std::make_unique<Rect>(*this);
}
