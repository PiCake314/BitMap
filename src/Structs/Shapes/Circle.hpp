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
            int thickness{1};
            map::Alignment alignment{map::Alignment::none};
        };


        int radius;
        bool inverted;
        map::Alignment alignment;

        Circle(Point p, int r, Data &&);

        void rotate(double angle) override;

        [[nodiscard]] ShapePtr rotated(double angle) const override;

        [[nodiscard]] std::vector<std::pair<int, int>> getLocks(Size, const int) const override;

        [[nodiscard]] bool onBorder(const Point&) const override;

        protected:
        void draw(Mapper *m) const override;
    };
}