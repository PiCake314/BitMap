#pragma once

namespace map{
    struct Point{
        double x;
        double y;

        Point() : x(0), y(0) {}
        Point(double x_, double y_) : x(x_), y(y_) {}
        // Point(int x_, int y_) : x(x_), y(y_) {}

        friend Point operator * (double Matrix[2][2], Point p){
            return {
                p.x * Matrix[0][0] + p.y * Matrix[0][1],
                p.x * Matrix[1][0] + p.y * Matrix[1][1]
            };
        }

        Point operator + (Point p){
            return {x + p.x, y + p.y};
        }

        Point operator - (Point p){
            return {x - p.x, y - p.y};
        }

        Point operator * (double f){
            return {x * f, y * f};
        }

        Point operator / (double f){
            return {x / f, y / f};
        }

        Point operator += (Point p){
            return *this = *this + p;
        }

        Point operator -= (Point p){
            return *this = *this - p;
        }

        Point operator *= (double f){
            return *this = *this * f;
        }

        Point operator /= (double f){
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