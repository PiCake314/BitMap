#include "Shapes.hpp"

namespace map{
    class Mapper;

    namespace shapes{

        struct Circle : Shape{
            int radius;
            bool filled;
            bool inverted;
            map::Alignment alignment;

            Circle(Point p, int r, clr::RGB c = clr::RGB(), bool filled = false, bool inverted = false, int thickness = false, map::Alignment alignment = map::Alignment::none)
            : radius(r), filled(filled), inverted(inverted), alignment(alignment), Shape(p, c, thickness) {}

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

            void draw(Mapper *m) const override {
                m->drawCircle(center, radius, color, filled, inverted, thickness, alignment);
            }
        };
    }
}