#pragma once

#include "Shapes.hpp"

namespace map::shapes{

    struct Ellipse : Shape{

        // use for named arguments
        struct Data{
            // DO NOT ACCESS THESE DIRECTLY
            clr::RGB color{};
            bool filled{false};
            bool inverted{false};
            int thickness{1};
            map::Alignment alignment{map::Alignment::none};
        };


        int r1;
        int r2;
        bool inverted;
        map::Alignment alignment;

        /**
         * @param r2: negative values will result in them being the same as r1.
        */
        Ellipse(Point p, int r1, int r2, Data &&);

        void rotate(double angle) override;

        // [[nodiscard]] ShapePtr rotated(double angle) const override;

        [[nodiscard]] std::vector<std::pair<int, int>> getLocks(Size, const int) const override;

        [[nodiscard]] bool onBorder(const Point&) const override;

        protected:
        void draw(Mapper *m) const override;
        ShapePtr clone() const override;
    };
}