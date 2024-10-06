#pragma once

#include <vector>
#include <cmath>
#include <memory>
#include <numeric>


#include "../../../Mapper/Mapper.hpp"

#include "../Renderables.hpp"

#include "../../Point.hpp"
#include "../../RGB.hpp"

#include "../../../Utility/Size.hpp"

#include "../../../Enums/Alignment.hpp"


// #define ROT_MAT (double[2][2]){{cos(angle), -sin(angle)}, {sin(angle), cos(angle)}} // only works in clang (haven't tested msvc)
// extern size_t height, width;

namespace map::renderables::shapes{

    // struct Shape;

    // using ShapePtr = std::unique_ptr<Shape>;

    struct Shape : Renderable {

        // Shared
        clr::RGB color;
        bool filled;
        int thickness;
        std::vector<Point> points;


        Shape(Point p, clr::RGB c, bool f, int t, std::vector<Point> pts = std::vector<Point>());

        // Shape(const Shape& other) = default;

        // Shape(Shape&& other) noexcept = default;

        // Shape& operator=(const Shape& other) = default;

        // Shape& operator=(Shape&& other) noexcept = default;

        virtual void rotate(double angle);

        virtual void rotate(double angle, const Point& cent);

        [[nodiscard]] virtual RenderablePtr rotated(double angle) const;

        virtual void shift(const Point& p);

        [[nodiscard]] virtual RenderablePtr shifted(const Point& p) const;

        [[nodiscard]] virtual std::vector<std::pair<size_t, size_t>> getLocks(Size size, const size_t root_pix_per_lock) const override;

        void setDepth(int depth) noexcept override;

        [[nodiscard]] int getDepth() const noexcept override;

        [[nodiscard]] virtual bool onBorder(const Point& p) const;

        [[nodiscard]] virtual bool insideShape(const Point& p) const;

    };
}


#include "Line.hpp"
#include "Circle.hpp"
#include "Rect.hpp"
#include "Triangle.hpp"
#include "Ellipse.hpp"
#include "Polygon.hpp"
#include "Text.hpp"
#include "Audio.hpp"
#include "Image.hpp"
