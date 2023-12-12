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
            const Point velocity;
            const Point acceleration;
            const clr::RGB color;
            const int thickness;     
            std::vector<Point> points;
            int depth;


            Shape(Point p, clr::RGB c, int t, std::vector<Point> pts = std::vector<Point>(), int d = 0)
            : center(p), color(c), thickness(t), points(pts), depth{d} {}

            // Shape(const Shape& other) = default;

            // Shape(Shape&& other) = default;

            // Shape& operator=(const Shape& other) = default;

            // Shape& operator=(Shape&& other) = default;


            virtual void rotate(double angle){
                double ROT_MATT[2][2] = {
                    {cos(angle), -sin(angle)},
                    {sin(angle), cos(angle)}
                };

                double (*ROT_MAT)[2] = ROT_MATT;

                std::ranges::for_each(points, [ROT_MAT, this](Point &point){
                    point.rotate(ROT_MAT, center);
                });
            }

            [[nodiscard]] virtual ShapePtr rotated(double angle) const {
                ShapePtr s = std::make_unique<Shape>(*this);
                s->rotate(angle);
                return s;
            }

            virtual void shift(Point p){
                center += p;
                std::ranges::for_each(points, [p](Point &pt){pt += p;});
            }

            [[nodiscard]] virtual ShapePtr shifted(Point p) const {
                ShapePtr s = std::make_unique<Shape>(*this);
                s->shift(p);
                return s;
            }


            [[nodiscard]] virtual std::vector<std::pair<int, int>> getLocks(Size size, const int pixels_per_lock) const {
                std::vector<std::pair<int, int>> lockIndices;

                if (points.empty()) {
                    // Handle shapes with no points
                    return lockIndices;
                }

                // Calculate the bounding box of the shape
                int left = std::max(0, int(center.x - thickness / 2));
                int top = std::max(0, int(center.y - thickness / 2));
                int right = std::min(int(size.width - 1), int(center.x + thickness / 2));
                int bottom = std::min(int(size.height - 1), int(center.y + thickness / 2));

                // Determine the locks associated with the bounding box
                for (int y = top; y <= bottom; ++y) {
                    for (int x = left; x <= right; ++x) {
                        int lockIndexI = y / pixels_per_lock;
                        int lockIndexJ = x / pixels_per_lock;

                        lockIndices.emplace_back(lockIndexI, lockIndexJ);
                    }
                }

                // Remove duplicate lock indices
                std::sort(lockIndices.begin(), lockIndices.end());
                lockIndices.erase(std::unique(lockIndices.begin(), lockIndices.end()), lockIndices.end());

                return lockIndices;
            }


            virtual ~Shape() = default;

            protected:
            virtual void draw(Mapper*) const {
                throw std::runtime_error("draw() not implemented for base class.");
            };


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