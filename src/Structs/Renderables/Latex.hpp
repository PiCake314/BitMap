#pragma once

#include <string_view>

#include "Renderables.hpp"
#include "Image.hpp"
#include "../RGB.hpp"


namespace map::renderables{

    struct Latex : map::renderables::Image{

        std::string_view latex;

        Latex(std::string_view, const Point&, Image::Data&&);

        [[nodiscard]] RenderablePtr clone() const override;

        ~Latex() override;


        private:
            inline static size_t tex_id = 1;

    };

}
