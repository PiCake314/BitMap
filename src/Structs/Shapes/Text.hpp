#pragma once
#include "Shapes.hpp"

namespace map::shapes{

    struct Text : Shape{

        // use for named arguments
        struct Data{
            // DO NOT ACCESS THESE DIRECTLY
            std::string font{"Default"};
            map::Alignment alignment{map::Alignment::none};
        };


        std::string text;
        std::string font;
        map::Alignment alignment;

        Text(std::string, Point, Data &&);

        void rotate(double angle) override;

        [[nodiscard]] ShapePtr rotated(double angle) const override;

        void shift(Point p) override;

        [[nodiscard]] ShapePtr shifted(Point p) const override;

        [[nodiscard]] size_t size() const;

        protected:
        void draw(Mapper *m) const override;
    };
}