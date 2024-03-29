#pragma once

#include "Shapes.hpp"

namespace map::shapes{

    struct Line : Shape{

        // use for named arguments
        struct Data{
            // DO NOT ACCESS THESE DIRECTLY
            clr::RGB color{};
            int thickness{};
        };


        int length;
        double angle;
        public:

        Line(Point c, int len, double angle, Data &&);

        Point start() const;

        Point end() const;

        void rotate(double a) override;

        [[nodiscard]] ShapePtr rotated(double angle) const override;

        void shift(Point p) override;

        [[nodiscard]] ShapePtr shifted(Point p) const override;

        protected:
        void draw(Mapper *m) const override;
    };
}