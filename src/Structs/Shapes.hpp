#pragma once

#include "../Structs/Point.hpp"
#include "../Structs/RGB.hpp"

#include "../Enums/Alignment.hpp"
#include "../Enums/RectAlignment.hpp"

//! Remove
// #define SHAPE_T std::variant<map::shapes::Line, map::shapes::Circle, map::shapes::Rect, map::shapes::Triangle, map::shapes::Ellipse>

// using Shape_t = std::variant<
//     map::shapes::Line,
//     map::shapes::Circle,
//     map::shapes::Rect,
//     map::shapes::Triangle,
//     map::shapes::Ellipse
// >;


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


            // virtual std::variant<shapes::Line, shapes::Circle, shapes::Rect, shapes::Triangle, shapes::Ellipse> rotate(float angle);


        };

        struct Line : Shape{

            Line(Point s = Point(), Point e = Point(), clr::RGB c = clr::RGB(), bool t = false)
            : Shape(s, c, t, {s, e}) {}

            Point start() const{
                return points[0];
            }

            Point end() const{
                return points[1];
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

            Rect(int h = 1, int w = 1, Point p = Point(), clr::RGB c = clr::RGB(), bool f = false, bool t = false, map::RectAlignment rectAlignment = map::RectAlignment::Rnone)
            : height(h), width(w), filled(f), rectAlignment(rectAlignment),
            Shape(p, c, t, {{p.x - w/2, p.y - h/2}, {p.x + w/2, p.y - h/2}, {p.x + w/2, p.y + h/2}, {p.x - w/2, p.y + h/2}}) {}
        };

        struct Triangle : Shape{
            Triangle(Point p1 = Point(), Point p2 = Point(), Point p3 = Point(), clr::RGB c = clr::RGB(), int t = 0)
            : Shape({(p1.x + p2.x + p3.x)/3, (p1.y + p2.y + p3.y)/3}, c, t, {p1, p2, p3}) {}


            Triangle rotate(float angle){
                Triangle t = *this;

                double rotMatrix[2][2] = {
                    {cos(angle), -sin(angle)},
                    {sin(angle), cos(angle)}
                };

                for(auto &p : t.points){
                    p -= t.center;
                    p = {p.x * rotMatrix[0][0] + p.y * rotMatrix[0][1], p.x * rotMatrix[1][0] + p.y * rotMatrix[1][1]};
                    p += t.center;
                }

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