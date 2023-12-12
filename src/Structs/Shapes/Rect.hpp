#pragma once

#include "Shapes.hpp"

namespace  map::shapes{
    struct Rect : Shape{

        // use for named arguments
        struct Data{
            // DO NOT ACCESS THESE DIRECTLY
            clr::RGB color{};
            bool filled{false};
            int thickness{1};
            map::RectAlignment rectAlignment{RectAlignment::none};
        };


        int width;
        int height;
        bool filled;
        map::RectAlignment rectAlignment;

        Rect(Point p, int w, int h, Data &&);

        protected:
        void draw(Mapper *m) const override;
    };
}