#pragma once

#include "Shapes.hpp"

namespace  map::shapes{
    struct Rect : Shape{

        // use for named arguments
        struct Data{
            // DO NOT ACCESS THESE DIRECTLY
            clr::RGB color{};
            bool filled{false};
            int thickness{};
            map::RectAlignment rectAlignment{RectAlignment::Rnone};
        };


        int width;
        int height;
        bool filled;
        map::RectAlignment rectAlignment;

        Rect(Point p, int w, int h, Data &&);

        void rotate(double angle) override;

        ShapePtr rotated(double angle) const override;

        void shift(Point p) override;

        ShapePtr shifted(Point p) const override;

        protected:
        void draw(Mapper *m) const override;
    };
}