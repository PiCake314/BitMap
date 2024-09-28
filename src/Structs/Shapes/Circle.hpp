#pragma once

#include "Shapes.hpp"

namespace map::shapes{

    struct Circle final : Shape{

        // use for named arguments
        struct Data{
            // DO NOT ACCESS THESE DIRECTLY
            clr::RGB color{};
            bool filled{true};
            bool inverted{false};
            int thickness{1};
            map::Alignment alignment{map::Alignment::none};
        };


        int radius;
        bool inverted;
        map::Alignment alignment;

        Circle(Point p, int r, Data && = Data{.color = clr::RGB{}, .filled = true, .inverted = false, .thickness = 1, .alignment = map::Alignment::none});

        void rotate(double angle) override;

        // [[nodiscard]] ShapePtr rotated(double angle) const override;

        [[nodiscard]] std::vector<std::pair<size_t, size_t>> getLocks(Size, const size_t) const override;

        [[nodiscard]] bool onBorder(const Point&) const override;

        // [[nodiscard]] bool insideShape(const Point&) const override;

        protected:
        void draw(Mapper *m) const override;
        ShapePtr clone() const override;
    };
}
