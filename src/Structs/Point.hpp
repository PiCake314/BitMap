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

        constexpr double distSqrd(Point p) const {
            return pow(x - p.x, 2) + pow(y - p.y, 2);
        }

        constexpr double dist(Point p) const {
            return std::sqrt(this->distSqrd(p));
        }

        // specific use case
        constexpr bool isBetween(Point a, Point b, int thickness) const {
            // double ay = std::round(a.y), by = std::round(b.y), y = std::round(this->y);
            // acount for thickness
            // return (ay < y - thickness && by > y + thickness ) || (by < y - thickness  && ay > y + thickness);

            // return (ay < y && by > y) || (by < y && ay > y);
            // return (a.y < y && b.y > y) || (b.y < y && a.y > y);

            return (a.y - thickness < y && b.y + thickness > y) || (b.y - thickness < y && a.y + thickness > y);
        }

        static constexpr double dist(Point a, Point b){
            return a.dist(b);
        }

        static constexpr double distSqrd(Point a, Point b){
            return a.distSqrd(b);
        }

        constexpr friend Point operator * (double Matrix[2][2], Point p){
            return {
                p.x * Matrix[0][0] + p.y * Matrix[0][1],
                p.x * Matrix[1][0] + p.y * Matrix[1][1]
            };
        }

        constexpr void rotate(double angle, Point center = {0, 0}){
            double ROT_MAT[2][2] = {
                {cos(angle), -sin(angle)},
                {sin(angle), cos(angle)}
            };

            *this -= center;
            *this = ROT_MAT * *this;
            *this += center;
        }

        constexpr Point rotated(double angle, Point center = {0, 0}) const {
            Point p = *this;
            p.rotate(angle, center);
            return p;
        }

        constexpr void rotate(double ROT_MAT[2][2], Point center = {0, 0}){
            *this -= center;
            *this = ROT_MAT * *this;
            *this += center;
        }

        constexpr Point rotated(double ROT_MAT[2][2], Point center = {0, 0}) const {
            Point p = *this;
            p.rotate(ROT_MAT, center);
            return p;
        }

        friend std::ostream& operator << (std::ostream &os, const Point& p){
            return os << p.x << ", " << p.y;
        }
    };
}