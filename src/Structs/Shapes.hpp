#pragma once

#include <vector>
#include <cmath>
#include <variant>
#include <numeric>

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


            Shape(Point p, clr::RGB c, int t, std::vector<Point> pts = std::vector<Point>())
            : center(p), color(c), thickness(t) {}


            // virtual void rotate(float) = 0;
            // virtual Shape rotated(float) const = 0;

        };

        class Line : public  Shape{
            int length;
            double angle;
            public:

            Line(Point c, int len, double angle, clr::RGB color = clr::RGB(), int thickness = 0)
            : length(len), angle(angle), Shape(c, color, thickness) {}

            Point start() const{
                return {center.x - length/2 * cos(angle), center.y - length/2 * sin(angle)};
            }

            Point end() const{
                return {center.x + length/2 * cos(angle), center.y + length/2 * sin(angle)};
            }

            void rotate(float a){
                angle += a;
            }

            Line rotated(float angle){
                Line l = *this;
                l.rotate(angle);
                return l;
            }

            void shift(Point p){
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

            Rect(Point p, int h, int w, clr::RGB c = clr::RGB(), bool f = false, bool t = false, map::RectAlignment rectAlignment = map::RectAlignment::Rnone)
            : height(h), width(w), filled(f), rectAlignment(rectAlignment),
            Shape(p, c, t, {{p.x - w/2, p.y - h/2}, {p.x + w/2, p.y - h/2}, {p.x + w/2, p.y + h/2}, {p.x - w/2, p.y + h/2}}) {}


            void shift(Point p){
                center += p;
            }

            Rect shifted(Point p){
                Rect r = *this;
                r.shift(p);
                return r;
            }
        };

        struct Triangle : Shape{
        //     Triangle(Point p1 = Point(), Point p2 = Point(), Point p3 = Point(), clr::RGB c = clr::RGB(), int t = 0)
        //     : Shape({(p1.x + p2.x + p3.x)/3, (p1.y + p2.y + p3.y)/3}, c, t, {p1, p2, p3}) {}


        //     void rotate(float angle){
        //         for(auto &p : points){
        //             p -= center;
        //             p = ROT_MAT * p;
        //             p += center;
        //         }
        //     }


        //     Triangle rotated(float angle){
        //         Triangle t = *this;
        //         t.rotate(angle);
        //         return t;
        //     }
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
            Ellipse(Point p, int r1, int r2, clr::RGB c = clr::RGB(), bool filled = false, bool inverted = false, int thickness = 0, map::Alignment alignment = map::Alignment::none)
            : r1(r1), r2(r2), filled(filled), inverted(inverted), alignment(alignment), Shape(p, c, thickness) {}
        };


        class Polygon : public Shape{
            std::vector<Point> points;

        public:
            Polygon(std::vector<Point> pts, clr::RGB c = clr::RGB(), int thickness = 0)
            : points(pts),
            Shape(
                std::accumulate(pts.begin(), pts.end(), Point(), [](Point p1, Point p2){ return p1 + p2; })/pts.size(),
                c, thickness
            ) {}

            void rotate(double angle){
                for(auto &point : points){
                    point = ROT_MAT * point;
                }
                
                center = std::accumulate(
                    points.begin(),
                    points.end(),
                    Point()
                )/points.size();
            }

            Polygon rotated(double angle){
                Polygon poly = *this;
                poly.rotate(angle);
                return poly;
            }

            void shift(Point p){
                for(auto &point : points){
                    point += p;
                }

                center += p;
            }

            Polygon shifted(Point p){
                Polygon poly = *this;
                poly.shift(p);
                return poly;
            }


        };
    }
}
 