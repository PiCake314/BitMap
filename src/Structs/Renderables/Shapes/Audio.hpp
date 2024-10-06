#pragma once

#include "Shapes.hpp"

namespace map::renderables::shapes{

    struct Audio final : Shape{

        std::string filename;
        double volume;
        const double speed;
        const bool loop;

        Audio(std::string, double volume = 1, double speed = 1, bool loop = false);

        RenderablePtr clone() const override;

        protected:
        void draw(Mapper *m) const override;

    };

}
