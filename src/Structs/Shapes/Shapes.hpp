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


#define ROT_MAT (double[2][2]){{cos(angle), -sin(angle)}, {sin(angle), cos(angle)}}


namespace map{

    class Mapper;

    namespace shapes{

        struct Shape;

        using ShapePtr = std::unique_ptr<Shape>;

        // template <class Child>
        struct Shape{
            // Shared
            Point center;
            clr::RGB color;
            int thickness;     
            std::vector<Point> points;


            Shape(Point p, clr::RGB c, int t, std::vector<Point> pts = std::vector<Point>())
            : center(p), color(c), thickness(t), points(pts) {}


            virtual void rotate(double) = 0;
            virtual ShapePtr rotated(double) const = 0;
            virtual void shift(Point) = 0;
            virtual ShapePtr shifted(Point) const = 0;

            virtual void draw(Mapper*) const = 0;
            virtual ~Shape() = default;


        };
    }
}

#include "Line.hpp"
#include "Circle.hpp"
#include "Rect.hpp"
#include "Triangle.hpp"
#include "Ellipse.hpp"
#include "Polygon.hpp"