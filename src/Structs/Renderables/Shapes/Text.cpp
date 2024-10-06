#include "Text.hpp"

map::renderables::shapes::Text::Text(const std::string &t, const Point &p, Data &&d)
: Shape(p, clr::RGB{}, false, 1), text{t}, font{d.font}, alignment{d.alignment}
{}


void map::renderables::shapes::Text::rotate(double){ /* do nothing */ }


// map::renderables::shapes::ShapePtr map::renderables::shapes::Text::rotated(double angle) const{
//     return std::make_unique<Text>(*this);
// }


// void map::renderables::shapes::Text::shift(const Point& p){
//     center += p;
// }


// map::renderables::shapes::ShapePtr map::renderables::shapes::Text::shifted(const Point p) const{
//     ShapePtr t = std::make_unique<Text>(text, center, Data{.font = font, .alignment = alignment});
//     t->shift(p);
//     return t;
// }


void map::renderables::shapes::Text::draw(Mapper *m) const{
    m->drawText(text, center, font, alignment);
}

map::renderables::RenderablePtr map::renderables::shapes::Text::clone() const{
    return std::make_unique<Text>(*this);
}
