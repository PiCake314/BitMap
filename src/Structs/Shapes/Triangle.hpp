#include "Shapes.hpp"

namespace map{
    class Mapper;

    namespace shapes{

        struct Triangle : Shape{
            friend class Mapper;


            Triangle(Point p1 = Point(), Point p2 = Point(), Point p3 = Point(), clr::RGB c = clr::RGB(), int t = 0)
            : Shape({(p1.x + p2.x + p3.x)/3, (p1.y + p2.y + p3.y)/3}, c, t, {p1, p2, p3}) {}


            void rotate(double angle) override {
                for(auto &p : points){
                    p -= center;
                    p = ROT_MAT * p;
                    p += center;
                }
            }

            ShapePtr rotated(double angle) const override {
                ShapePtr t = std::make_unique<Triangle>(*this);
                t->rotate(angle);
                return t;
            }

            void shift(Point p) override {
                center += p;
            }

            ShapePtr shifted(Point p) const override {
                ShapePtr t = std::make_unique<Triangle>(*this);
                t->shift(p);
                return t;
            }

            void draw(Mapper *m) const override {
                // m->drawTriangle(points[0], points[1], points[2], color, thickness);
            }
        };
    }
}