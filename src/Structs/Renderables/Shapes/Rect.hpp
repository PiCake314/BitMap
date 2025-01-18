#pragma once

#include "Shapes.hpp"

namespace  map::renderables::shapes{

    struct Rect final : Shape{

        // use for named arguments
        struct Data{
            // DO NOT ACCESS THESE DIRECTLY
            clr::RGB color{};
            bool filled{false};
            int thickness{1};
            map::Alignment alignment{Alignment::none};
        };


        map::Alignment alignment;

        Rect(ssize_t w, ssize_t h, const Point &p, Data &&);

        RenderablePtr clone() const override;

        protected:
        void draw(Mapper *m) const override;
    };
}
