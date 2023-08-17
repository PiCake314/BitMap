#pragma once

#include "Shapes.hpp"

namespace map::shapes{
    
    struct Polygon : Shape{

        // use for named arguments
        struct Data{
            // DO NOT ACCESS THESE DIRECTLY
            clr::RGB color{};
            int thickness{};
        };


        Polygon(std::vector<Point> pts, Data &&);

        void rotate(double angle) override;

        ShapePtr rotated(double angle) const override;

        void shift(Point p) override;

        ShapePtr shifted(Point p) const override;

        protected:
        void draw(Mapper *m) const override;
    };
}