// #include "Latex.hpp"
// #include "../../Config/DIRs.hpp"


// #include <string>
// #include <fstream>

// #include <cassert>
// #include <cstdlib>


// map::renderables::Latex::Latex(std::string_view tex, const Point &center, Data &&d)
// : Image{map::dirs::TEMP_PDFS_DIR / ("tex" + std::to_string(tex_id++)), center, {scale{d.scale}, alignment{d.alignment}}}
// {
//     std::filesystem::create_directories(map::dirs::PPMS_TEMP_DIR);
//     assert(std::filesystem::exists(filename));
//     const auto &ext = filename.extension();

//     if(ext != ".ppm"){
//         // TODO: remove assert and check the result of std::system instead
//         assert(ext == ".png" or ext == ".jpg" or ext == ".jpeg" or ext == ".pdf");

//         // we'll do 1000 dpi for now just to ensure quality..
//         int res = std::system((
//             ("magick -density 1000 "
//             + filename.string() // FF5733 (another alternative for transparent color)
//             + " -background \"#F8C300\" -alpha remove -alpha off -quality 90 -resize "
//             + std::to_string(static_cast<int>(scale * 100))
//             + "% -compress none ")
//             + (PPMS_TEMP_DIR / filename.filename().replace_extension(".ppm")).string()
//         ).c_str());

//         assert(res == 0 && "Latex conversion failed");
//     }

//     loadPPM();

// }


// void map::renderables::Latex::loadPPM() {
//     std::ifstream fin(PPMS_TEMP_DIR / filename.filename().replace_extension(".ppm"));
//     assert(fin.is_open() && "Latex doesn't exist");


//     std::string width;
//     std::string height;
//     std::string waste;

//     // assuming image is valid, we're not gonna check if the width and/or height are valid.
//     // discard P type and Max value. Assume it's 255
//     fin >> waste >> width >> height >> waste;

//     size = {std::stoul(width), std::stoul(height)};


//     if(image) delete[] image;

//     image = new clr::RGB[size.height * size.width];

//     for(size_t i = 0; i < size.height; ++i){
//         for(size_t j = 0; j < size.width; ++j){
//             int r,g,b; fin >> r >> g >> b;

//             image[i*size.width + j] = clr::RGB{uint8_t(r), uint8_t(g), uint8_t(b)};
//         }
//     }
// }


// map::renderables::RenderablePtr map::renderables::Latex::clone() const {
//     return std::make_unique<Latex>(*this);
// }



// void map::renderables::Latex::draw(Mapper *m) const {
//     throw 1;
// }


// map::renderables::Latex::~Latex(){
//     if(image) delete[] image;
// }
