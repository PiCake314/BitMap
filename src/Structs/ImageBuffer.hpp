#pragma once

#include <cassert>
#include <filesystem>
#include <fstream>
#include <utility>

#include "RGB.hpp"
#include "../Utility/Size.hpp"
#include "Point.hpp"
#include "../Config/DIRs.hpp"


namespace map::img{

    class ImageBuffer final {

        std::filesystem::path filename;
        double scale;

        clr::RGB *image = nullptr;
        Size size;
        clr::RGB transparent_color;

        public:

        ImageBuffer(std::filesystem::path fname, const double scale)
        : filename{std::move(fname)}, scale{scale}, transparent_color{0xF8, 0xC3, 0x00}
        {
            std::filesystem::create_directories(map::dirs::PPMS_TEMP_DIR);
            assert(std::filesystem::exists(filename));
            const auto &ext = filename.extension();

            if(ext != ".ppm"){
                // TODO: remove assert and check the result of std::system instead
                assert(ext == ".png" or ext == ".jpg" or ext == ".jpeg" or ext == ".pdf");

                // we'll do 1000 dpi for now just to ensure quality..
                int res = std::system((
                    ("magick -density 1000 "
                    + filename.string() // FF5733 (another alternative for transparent color)
                    + " -background \"#F8C300\" -alpha remove -alpha off -quality 90 -resize "
                    + std::to_string(static_cast<int>(scale * 100))
                    + "% -compress none ")
                    + (map::dirs::PPMS_TEMP_DIR / filename.filename().replace_extension(".ppm")).string()
                ).c_str());

                assert(res == 0 && "Image conversion failed");
            }

            loadPPM();
        }


        ImageBuffer(const ImageBuffer&) = delete;
        ImageBuffer &operator=(const ImageBuffer&) = delete;


        ImageBuffer(ImageBuffer&&) noexcept = default;
        ImageBuffer &operator=(ImageBuffer&&) noexcept = default;

        std::string_view getFilename() const noexcept { return filename.c_str(); }

        double getScale() const noexcept { return scale; }

        Size getSize() const noexcept { return size; }

        const clr::RGB &getTransparentColor() const noexcept { return transparent_color; }


        clr::RGB &operator[](size_t i) noexcept { return image[i]; }

        clr::RGB &operator[](const Point &p) noexcept { return image[size_t(p.y)*size.width + size_t(p.x)]; }


        const clr::RGB &operator[](size_t i) const noexcept { return image[i]; }

        const clr::RGB &operator[](const Point &p) const noexcept { return image[size_t(p.y)*size.width + size_t(p.x)]; }


        ~ImageBuffer() {
            if(image) delete[] image;
        }

        private:
            void loadPPM() {
                std::ifstream fin(map::dirs::PPMS_TEMP_DIR / filename.filename().replace_extension(".ppm"));
                assert(fin.is_open() && "Image doesn't exist");


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
                        int r,g,b; fin >> r >> g >> b;

                        image[i*size.width + j] = clr::RGB{uint8_t(r), uint8_t(g), uint8_t(b)};
                    }
                }
            }

    };

}
