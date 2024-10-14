#include "Text.hpp"
#include "../../Mapper/Mapper.hpp"

map::renderables::Text::Text(const std::string_view t, const Point &p, Data &&d)
: Renderable{p}, text{t}, font{d.font}, alignment{d.alignment}
{}


// map::renderables::ShapePtr map::renderables::Text::rotated(double angle) const{
//     return std::make_unique<Text>(*this);
// }


// void map::renderables::Text::shift(const Point& p){
//     center += p;
// }


// map::renderables::ShapePtr map::renderables::Text::shifted(const Point p) const{
//     ShapePtr t = std::make_unique<Text>(text, center, Data{.font = font, .alignment = alignment});
//     t->shift(p);
//     return t;
// }


void map::renderables::Text::draw(Mapper *m) const{
    m->drawText(text, center, font, alignment);
}

map::renderables::RenderablePtr map::renderables::Text::clone() const{
    return std::make_unique<Text>(*this);
}
