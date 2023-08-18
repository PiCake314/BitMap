#pragma once

#include <vector>
#include <cmath>
#include <variant>
#include <memory>
#include <numeric>

#include "../Point.hpp"
#include "../RGB.hpp"

#include "../../Enums/Alignment.hpp"
#include "../../Enums/RectAlignment.hpp"
#include "../../Mapper/Mapper.hpp"


// #define ROT_MAT (double[2][2]){{cos(angle), -sin(angle)}, {sin(angle), cos(angle)}} // only works in clang (haven't tested msvc)


namespace map{
    
    class Mapper;

    namespace shapes{

        struct Shape;

        using ShapePtr = std::unique_ptr<Shape>;

        struct Shape{
            friend class map::Mapper;

            // Shared
            Point center;
            clr::RGB color;
            int thickness;     
            std::vector<Point> points;


            constexpr Shape(Point p, clr::RGB c, int t, std::vector<Point> pts = std::vector<Point>())
            : center(p), color(c), thickness(t), points(pts) {}


            constexpr virtual void rotate(double) = 0;
            [[nodiscard]] constexpr virtual ShapePtr rotated(double) const = 0;
            constexpr virtual void shift(Point) = 0;
            [[nodiscard]] constexpr virtual ShapePtr shifted(Point) const = 0;

            constexpr virtual ~Shape() = default;

            protected:
            constexpr virtual void draw(Mapper*) const = 0;


        };
    }
}

#include "Line.hpp"
#include "Circle.hpp"
#include "Rect.hpp"
#include "Triangle.hpp"
#include "Ellipse.hpp"
#include "Polygon.hpp"