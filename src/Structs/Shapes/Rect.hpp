#include "Shapes.hpp"

namespace  map::shapes{
    struct Rect : Shape{

        // use for named arguments
        struct Data{
            // DO NOT ACCESS THESE DIRECTLY
            clr::RGB color{};
            bool filled{false};
            int thickness{};
            map::RectAlignment rectAlignment{RectAlignment::Rnone};
        };


        int width;
        int height;
        bool filled;
        map::RectAlignment rectAlignment;

        Rect(Point p, int w, int h, Data &&d)
        : Shape(p, d.color, d.thickness, {{p.x - w/2, p.y - h/2}, {p.x + w/2, p.y - h/2}, {p.x + w/2, p.y + h/2}, {p.x - w/2, p.y + h/2}}),
            width(w), height(h), filled(d.filled), rectAlignment(d.rectAlignment) {}


        void rotate(double angle) override {
            for(auto &point : points){
                point -= center;

                double ROT_MAT[2][2] = {
                    {cos(angle), -sin(angle)},
                    {sin(angle), cos(angle)}
                };

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

        protected:
        void draw(Mapper *m) const override {
            m->drawRect(center, height, width, color, filled, thickness, rectAlignment);
        }
    };
}