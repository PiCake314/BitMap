#pragma once

#include <vector>
#include <cmath>
#include <variant>

#include "Point.hpp"
#include "RGB.hpp"

#include "../Enums/Alignment.hpp"
#include "../Enums/RectAlignment.hpp"


#define ROT_MAT (double[2][2]){{cos(angle), -sin(angle)}, {sin(angle), cos(angle)}}


namespace map{

    enum ShapeType{
        // none = -1,
        line = 0,
        circle,
        rect,
        triangle,
        ellipse
    };

    namespace shapes{

        struct Shape{
            // Shared
            Point center;
            clr::RGB color;
            int thickness;     
            std::vector<Point> points;   

            Shape(Point p, clr::RGB c, int t, std::vector<Point> pts = std::vector<Point>())
            : center(p), color(c), thickness(t), points(pts) {}


            // virtual void rotate(float) = 0;
            // virtual Shape rotated(float) const = 0;

        };

        class Line : public  Shape{
            public:

            Line(Point p1, Point p2, clr::RGB color = clr::RGB(), int thickness = 0)
            : Shape({(p1.x + p2.x)/2, (p1.y + p2.y)/2}, color, thickness, {p1, p2}) {}

            Point start() const{
                return points[0];
            }

            Point end() const{
                return points[1];
            }

            void start(Point p){
                points[0] = p;

                center = {(points[0].x + points[1].x)/2, (points[0].y + points[1].y)/2};
            }

            void end(Point p){
                points[1] = p;

                center = {(points[0].x + points[1].x)/2, (points[0].y + points[1].y)/2};
            }

            void setCenter(Point p){
                center = p;

                points[0] = {center.x - (points[1].x - center.x), center.y - (points[1].y - center.y)};
                points[1] = {center.x + (points[1].x - center.x), center.y + (points[1].y - center.y)};
            }

            void rotate(float angle){
                points[0] -= center;
                points[0] = ROT_MAT * points[0];
                points[0] += center;


                points[1] -= center;
                points[1] = ROT_MAT * points[1];
                points[1] += center;
            }

            Line rotated(float angle){
                Line l = *this;
                l.rotate(angle);
                return l;
            }

            void shift(Point p){
                points[0] += p;
                points[1] += p;

                center += p;
            }

            Line shifted(Point p){
                Line l = *this;
                l.shift(p);
                return l;
            }
        };

        struct Circle : Shape{
            int radius;
            bool filled;
            bool inverted;
            map::Alignment alignment;

            Circle(Point p, int r, clr::RGB c = clr::RGB(), bool filled = false, bool inverted = false, int thickness = false, map::Alignment alignment = map::Alignment::none)
            : radius(r), filled(filled), inverted(inverted), alignment(alignment), Shape(p, c, thickness) {}
        };

        struct Rect : Shape{
            int height;
            int width;
            bool filled;
            map::RectAlignment rectAlignment;

            Rect(Point p = Point(), int h = 1, int w = 1, clr::RGB c = clr::RGB(), bool f = false, bool t = false, map::RectAlignment rectAlignment = map::RectAlignment::Rnone)
            : height(h), width(w), filled(f), rectAlignment(rectAlignment),
            Shape(p, c, t, {{p.x - w/2, p.y - h/2}, {p.x + w/2, p.y - h/2}, {p.x + w/2, p.y + h/2}, {p.x - w/2, p.y + h/2}}) {}
        };

        struct Triangle : Shape{
            Triangle(Point p1 = Point(), Point p2 = Point(), Point p3 = Point(), clr::RGB c = clr::RGB(), int t = 0)
            : Shape({(p1.x + p2.x + p3.x)/3, (p1.y + p2.y + p3.y)/3}, c, t, {p1, p2, p3}) {}


            void rotate(float angle){
                for(auto &p : points){
                    p -= center;
                    p = ROT_MAT * p;
                    p += center;
                }
            }


            Triangle rotated(float angle){
                Triangle t = *this;
                t.rotate(angle);
                return t;
            }
        };

        struct Ellipse : Shape{
            int r1;
            int r2;
            bool filled;
            bool inverted;
            map::Alignment alignment;

            /**
             * @param r2: negative values will result in them being the same as r1.
            */
            Ellipse(Point p, int r1, int r2 = -1, clr::RGB c = clr::RGB(), bool filled = false, bool inverted = false, int thickness = false, map::Alignment alignment = map::Alignment::none)
            : r1(r1), r2(r2 < 0 ? r1 : r2), filled(filled), inverted(inverted), alignment(alignment), Shape(p, c, thickness) {}
        };
    }
}


#undef Shape_type