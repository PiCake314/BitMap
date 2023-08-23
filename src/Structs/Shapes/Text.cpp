#include "Text.hpp"

map::shapes::Text::Text(std::string t, Point p, Data &&d)
: Shape(p, clr::RGB{}, 1), text{t}, font{d.font}, alignment{d.alignment}
{}


void map::shapes::Text::rotate(double angle){ /* do nothing */ }


map::shapes::ShapePtr map::shapes::Text::rotated(double angle) const{
    return std::make_unique<Text>(text, center, Data{.font = font, .alignment = alignment});
}


void map::shapes::Text::shift(Point p){
    center += p;
}


map::shapes::ShapePtr map::shapes::Text::shifted(Point p) const{
    ShapePtr t = std::make_unique<Text>(text, center, Data{.font = font, .alignment = alignment});
    t->shift(p);
    return t;
}


size_t map::shapes::Text::size() const{
    return text.size();
}


void map::shapes::Text::draw(Mapper *m) const{
    m->drawText(text, center, font, alignment);
}