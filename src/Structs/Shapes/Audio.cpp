#include "Audio.hpp"


map::shapes::Audio::Audio(const std::string &filename, double volume, double speed, bool loop)
: Shape{Point{}, clr::RGB{}, false, 0}, filename{filename}, volume{volume}, speed{speed}, loop{loop}
{}

void map::shapes::Audio::draw(Mapper *m) const {
    m->m_Sounds.push_back({*this, m->m_Current_frame});
}

map::shapes::ShapePtr map::shapes::Audio::clone() const {
    return std::make_unique<Audio>(*this);
}