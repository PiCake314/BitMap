#pragma once

#include "Shapes.hpp"

namespace map::shapes{

    struct Text : Shape{

        // use for named arguments
        struct Data{
            // DO NOT ACCESS THESE DIRECTLY
            std::string font{""};
            map::Alignment alignment{map::Alignment::none};
        };


        const std::string text;
        const std::string font;
        const map::Alignment alignment;

        Text(std::string, Point, Data &&);

        void rotate(double angle) override;

        // [[nodiscard]] ShapePtr rotated(double angle) const override;

        // void shift(const Point& p) override; // doesn't need to be overriden (I think)

        // [[nodiscard]] ShapePtr shifted(const Point& p) const override;

        protected:
        void draw(Mapper *m) const override;
        ShapePtr clone() const override;
    };
}