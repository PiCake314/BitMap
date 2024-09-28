#include "Audio.hpp"


map::shapes::Audio::Audio(const std::string &fname, double vol, double spd, bool loops)
: Shape{Point{}, clr::RGB{}, false, 0}, filename{fname}, volume{vol}, speed{spd}, loop{loops}
{}

void map::shapes::Audio::draw(Mapper *m) const {
    m->m_Sounds.push_back({*this, m->m_Current_frame});
}

map::shapes::ShapePtr map::shapes::Audio::clone() const {
    return std::make_unique<Audio>(*this);
}
