#pragma once

namespace map{
    struct Point{
        double x;
        double y;

        Point() : x(0), y(0) {}
        Point(double x_, double y_) : x(x_), y(y_) {}
        // Point(int x_, int y_) : x(x_), y(y_) {}

        Point operator + (Point p){
            return {x + p.x, y + p.y};
        }

        Point operator - (Point p){
            return {x - p.x, y - p.y};
        }

        Point operator * (float f){
            return {x * f, y * f};
        }

        Point operator / (float f){
            return {x / f, y / f};
        }

        Point operator += (Point p){
            return *this = *this + p;
        }

        Point operator -= (Point p){
            return *this = *this - p;
        }

        Point operator *= (float f){
            return *this = *this * f;
        }

        Point operator /= (float f){
            return *this = *this / f;
        }

        // Point operator = (Point p){
        //     x = p.x;
        //     y = p.y;
        //     return *this;
        // }


        friend std::ostream& operator << (std::ostream &os, Point p){
            return (os << p.x << ", " << p.y);
        }
    };
}