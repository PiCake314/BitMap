#include "Shapes.hpp"

namespace map::shapes{

    struct Circle : Shape{

        // use for named arguments
        struct Data{
            // DO NOT ACCESS THESE DIRECTLY
            clr::RGB color{};
            bool filled{false};
            bool inverted{false};
            int thickness{};
            map::Alignment alignment{map::Alignment::none};
        };


        int radius;
        bool filled;
        bool inverted;
        map::Alignment alignment;

        Circle(Point p, int r, Data &&d)
        : Shape(p, d.color, d.thickness), radius(r), filled(d.filled), inverted(d.inverted), alignment(d.alignment) {}

        void rotate(double angle) override {}

        ShapePtr rotated(double angle) const override { return std::make_unique<Circle>(*this); }


        void shift(Point p) override {
            center += p;
        }

        ShapePtr shifted(Point p) const override {
            ShapePtr c = std::make_unique<Circle>(*this);
            c->shift(p);
            return c;
        }

        protected:
        void draw(Mapper *m) const override {
            m->drawCircle(center, radius, color, filled, inverted, thickness, alignment);
        }
    };
}