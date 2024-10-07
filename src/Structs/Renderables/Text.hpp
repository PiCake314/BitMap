#pragma once

#include "Renderables.hpp"

namespace map::renderables::shapes{

    struct Text final : Renderable{

        // use for named arguments
        struct Data{
            // DO NOT ACCESS THESE DIRECTLY
            std::string font{""};
            map::Alignment alignment{map::Alignment::none};
        };


        std::string text;
        std::string font;
        map::Alignment alignment;

        Text(const std::string&, const Point&, Data &&);

        // [[nodiscard]] ShapePtr rotated(double angle) const override;

        // void shift(const Point& p) override; // doesn't need to be overriden (I think)

        // [[nodiscard]] ShapePtr shifted(const Point& p) const override;

        RenderablePtr clone() const override;

        protected:
        void draw(Mapper *m) const override;
    };
}
