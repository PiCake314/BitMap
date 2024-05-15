#pragma once

#include "Shapes.hpp"

namespace map::shapes{
    
    struct Polygon : Shape{

        // use for named arguments
        struct Data{
            // DO NOT ACCESS THESE DIRECTLY
            clr::RGB color{};
            int thickness{1};
            bool filled{};
        };


        Polygon(std::vector<Point> pts, Data &&);

        protected:
        void draw(Mapper *m) const override;
        ShapePtr clone() const override;
    };
}