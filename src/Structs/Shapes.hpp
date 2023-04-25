#pragma once

#include "../Structs/Point.hpp"
#include "../Structs/RGB.hpp"

#include "../Enums/Alignment.hpp"
#include "../Enums/RectAlignment.hpp"

namespace map{
    struct Shape{
        // Shared
        Point center;
        clr::RGB color;
        int thickness;

        Shape(Point p = Point(), clr::RGB c = clr::RGB(), int t = 0)
        : center(p), color(c), thickness(t) {}
    };

    struct Line : Shape{
        Point start;
        Point end;

        Line(Point s = Point(), Point e = Point(), clr::RGB c = clr::RGB(), bool t = false)
        : start(s), end(e), Shape(s, c, t) {}
    };

    struct Circle : Shape{
        int radius;
        bool filled;
        bool inverted;
        map::Alignment alignment;

        Circle(int r = 1, Point p = Point(), clr::RGB c = clr::RGB(), bool f = false, bool i = false, int t = false, map::Alignment a = map::Alignment::none);
    };

    struct Rect : Shape{
        int height;
        int width;
        Point points[4];
        bool filled;
        map::RectAlignment rectAlignment;

        Rect(int h = 1, int w = 1, Point p = Point(), clr::RGB c = clr::RGB(), bool f = false, bool t = false, map::RectAlignment ra = map::RectAlignment::Rnone)
        : height(h), width(w), filled(f), rectAlignment(ra), Shape(p, c, t) {
            points[0] = Point(p.x - w/2, p.y - h/2);
            points[1] = Point(p.x + w/2, p.y - h/2);
            points[2] = Point(p.x + w/2, p.y + h/2);
            points[3] = Point(p.x - w/2, p.y + h/2);
        }
    };

    struct Ellipse : Shape{
        int r1;
        int r2;

        Ellipse(int h = 1, int w = 1, Point p = Point(), clr::RGB c = clr::RGB(), bool t = false, map::Alignment a = map::Alignment::none)
        : r1(h), r2(w), Shape(p, c, t) {}
    };
}