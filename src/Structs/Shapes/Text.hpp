#pragma once

#include "Shapes.hpp"

namespace map::shapes{

    struct Text final : Shape{

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

        void rotate(double angle) override;

        // [[nodiscard]] ShapePtr rotated(double angle) const override;

        // void shift(const Point& p) override; // doesn't need to be overriden (I think)

        // [[nodiscard]] ShapePtr shifted(const Point& p) const override;

        protected:
        void draw(Mapper *m) const override;
        ShapePtr clone() const override;
    };
}