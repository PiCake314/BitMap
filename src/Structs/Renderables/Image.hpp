#pragma once

#include <filesystem>

#include "Renderables.hpp"
#include "../RGB.hpp"


namespace map::renderables{

    struct Image : Renderable{

        // use for named arguments
        struct Data{
            // DO NOT ACCESS THESE DIRECTLY
            double scale{1};
            map::Alignment alignment{map::Alignment::none};
        };


        std::filesystem::path filename;
        // Size size;
        double scale;
        map::Alignment alignment;


        Image(std::filesystem::path, const Point&, Data&&);

        [[nodiscard]] RenderablePtr clone() const override;

        ~Image() override;

        protected:
        void draw(Mapper *m) const override;

    };

}
