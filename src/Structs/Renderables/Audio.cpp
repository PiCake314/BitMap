#include "Audio.hpp"
#include "../../Mapper/Mapper.hpp"


map::renderables::Audio::Audio(std::string fname, Data &&d)
: Renderable{Point{}}, filename{std::move(fname)}, volume{d.volume}, speed{d.speed}, loop{d.loop}
{}

void map::renderables::Audio::draw(Mapper *m) const {
    m->m_Sounds.push_back({*this, m->m_Current_frame});
}

map::renderables::RenderablePtr map::renderables::Audio::clone() const {
    return std::make_unique<Audio>(*this);
}
