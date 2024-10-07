#include "Text.hpp"
#include "../../Mapper/Mapper.hpp"

map::renderables::shapes::Text::Text(const std::string &t, const Point &p, Data &&d)
: Renderable{p}, text{t}, font{d.font}, alignment{d.alignment}
{}


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
