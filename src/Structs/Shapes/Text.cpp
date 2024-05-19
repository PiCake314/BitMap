#include "Text.hpp"

map::shapes::Text::Text(const std::string &t, const Point &p, Data &&d)
: Shape(p, clr::RGB{}, false, 1), text{t}, font{d.font}, alignment{d.alignment}
{}


void map::shapes::Text::rotate(double angle){ /* do nothing */ }


// map::shapes::ShapePtr map::shapes::Text::rotated(double angle) const{
//     return std::make_unique<Text>(*this);
// }


// void map::shapes::Text::shift(const Point& p){
//     center += p;
// }


// map::shapes::ShapePtr map::shapes::Text::shifted(const Point p) const{
//     ShapePtr t = std::make_unique<Text>(text, center, Data{.font = font, .alignment = alignment});
//     t->shift(p);
//     return t;
// }


void map::shapes::Text::draw(Mapper *m) const{
    m->drawText(text, center, font, alignment);
}

map::shapes::ShapePtr map::shapes::Text::clone() const{
    return std::make_unique<Text>(*this);
}