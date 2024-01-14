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
            // const Point velocity;
            // const Point acceleration;
            clr::RGB color;
            bool filled;
            const int thickness;     
            std::vector<Point> points;


            Shape(Point p, clr::RGB c, bool f, int t, std::vector<Point> pts = std::vector<Point>())
            : center(p), color(c), filled{f}, thickness(t), points(pts) {
                color.depth = 1;
            }

            // Shape(const Shape& other) = default;

            // Shape(Shape&& other) = default;

            // Shape& operator=(const Shape& other) = default;

            // Shape& operator=(Shape&& other) = default;


            virtual void rotate(double angle){
                for(auto& point : points){
                    point.rotate(angle, center);
                }
            }


            virtual void rotate(double angle, const Point& cent){
                for(auto& point : points){
                    point.rotate(angle, cent);
                }
            }

            [[nodiscard]] virtual ShapePtr rotated(double angle) const {
                ShapePtr s = std::make_unique<Shape>(*this);
                s->rotate(angle);
                return s;
            }

            virtual void shift(const Point& p){
                center += p;
                std::ranges::for_each(points, [p](Point &pt){pt += p;});
            }

            [[nodiscard]] virtual ShapePtr shifted(const Point& p) const {
                ShapePtr s = std::make_unique<Shape>(*this);
                s->shift(p);
                return s;
            }


            [[nodiscard]] virtual std::vector<std::pair<int, int>> getLocks(Size size, const int root_pix_per_lock) const {
                std::vector<std::pair<int, int>> lockIndices;

                if(points.empty()) return lockIndices;

                // calculate the bounding box
                int left = points[0].x;
                int top = points[0].y;
                int right = points[0].x;
                int bottom = points[0].y;

                for(const auto& point : points){
                    if(point.x < left)    left   = point.x;
                    if(point.y < top)     top    = point.y;
                    if(point.x > right)   right  = point.x;
                    if(point.y > bottom)  bottom = point.y;
                }

                const int half_thickness = thickness/2;

                const int x1 = std::clamp(left - half_thickness, 0, int(size.width) -1);
                const int x2 = std::clamp(right + half_thickness, 0, int(size.width) -1);
                const int y1 = std::clamp(top - half_thickness, 0, int(size.height) -1);
                const int y2 = std::clamp(bottom + half_thickness, 0, int(size.height) -1);

                if(filled){
                    for(int i = y1; i <= y2; ++i){
                        for(int j = x1; j <= x2; ++j){
                            if(insideShape({j, i})){
                                lockIndices.push_back({i/root_pix_per_lock, j/root_pix_per_lock});
                                j = ((j/root_pix_per_lock) + 1) * root_pix_per_lock;
                            }
                        }
                    }
                }
                else{
                    // only add the points that are on the border
                    for(int i = y1; i <= y2; ++i){
                        for(int j = x1; j <= x2; ++j){
                            if(onBorder({j, i})){
                                lockIndices.push_back({i/root_pix_per_lock, j/root_pix_per_lock});
                                j = ((j/root_pix_per_lock) + 1) * root_pix_per_lock;
                            }
                        }
                    }

                    // Remove duplicate lock indices
                }
                std::ranges::sort(lockIndices);
                lockIndices.erase(std::unique(lockIndices.begin(), lockIndices.end()), lockIndices.end());

                // for(auto [i, j] : lockIndices){
                //     std::cout << (i*size.width/root_pix_per_lock) + j << ", ";
                // }
                // puts("");

                return lockIndices;
            }

            void setDepth(int depth){ color.depth = depth; }

            [[nodiscard]] int getDepth() const { return color.depth; }

            [[nodiscard]] virtual bool onBorder(const Point& p) const {
                if (points.size() < 2) {
                    return points.empty() ? false : points[0] == p;
                }

                for(int i = 0, j = points.size() - 1; i < points.size(); j = i++){
                    if(
                    ((points[i].y == p.y) && ((points[i].x <= p.x && p.x <= points[j].x) || (points[j].x <= p.x && p.x <= points[i].x))) ||
                    ((points[i].x == p.x) && ((points[i].y <= p.y && p.y <= points[j].y) || (points[j].y <= p.y && p.y <= points[i].y))) ||
                    (std::abs(points[i].x - p.x) < 2 && std::abs(points[i].y - p.y) < 2)
                    )
                        return true;
                }

                return false;
            }

            [[nodiscard]] virtual bool insideShape(const Point& p) const {
                if(points.size() < 3){
                    if(points.size() == 1)
                        return points[0] == p;
                    else if(points.size() == 2){
                        // taken from Line::on()
                        const Point& p1 = points[0];
                        const Point& p2 = points[1];

                        if(p.x < std::min(p1.x, p2.x) || p.x > std::max(p1.x, p2.x) || p.y < std::min(p1.y, p2.y) || p.y > std::max(p1.y, p2.y))
                            return false;

                        const double a = p2.y - p1.y;
                        const double b = p1.x - p2.x;
                        const double c = p2.x*p1.y - p1.x*p2.y;
                        const double eq = std::abs(a*p.x + b*p.y + c);

                        // calculates distance the distance squared 
                        return (eq * eq)/(a*a + b*b) <= std::pow(thickness/2., 2);
                    }
                    return false;
                }

                bool inside = false;

                for(int i = 0, j = points.size() - 1; i < points.size(); j = i++){
                    if(((points[i].y > p.y) != (points[j].y > p.y))
                    && (p.x < (points[j].x - points[i].x) * (p.y - points[i].y) / (points[j].y - points[i].y) + points[i].x))
                        inside = !inside;
                }

                return inside;
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