#include "Rect.hpp"

map::shapes::Rect::Rect(Point p, int w, int h, Data &&d)
: Shape( p, d.color, d.thickness, {{p.x - w/2, p.y - h/2}, {p.x + w/2, p.y - h/2}, {p.x + w/2, p.y + h/2}, {p.x - w/2, p.y + h/2}}),
width_(w), height_(h), filled(d.filled), rectAlignment(d.rectAlignment)
{
    
    switch(rectAlignment){
        case RectAlignment::top_left:
            center = {w/2, h/2};
            break;
        case RectAlignment::top_right:
            center = {width - w/2, h/2};
            break;
        case RectAlignment::bottom_left:
            center = {w/2, height - h/2};
            break;
        case RectAlignment::bottom_right:
            center = {width - w/2, height - h/2};
            break;
        case RectAlignment::center:
            center = {width/2., height/2.};
            break;
        case RectAlignment::width:
            center = {width/2., p.y};
            break;
        case RectAlignment::height:
            center = {p.x, height/2.};
            break;
        case RectAlignment::none:
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
    m->drawRect(center, height_, width_, color, filled, thickness, rectAlignment);
}