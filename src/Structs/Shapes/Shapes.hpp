#pragma once

#include <vector>
#include <cmath>
#include <memory>
#include <numeric>

#include "../Point.hpp"
#include "../RGB.hpp"

#include "../../Enums/Alignment.hpp"
#include "../../Enums/RectAlignment.hpp"
#include "../../Mapper/Mapper.hpp"


// #define ROT_MAT (double[2][2]){{cos(angle), -sin(angle)}, {sin(angle), cos(angle)}} // only works in clang (haven't tested msvc)
extern size_t height, width;

namespace map{

    class Mapper;

    namespace shapes{

        struct Shape;

        using ShapePtr = std::unique_ptr<Shape>;

        struct Shape{
            friend class map::Mapper;

            // Shared
            Point center;
            // const Point velocity;
            // const Point acceleration;
            clr::RGB color;
            bool filled;
            int thickness;
            std::vector<Point> points;


            Shape(Point p, clr::RGB c, bool f, int t, std::vector<Point> pts = std::vector<Point>());

            Shape(const Shape& other);

            Shape(Shape&& other) noexcept;

            Shape& operator=(const Shape& other);

            Shape& operator=(Shape&& other) noexcept;


            virtual void rotate(double angle);


            virtual void rotate(double angle, const Point& cent);


            [[nodiscard]] virtual ShapePtr rotated(double angle) const;

            virtual void shift(const Point& p);

            [[nodiscard]] virtual ShapePtr shifted(const Point& p) const;


            [[nodiscard]] virtual std::vector<std::pair<size_t, size_t>> getLocks(Size size, const size_t root_pix_per_lock) const;


            void setDepth(int depth);

            [[nodiscard]] int getDepth() const;

            [[nodiscard]] virtual bool onBorder(const Point& p) const;

            [[nodiscard]] virtual bool insideShape(const Point& p) const;

            virtual ~Shape();

            protected:
            virtual void draw(Mapper*) const = 0;
            virtual ShapePtr clone() const = 0;


        };
    }
}


#include "Line.hpp"
#include "Circle.hpp"
#include "Rect.hpp"
#include "Triangle.hpp"
#include "Ellipse.hpp"
#include "Polygon.hpp"
#include "Text.hpp"
#include "Audio.hpp"
