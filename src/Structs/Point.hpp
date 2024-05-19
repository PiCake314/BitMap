#pragma once
#include <ostream>
#include <concepts>
#include <array>
#include <cmath>
#include <compare>

namespace map{
    struct Point{
        double x{};
        double y{};

        constexpr Point() {}
        constexpr explicit Point(double i) : x(i), y(i) {}
        constexpr Point(double x_, double y_) : x(x_), y(y_) {}
        // Point(int x_, int y_) : x(x_), y(y_) {}
        
        constexpr Point(std::integral auto x_, std::integral auto y_) : x(static_cast<double>(x_)), y(static_cast<double>(y_)) {}

        [[nodiscard]] constexpr Point operator+(const Point& p) const {
            return {x + p.x, y + p.y};
        }

        [[nodiscard]] constexpr Point operator-(const Point& p) const {
            return {x - p.x, y - p.y};
        }

        [[nodiscard]] constexpr Point operator*(double f) const {
            return {x * f, y * f};
        }

        [[nodiscard]] constexpr Point operator/(double f) const {
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

        // constexpr auto operator<=>(const Point&) const = default; // un-needed

        [[nodiscard]] constexpr Point abs() const {
            return {std::abs(x), std::abs(y)};
        }

        [[nodiscard]] constexpr double magSqrd() const {
            return x * x + y * y;
        }

        [[nodiscard]] constexpr double mag() const {
            return std::sqrt(magSqrd());
        }

        constexpr void normalize(){
            double m = mag();
            if(m != 0){
                x /= m;
                y /= m;
            }
        }

        [[nodiscard]] constexpr Point normalized() const {
            Point p = *this;
            p.normalize();
            return p;
        }

        [[nodiscard]] constexpr Point max(const Point& p) const {
            return {std::max(x, p.x), std::max(y, p.y)};
        }

        [[nodiscard]] constexpr Point min(const Point& p) const {
            return {std::min(x, p.x), std::min(y, p.y)};
        }

        [[nodiscard]] constexpr double distSqrd(const Point& p) const {
            return std::pow(x - p.x, 2) + std::pow(y - p.y, 2);
        }

        [[nodiscard]] constexpr double dist(const Point& p) const {
            return std::sqrt(distSqrd(p));
        }

        // why..
        // static constexpr double dist(const Point& a, const Point& b){
        //     return a.dist(b);
        // }

        // static constexpr double distSqrd(const Point& a, const Point& b){
        //     return a.distSqrd(b);
        // }

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
        constexpr explicit Point3D(double i) : x{i}, y{i}, z{i} {}
        constexpr Point3D(double x_, double y_, double z_) : x{x_}, y{y_}, z{z_} {}
        
        constexpr Point3D(std::integral auto x_, std::integral auto y_, std::integral auto z_)
        : x{static_cast<double>(x_)}, y{static_cast<double>(y_)}, z{static_cast<double>(z_)} {}


        [[nodiscard]] constexpr Point toPoint() const {
            return {x, y};
        }

        [[nodiscard]] constexpr Point3D operator+(const Point3D& p) const {
            return {x + p.x, y + p.y, z + p.z};
        }

        [[nodiscard]] constexpr Point3D operator-(const Point3D& p) const {
            return {x - p.x, y - p.y, z - p.z};
        }

        [[nodiscard]] constexpr Point3D operator*(double f) const {
            return {x * f, y * f, z * f};
        }

        [[nodiscard]] constexpr Point3D operator/(double f) const {
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

        // constexpr auto operator<=>(const Point3D&) const = default; // un-needed

        [[nodiscard]] constexpr Point3D abs() const {
            return {std::abs(x), std::abs(y), std::abs(z)};
        }

        [[nodiscard]] constexpr double magSqrd() const {
            return x * x + y * y + z * z;
        }

        [[nodiscard]] constexpr double mag() const {
            return std::sqrt(magSqrd());
        }

        constexpr void normalize(){
            double m = mag();
            if(m != 0){
                x /= m;
                y /= m;
                z /= m;
            }
        }

        [[nodiscard]] constexpr Point3D normalized() const {
            Point3D p = *this;
            p.normalize();
            return p;
        }

        [[nodiscard]] constexpr Point3D max(const Point3D& p) const {
            return {std::max(x, p.x), std::max(y, p.y), std::max(z, p.z)};
        }

        [[nodiscard]] constexpr Point3D min(const Point3D& p) const {
            return {std::min(x, p.x), std::min(y, p.y), std::min(z, p.z)};
        }

        [[nodiscard]] constexpr double distSqrd(const Point3D& p) const {
            return (x - p.x) * (x - p.x) + (y - p.y) * (y - p.y) + (z - p.z) * (z - p.z);
        }

        [[nodiscard]] constexpr double dist(const Point3D& p) const {
            return std::sqrt(this->distSqrd(p));
        }

        // no
        // static constexpr double dist(const Point3D& a, const Point3D& b){
        //     return a.dist(b);
        // }

        // static constexpr double distSqrd(const Point3D& a, const Point3D& b){
        //     return a.distSqrd(b);
        // }

        constexpr friend Point3D operator * (const double matrix[3][3], const Point3D& p){
            return {
                p.x * matrix[0][0] + p.y * matrix[0][1] + p.z * matrix[0][2],
                p.x * matrix[1][0] + p.y * matrix[1][1] + p.z * matrix[1][2],
                p.x * matrix[2][0] + p.y * matrix[2][1] + p.z * matrix[2][2]
            };
        }

        template <Axis axis>
        constexpr void rotate(double angle, Point3D center = {}){
            double ROT_MAT[3][3] = {
                {1, 0, 0},
                {0, 1, 0},
                {0, 0, 1}
            };

            if constexpr(axis == Axis::X){
                ROT_MAT[1][1] = cos(angle);
                ROT_MAT[1][2] = -sin(angle);
                ROT_MAT[2][1] = sin(angle);
                ROT_MAT[2][2] = cos(angle);
            }
            else if constexpr(axis == Axis::Y){
                ROT_MAT[0][0] = cos(angle);
                ROT_MAT[0][2] = sin(angle);
                ROT_MAT[2][0] = -sin(angle);
                ROT_MAT[2][2] = cos(angle);
            }
            else if constexpr(axis == Axis::Z){
                ROT_MAT[0][0] = cos(angle);
                ROT_MAT[0][1] = -sin(angle);
                ROT_MAT[1][0] = sin(angle);
                ROT_MAT[1][1] = cos(angle);
            }

            *this -= center;
            *this = ROT_MAT * *this;
            *this += center;
        }

        template <Axis axis>
        [[nodiscard]] constexpr Point3D rotated(double angle, Point3D center = {}) const {
            Point3D p = *this;
            p.rotate<axis>(angle, center);
            return p;
        }

        friend std::ostream& operator << (std::ostream &os, const Point3D& p){
            return os << p.x << ", " << p.y << ", " << p.z;
        }
    };


    template <size_t N>
    struct PointND{
        std::array<double, N> coords{};

        constexpr PointND() : coords{} {}

        constexpr PointND(std::integral auto... args) : coords{static_cast<double>(args)...} {}

        constexpr PointND(const std::initializer_list<double> &list) : coords{} {
            for(size_t i = 0; auto &item : list){
                coords[i++] = item;
                if(i == N) break;
            }
        }

        template <std::integral T>
        constexpr PointND(const std::initializer_list<T> &list) : coords{} {
            for(size_t i = 0; auto &item : list){
                coords[i++] = static_cast<double>(item);
                if(i == N) break;
            }
        }

        constexpr PointND(const PointND &p) : coords{} {
            for(size_t i = 0; i < N; ++i){
                coords[i] = p.coords[i];
            }
        }

        template <size_t S = 2>
        constexpr auto toPoint(){
            static_assert(S <= N, "S must be less than the number of dimensions");

            if constexpr(S == 1){
                return coords[0];
            }
            else if constexpr(S == 2){
                return Point(coords[0], coords[1]);
            }
            else if constexpr(S == 3){
                return Point3D(coords[0], coords[1], coords[2]);
            }
            else return PointND<S>(coords);

        }

        constexpr PointND operator+(const PointND &p){
            PointND result;
            for(size_t i = 0; i < N; ++i){
                result.coords[i] = coords[i] + p.coords[i];
            }
            return result;
        }

        constexpr PointND operator-(const PointND &p){
            PointND result;
            for(size_t i = 0; i < N; ++i){
                result.coords[i] = coords[i] - p.coords[i];
            }
            return result;
        }

        constexpr PointND operator*(double f){
            PointND result;
            for(size_t i = 0; i < N; ++i){
                result.coords[i] = coords[i] * f;
            }
            return result;
        }

        constexpr PointND operator/(double f){
            PointND result;
            for(size_t i = 0; i < N; ++i){
                result.coords[i] = coords[i] / f;
            }
            return result;
        }

        constexpr PointND operator+=(const PointND &p){
            return *this = *this + p;
        }

        constexpr PointND operator-=(const PointND &p){
            return *this = *this - p;
        }

        constexpr PointND operator*=(double f){
            return *this = *this * f;
        }

        constexpr PointND operator/=(double f){
            return *this = *this / f;
        }

        constexpr bool operator==(const PointND &p) const = default;

        [[nodiscard]] constexpr PointND abs() const {
            PointND result;
            for(size_t i = 0; i < N; ++i){
                result.coords[i] = std::abs(coords[i]);
            }
            return result;
        }

        constexpr void normalize(){
            double m = mag();
            if(m != 0){
                for(size_t i = 0; i < N; ++i){
                    coords[i] /= m;
                }
            }
        }

        [[nodiscard]] constexpr PointND normalized() const {
            PointND p = *this;
            p.normalize();
            return p;
        }

        [[nodiscard]] constexpr double magSqrd() const {
            double result = 0;
            for(size_t i = 0; i < N; ++i){
                result += coords[i] * coords[i];
            }
            return result;
        }

        [[nodiscard]] constexpr double mag() const {
            return std::sqrt(magSqrd());
        }


        constexpr double distSqrd(const PointND &p) const {
            double result = 0;
            for(size_t i = 0; i < N; ++i){
                result += pow(coords[i] - p.coords[i], 2);
            }
            return result;
        }

        constexpr double dist(const PointND &p) const {
            return std::sqrt(this->distSqrd(p));
        }

        // please stop
        // static constexpr double dist(const PointND &a, const PointND &b){
        //     return a.dist(b);
        // }

        // static constexpr double distSqrd(const PointND &a, const PointND &b){
        //     return a.distSqrd(b);
        // }

        constexpr friend PointND operator * (const double matrix[N][N], const PointND &p){
            PointND result;
            for(size_t i = 0; i < N; ++i){
                for(size_t j = 0; j < N; ++j){
                    result.coords[i] += p.coords[j] * matrix[i][j];
                }
            }
            return result;
        }

        template <size_t axis1, size_t axis2>
        constexpr void rotate(double angle, PointND center = {}){
            static_assert(
                axis1 >= 0 &&
                axis2 >= 0 &&
                axis1 < N &&
                axis2 < N &&
                axis1 < axis2
                , "axis1 and axis2 must be valid axis and axis1 must be less than axis2");

            double ROT_MAT[N][N] = {};

            for(size_t i = 0; i < N; ++i){
                ROT_MAT[i][i] = 1;
            }

            ROT_MAT[axis1][axis1] = cos(angle);
            ROT_MAT[axis1][axis2] = -sin(angle);
            ROT_MAT[axis2][axis1] = sin(angle);
            ROT_MAT[axis2][axis2] = cos(angle);


            *this -= center;
            *this = ROT_MAT * *this;
            *this += center;
        }

        template <size_t axis1, size_t axis2>
        [[nodiscard]] constexpr PointND rotated(double angle, PointND center = {}) const {
            PointND p = *this;
            p.rotate<axis1, axis2>(angle, center);
            return p;
        }

        friend std::ostream& operator << (std::ostream &os, const PointND &p){
            os << "(";
            for(size_t i = 0; i < N; ++i){
                os << p.coords[i];
                if(i != N - 1){
                    os << ", ";
                }
            }
            return os << ")";
        }

        constexpr double& operator[](size_t i){
            return coords[i];
        }

        constexpr size_t size() const {
            return N;
        }

    };
}