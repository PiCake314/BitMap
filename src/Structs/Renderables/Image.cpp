#include "Image.hpp"
#include "../../Config/DIRs.hpp"


#include <string>
#include <fstream>

#include <cassert>
#include <cstdlib>


map::renderables::Image::Image(std::filesystem::path fname, const Point &center, Data &&d)
: Renderable{center}, filename{std::move(fname)}, scale{d.scale}, alignment{d.alignment} {
    
}


map::renderables::RenderablePtr map::renderables::Image::clone() const {
    return std::make_unique<Image>(*this);
}



void map::renderables::Image::draw(Mapper *m) const {
    throw 1;
}


map::renderables::Image::~Image() = default;
