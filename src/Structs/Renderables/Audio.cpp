#include "Audio.hpp"
#include "../../Mapper/Mapper.hpp"


map::renderables::shapes::Audio::Audio(std::string fname, double vol, double spd, bool loops)
: Renderable{Point{}}, filename{std::move(fname)}, volume{vol}, speed{spd}, loop{loops}
{}

void map::renderables::shapes::Audio::draw(Mapper *m) const {
    m->m_Sounds.push_back({*this, m->m_Current_frame});
}

map::renderables::RenderablePtr map::renderables::shapes::Audio::clone() const {
    return std::make_unique<Audio>(*this);
}
