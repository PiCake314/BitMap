#pragma once

#include "Shapes.hpp"

namespace map::shapes{

    struct Audio final : Shape{

        std::string filename;
        double volume;
        const double speed;
        const bool loop;

        Audio(const std::string&, double volume = 1, double speed = 1, bool loop = false);


        protected:
        void draw(Mapper *m) const override;
        ShapePtr clone() const override;

    };

}
