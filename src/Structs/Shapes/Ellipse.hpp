#include "Shapes.hpp"

namespace map{
    class Mapper;

    namespace shapes{

        struct Ellipse : Shape{
            int r1;
            int r2;
            bool filled;
            bool inverted;
            map::Alignment alignment;

            /**
             * @param r2: negative values will result in them being the same as r1.
            */
            Ellipse(Point p, int r1, int r2, clr::RGB c = clr::RGB(), bool filled = false, bool inverted = false, int thickness = 0, map::Alignment alignment = map::Alignment::none)
            : r1(r1), r2(r2), filled(filled), inverted(inverted), alignment(alignment), Shape(p, c, thickness) {}

            void rotate(double angle) override {}

            ShapePtr rotated(double angle) const override { return std::make_unique<Ellipse>(*this); }


            void shift(Point p) override {
                center += p;
            }

            ShapePtr shifted(Point p) const override {
                ShapePtr e = std::make_unique<Ellipse>(*this);
                e->shift(p);
                return e;
            }

            void draw(Mapper * m) const override {
                m->drawEllipse(center, r1, r2, color, filled, inverted, thickness, alignment);
            }
        };
    }
}