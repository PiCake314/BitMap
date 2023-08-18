#pragma once
#include "Shapes.hpp"

namespace map::shapes{

    struct Circle : Shape{

        // use for named arguments
        struct Data{
            // DO NOT ACCESS THESE DIRECTLY
            clr::RGB color{};
            bool filled{false};
            bool inverted{false};
            int thickness{};
            map::Alignment alignment{map::Alignment::none};
        };


        int radius;
        bool filled;
        bool inverted;
        map::Alignment alignment;

        constexpr Circle(Point p, int r, Data &&);

        constexpr void rotate(double angle) override;

        [[nodiscard]] constexpr ShapePtr rotated(double angle) const override;

        constexpr void shift(Point p) override;

        [[nodiscard]] constexpr ShapePtr shifted(Point p) const override;

        protected:
        constexpr void draw(Mapper *m) const override;
    };
}