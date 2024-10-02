#pragma once

#include "Shapes.hpp"

namespace  map::shapes{

    struct Rect final : Shape{

        // use for named arguments
        struct Data{
            // DO NOT ACCESS THESE DIRECTLY
            clr::RGB color{};
            bool filled{false};
            int thickness{1};
            map::Alignment alignment{Alignment::none};
        };


        size_t width_;
        size_t height_;
        map::Alignment alignment;

        Rect(Point p, size_t w, size_t h, Data &&);

        protected:
        void draw(Mapper *m) const override;
        ShapePtr clone() const override;
    };
}
