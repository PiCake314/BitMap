#pragma once

#include "Shapes.hpp"

namespace map::shapes{

    struct Triangle : Shape{

        // use for named arguments
        struct Data{
            // DO NOT ACCESS THESE DIRECTLY
            clr::RGB color{};
            int thickness{};
        };


        Triangle(Point p1, Point p2, Point p3, Data &&);

        void rotate(double angle) override;

        [[nodiscard]] ShapePtr rotated(double angle) const override;

        void shift(Point p) override;

        [[nodiscard]] ShapePtr shifted(Point p) const override;

        protected:
        void draw(Mapper *m) const override;
    };
}