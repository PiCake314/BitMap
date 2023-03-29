#pragma once

#include "../Structs/Point.hpp"
#include "../Structs/RGB.hpp"

#include "../Enums/Alignment.hpp"
#include "../Enums/RectAlignment.hpp"
#include "../Enums/Shapetype.hpp"

struct Shape{
    // Shared
    Point center;
    clr::RGB color;
    int thickness;
    map::Shapetype type;

    // Line
    Point start;
    Point end;

    // Circle
    int radius;
    bool filled;
    bool inverted;
    map::Alignment alignment;
    
    // Rect
    int height;
    int width;
    map::RectAlignment rectAlignment;

    // Ellipse
    int r1;
    int r2;

    // struct Line{
    //     Line(Point s = Point(), Point e = Point(), clr::RGB c = clr::RGB(), bool t = false)
    //     : start(s), end(e), color(c), thickness(t) {}
    //     Point start;
    //     Point end;
    //     clr::RGB color;
    //     int thickness;
    // };
    


protected:
    Shape(Point p, clr::RGB c, int t, map::Shapetype st, map::Alignment a = map::Alignment::none, map::RectAlignment ra = map::RectAlignment::Rnone)
    : center(p), color(c), thickness(t), type(st), alignment(a), rectAlignment(ra) {}
};

struct Line : /*protected*/ Shape{
    Line(Point s = Point(), Point e = Point(), clr::RGB c = clr::RGB(), bool t = false)
    : Shape(Point(), c, t, map::Shapetype::Line){ start = s; end = e; }
};

struct Circle : /*protected*/ Shape{
    Circle(int r, Point p = Point(), clr::RGB c = clr::RGB(), bool f = false, bool i = false, int t = false, map::Alignment a = map::Alignment::none)
    : Shape(p, c, t, map::Shapetype::Circle, a){ radius = r; filled = f; inverted = i; }
};

struct Rect : /*protected*/ Shape{
    Rect(int h = 0, int w = 0, Point p = Point(), clr::RGB c = clr::RGB(), bool t = false, map::RectAlignment ra = map::RectAlignment::Rnone)
    : Shape(p, c, t, map::Shapetype::Rect, map::Alignment::none, ra){ height = h; width = w; }
};

struct Ellipse : /*protected*/ Shape{
    Ellipse(int h, int w, Point p = Point(), clr::RGB c = clr::RGB(), bool t = false, map::Alignment a = map::Alignment::none)
    : Shape(p, c, t, map::Shapetype::Ellipse, a){ r1 = h; r2 = w; }
};
