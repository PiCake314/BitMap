#pragma once

struct Point{
    float x;
    float y;

    Point() : x(0), y(0) {}
    Point(float x_, float y_) : x(x_), y(y_) {}


    friend std::ostream& operator << (std::ostream &os, Point p){
        return (os << p.x << ", " << p.y);
    }
};
