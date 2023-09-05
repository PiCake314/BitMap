#pragma once
#include <ostream>
#include <concepts>

namespace map{
    struct Point{
        double x{};
        double y{};

        constexpr Point() : x(0), y(0) {}
        constexpr Point(double x_, double y_) : x(x_), y(y_) {}
        // Point(int x_, int y_) : x(x_), y(y_) {}
        
        constexpr Point(std::integral auto x_, std::integral auto y_) : x(static_cast<double>(x_)), y(static_cast<double>(y_)) {}

        constexpr Point operator+(Point p){
            return {x + p.x, y + p.y};
        }

        constexpr Point operator-(Point p){
            return {x - p.x, y - p.y};
        }

        constexpr Point operator*(double f){
            return {x * f, y * f};
        }

        constexpr Point operator/(double f){
            return {x / f, y / f};
        }

        constexpr Point operator+=(Point p){
            return *this = *this + p;
        }

        constexpr Point operator-=(Point p){
            return *this = *this - p;
        }

        constexpr Point operator*=(double f){
            return *this = *this * f;
        }

        constexpr Point operator/=(double f){
            return *this = *this / f;
        }

        constexpr bool operator==(const Point& p) const = default;

        constexpr double dist(Point p){
            return sqrt(pow(x - p.x, 2) + pow(y - p.y, 2));
        }


        static constexpr double dist(Point a, Point b){
            return a.dist(b);
        }

        
        constexpr double distSqrd(Point p){
            return pow(x - p.x, 2) + pow(y - p.y, 2);
        }


        static constexpr double distSqrd(Point a, Point b){
            return a.distSqrd(b);
        }

        // Point operator = (Point p){
        //     x = p.x;
        //     y = p.y;
        //     return *this;
        // }


        constexpr friend Point operator * (double Matrix[2][2], Point p){
            return {
                p.x * Matrix[0][0] + p.y * Matrix[0][1],
                p.x * Matrix[1][0] + p.y * Matrix[1][1]
            };
        }


        friend std::ostream& operator << (std::ostream &os, const Point& p){
            return os << p.x << ", " << p.y;
        }
    };
}