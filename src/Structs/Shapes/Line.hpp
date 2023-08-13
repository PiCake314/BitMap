#include "Shapes.hpp"

namespace map{
    class Mapper;

    namespace shapes{

        struct Line : Shape{
            friend class Mapper;

            int length;
            double angle;
            public:

            Line(Point c, int len, double angle, clr::RGB color = clr::RGB(), int thickness = 0)
            : Shape(c, color, thickness, {}), length(len), angle(angle) {}

            Point start() const{
                return {center.x - length/2 * cos(angle), center.y - length/2 * sin(angle)};
            }

            Point end() const{
                return {center.x + length/2 * cos(angle), center.y + length/2 * sin(angle)};
            }

            void rotate(double a) override {
                angle += a;
            }

            ShapePtr rotated(double angle) const override {
                ShapePtr l = std::make_unique<Line>(*this);
                l->rotate(angle);
                return l;
            }

            void shift(Point p) override {
                center += p;
            }

            ShapePtr shifted(Point p) const override {
                ShapePtr l = std::make_unique<Line>(*this);
                l->shift(p);
                return l;
            }

            void draw(Mapper *m) const override {
                m->drawLine(start(), end(), color, thickness);
            }
        };
    }
}