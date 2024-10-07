#pragma once

#include "Renderables.hpp"
#include "../RGB.hpp"

#include <filesystem>

namespace map::renderables::shapes{

    struct Image final : Renderable{

        std::filesystem::path filename;
        clr::RGB *image = nullptr;
        double scale;
        Size size;

        Image(std::filesystem::path, double scale = 1);

        RenderablePtr clone() const override;

        protected:
        void draw(Mapper *m) const override;


        private:
            void loadPPM();

    };

}
