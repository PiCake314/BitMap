#include "Shapes.hpp"

namespace  map{
    class Mapper;

    namespace shapes{

        struct Rect : Shape{
            friend class Mapper;

            int height;
            int width;
            bool filled;
            map::RectAlignment rectAlignment;

            Rect(Point p, int h, int w, clr::RGB c = clr::RGB(), bool f = false, bool t = false, map::RectAlignment rectAlignment = map::RectAlignment::Rnone)
            : Shape(p, c, t, {{p.x - w/2, p.y - h/2}, {p.x + w/2, p.y - h/2}, {p.x + w/2, p.y + h/2}, {p.x - w/2, p.y + h/2}}),
              height(h), width(w), filled(f), rectAlignment(rectAlignment) {}


            void rotate(double angle) override {
                for(auto &point : points){
                    point -= center;
                    point = ROT_MAT * point;
                    point += center;
                }
            }

            ShapePtr rotated(double angle) const override {
                ShapePtr r = std::make_unique<Rect>(*this);
                r->rotate(angle);
                return r;
            }

            void shift(Point p) override {
                center += p;
            }

            ShapePtr shifted(Point p) const override {
                ShapePtr r = std::make_unique<Rect>(*this);
                r->shift(p);
                return r;
            }

            void draw(Mapper *m) const override {
                m->drawRect(center, height, width, color, filled, thickness, rectAlignment);
            }
        };
    }
}