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


            [[nodiscard]] virtual std::vector<std::pair<int, int>> getLocks(Size size, const int root_pix_per_lock) const {
                std::vector<std::pair<int, int>> lockIndices;

                if(points.empty()) return lockIndices;

                // calculate the bounding box
                Point
                left{std::numeric_limits<double>::infinity(), 0.},
                top{0., std::numeric_limits<double>::infinity()},
                right{-std::numeric_limits<double>::infinity(), 0.},
                bottom{0., -std::numeric_limits<double>::infinity()};

                for(const auto& point : points){
                    if(point.x < left.x)   left   = point;
                    if(point.y < top.y)    top    = point;
                    if(point.x > right.x)  right  = point;
                    if(point.y > bottom.y) bottom = point;
                }


                // std::clog << "left: " << left << std::endl;
                // std::clog << "top: " << top << std::endl;
                // std::clog << "right: " << right << std::endl;
                // std::clog << "bottom: " << bottom << std::endl;


                // determine the locks associated
                for(int y = top.y; y <= bottom.y; ++y){
                    for(int x = left.x; x <= right.x; ++x){
                        Point p{x, y};
                        // std::clog << "p: " << p << std::endl;
                        int i = y == size.height ?
                        y/root_pix_per_lock - 1 : y/root_pix_per_lock;
                        int j = x == size.width ?
                        x/root_pix_per_lock - 1 : x/root_pix_per_lock;

                        // std::clog << "i: " << i << std::endl;
                        // std::clog << "j: " << j << std::endl;

                        lockIndices.push_back({i, j});
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