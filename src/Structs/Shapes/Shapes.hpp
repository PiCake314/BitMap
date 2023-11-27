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
            Point velocity;
            Point acceleration;
            clr::RGB color;
            int thickness;     
            std::vector<Point> points;


            Shape(Point p, clr::RGB c, int t, std::vector<Point> pts = std::vector<Point>())
            : center(p), color(c), thickness(t), points(pts) {}


            virtual void rotate(double angle){
                double ROT_MATT[2][2] = {
                    {cos(angle), -sin(angle)},
                    {sin(angle), cos(angle)}
                };

                double (*ROT_MAT)[2] = ROT_MATT;

                std::ranges::for_each(points, [ROT_MAT, this](Point &point){
                    point -= center;
                    point.rotate(ROT_MAT, center);
                    point += center;
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