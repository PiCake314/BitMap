#include "Image.hpp"
#include "../../../Config/DIRs.hpp"


#include <cstdlib>
#include <string>
#include <fstream>


map::renderables::shapes::Image::Image(std::filesystem::path fname, double scl)
: Shape{Point{}, clr::RGB{}, false, 0}, filename{std::move(fname)}, scale{scl}
{
    assert(std::filesystem::exists(filename));
    const auto &ext = filename.extension();

    if(ext != ".ppm"){
        // TODO: remove assert and check the result of std::system instead
        assert(ext == "png" or ext == "jpg" or ext == "jpeg" or ext == ".pdf");

        // we'll do 1000 dpi for now just to ensure quality..
        std::system((
            ("magick -density 1000 "
            + filename.string()
            + " -background white -alpha remove -alpha off -quality 90 -resize "
            + std::to_string(static_cast<int>(scale * 100))
            + '%')
            + (PPMS_TEMP_DIR / filename.filename().replace_extension(".ppm")).string()
        ).c_str());
    }

    loadPPM();

}


void map::renderables::shapes::Image::loadPPM() {
    std::ifstream fin(filename);
    assert(fin.is_open());


    std::string width;
    std::string height;
    std::string waste;

    // assuming image is valid, we're not gonna check if the width and/or height are valid.
    // discard P type and Max value. Assume it's 255
    fin >> waste >> width >> height >> waste;

    size = {std::stoul(width), std::stoul(height)};


    if(image) delete[] image;

    image = new clr::RGB[size.height * size.width];

    for(size_t i = 0; i < size.height; ++i){
        for(size_t j = 0; j < size.width; ++j){
            size_t r,g,b; fin >> r >> g >> b;
            image[i*size.width + j] = clr::RGB(r, g, b);
        }
    }
}


map::renderables::RenderablePtr map::renderables::shapes::Image::clone() const {
    return std::make_unique<Image>(*this);
}



void map::renderables::shapes::Image::draw(Mapper *m) const {
    throw 1;
}
