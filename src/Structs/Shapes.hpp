#pragma once

#include "../Structs/Point.hpp"
#include "../Structs/RGB.hpp"

#include "../Enums/Alignment.cpp"
#include "../Enums/RectAlignment.cpp"
#include "../Enums/Shapetype.cpp"

struct Shape{
    //  Shared
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


protected:
    Shape(Point p, clr::RGB c, int t, map::Shapetype st)
    : center(p), color(c), thickness(t), type(st) {}
};

struct Line : /*protected*/ Shape{
    Line(Point s = Point(), Point e = Point(), clr::RGB c = clr::RGB(), bool t = false)
    : Shape(Point(), c, t, map::Shapetype::Line){ start = s; end = e; }

    void setStart(Point p){ start = p; }
    void setEnd(Point p){ end = p; }

    Point getStart(){ return start; }
    Point getEnd(){ return end; }
};

struct Circle : /*protected*/ Shape{
    Circle(int r, Point p = Point(), clr::RGB c = clr::RGB(), bool f = false, bool i = false, int t = false)
    : Shape(p, c, t, map::Shapetype::Circle){ radius = r; filled = f; inverted = i; }

    void setRadius(int r){ radius = r; }
    int getRadius(){ return radius; }
};

struct Rect : /*protected*/ Shape{
    Rect(int h = 0, int w = 0, Point p = Point(), clr::RGB c = clr::RGB(), bool t = false)
    : Shape(p, c, t, map::Shapetype::Rect){ height = h; width = w; }

    void setHeight(int h){ height = h; }
    void setWidth(int w){ width = w; }

    int getHeight(){ return height; }
    int getWidth(){ return width; }
};

struct Ellipse : /*protected*/ Shape{
    Ellipse(int h, int w, Point p = Point(), clr::RGB c = clr::RGB(), bool t = false)
    : Shape(p, c, t, map::Shapetype::Ellipse){ r1 = h; r2 = w; }

    void setR1(int r){ r1 = r; }
    void setR2(int r){ r2 = r; }

    int getR1(){ return r1; }
    int getR2(){ return r2; }
};
