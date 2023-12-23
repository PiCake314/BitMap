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

        constexpr Point operator+(const Point& p){
            return {x + p.x, y + p.y};
        }

        constexpr Point operator-(const Point& p){
            return {x - p.x, y - p.y};
        }

        constexpr Point operator*(double f){
            return {x * f, y * f};
        }

        constexpr Point operator/(double f){
            return {x / f, y / f};
        }

        constexpr Point operator+=(const Point& p){
            return *this = *this + p;
        }

        constexpr Point operator-=(const Point& p){
            return *this = *this - p;
        }

        constexpr Point operator*=(double f){
            return *this = *this * f;
        }

        constexpr Point operator/=(double f){
            return *this = *this / f;
        }

        constexpr bool operator==(const Point& p) const = default;

        constexpr double distSqrd(const Point& p) const {
            return pow(x - p.x, 2) + pow(y - p.y, 2);
        }

        constexpr double dist(const Point& p) const {
            return std::sqrt(this->distSqrd(p));
        }

        // specific use case
        constexpr bool isBetween(const Point& a, const Point& b, int thickness) const {
            // if(a.x == b.x){
            //     return x == a.x && y >= std::min(a.y, b.y) && y <= std::max(a.y, b.y);
            // }
            // else if(a.y == b.y){
            //     return y == a.y && x >= std::min(a.x, b.x) && x <= std::max(a.x, b.x);
            // }
            // else{
            //     // check if the point is on the line
            //     const double slope = (b.y - a.y) / (b.x - a.x);
            //     const double y_intercept = a.y - slope * a.x;

            //     return std::abs(y - (slope * x + y_intercept)) < 1;
            // }

            return (a.y - thickness < y && b.y + thickness > y) || (b.y - thickness < y && a.y + thickness > y);
        }

        static constexpr double dist(const Point& a, const Point& b){
            return a.dist(b);
        }

        static constexpr double distSqrd(const Point& a, const Point& b){
            return a.distSqrd(b);
        }

        constexpr friend Point operator * (const double matrix[2][2], const Point& p){
            return {
                p.x * matrix[0][0] + p.y * matrix[0][1],
                p.x * matrix[1][0] + p.y * matrix[1][1]
            };
        }

        constexpr void rotate(double angle, Point center = {}){
            double ROT_MAT[2][2] = {
                {cos(angle), -sin(angle)},
                {sin(angle), cos(angle)}
            };

            *this -= center;
            *this = ROT_MAT * *this;
            *this += center;
        }

        [[nodiscard]] constexpr Point rotated(double angle, Point center = {}) const {
            Point p = *this;
            p.rotate(angle, center);
            return p;
        }

        constexpr void rotate(const double ROT_MAT[][2], Point center = {}){
            *this -= center;
            *this = ROT_MAT * *this;
            *this += center;
        }

        [[nodiscard]] constexpr Point rotated(const double ROT_MAT[][2], Point center = {}) const {
            Point p = *this;
            p.rotate(ROT_MAT, center);
            return p;
        }

        friend std::ostream& operator << (std::ostream &os, const Point& p){
            return os << p.x << ", " << p.y;
        }
    };


    // 3D specialization
    struct Point3D{
        double x{};
        double y{};
        double z{};
        

        enum Axis{
            X = 0,
            Y,
            Z
        };


        constexpr Point3D() : x{}, y{}, z{} {}
        constexpr Point3D(double x_, double y_, double z_) : x{x_}, y{y_}, z{z_} {}
        
        constexpr Point3D(std::integral auto x_, std::integral auto y_, std::integral auto z_)
        : x{static_cast<double>(x_)}, y{static_cast<double>(y_)}, z{static_cast<double>(z_)} {}


        constexpr Point toPoint() const {
            return {x, y};
        }

        constexpr Point3D operator+(const Point3D& p){
            return {x + p.x, y + p.y, z + p.z};
        }

        constexpr Point3D operator-(const Point3D& p){
            return {x - p.x, y - p.y, z - p.z};
        }

        constexpr Point3D operator*(double f){
            return {x * f, y * f, z * f};
        }

        constexpr Point3D operator/(double f){
            return {x / f, y / f, z / f};
        }

        constexpr Point3D operator+=(const Point3D& p){
            return *this = *this + p;
        }

        constexpr Point3D operator-=(const Point3D& p){
            return *this = *this - p;
        }

        constexpr Point3D operator*=(double f){
            return *this = *this * f;
        }

        constexpr Point3D operator/=(double f){
            return *this = *this / f;
        }

        constexpr bool operator==(const Point3D& p) const = default;

        constexpr double distSqrd(const Point3D& p) const {
            return (x - p.x) * (x - p.x) + (y - p.y) * (y - p.y) + (z - p.z) * (z - p.z);
        }

        constexpr double dist(const Point3D& p) const {
            return std::sqrt(this->distSqrd(p));
        }

        static constexpr double dist(const Point3D& a, const Point3D& b){
            return a.dist(b);
        }

        static constexpr double distSqrd(const Point3D& a, const Point3D& b){
            return a.distSqrd(b);
        }

        constexpr friend Point3D operator * (const double matrix[3][3], const Point3D& p){
            return {
                p.x * matrix[0][0] + p.y * matrix[0][1] + p.z * matrix[0][2],
                p.x * matrix[1][0] + p.y * matrix[1][1] + p.z * matrix[1][2],
                p.x * matrix[2][0] + p.y * matrix[2][1] + p.z * matrix[2][2]
            };
        }

        template <Axis axis>
        constexpr void rotate(double angle, Point3D center = {}){
            if constexpr(axis == Axis::X){
                double ROT_MAT[3][3] = {
                    {1., 0., 0.},
                    {0., cos(angle), -sin(angle)},
                    {0., sin(angle), cos(angle)}
                };

                *this -= center;
                *this = ROT_MAT * *this;
                *this += center;
            }
            else if constexpr(axis == Axis::Y){
                double ROT_MAT[3][3] = {
                    {cos(angle), 0., sin(angle)},
                    {0., 1., 0.},
                    {-sin(angle), 0., cos(angle)}
                };

                *this -= center;
                *this = ROT_MAT * *this;
                *this += center;
            }
            else if constexpr(axis == Axis::Z){
                double ROT_MAT[3][3] = {
                    {cos(angle), -sin(angle), 0.},
                    {sin(angle), cos(angle), 0.},
                    {0., 0., 1.}
                };

                *this -= center;
                *this = ROT_MAT * *this;
                *this += center;
            }
        }

        template <Axis axis>
        [[nodiscard]] constexpr Point3D rotated(double angle, Point3D center = {}) const {
            Point3D p = *this;
            p.rotate<axis>(angle, center);
            return p;
        }

        // constexpr void rotate(const double ROT_MAT[3][3], Point3D center = {}){
        //     *this -= center;
        //     *this = ROT_MAT * *this;
        //     *this += center;
        // }

        // [[nodiscard]] constexpr Point3D rotated(const double ROT_MAT[3][3], Point3D center = {}) const {
        //     Point3D p = *this;
        //     p.rotate(ROT_MAT, center);
        //     return p;
        // }

        friend std::ostream& operator << (std::ostream &os, const Point3D& p){
            return os << p.x << ", " << p.y;
        }
    };
}