#include "Shapes.hpp"

namespace map{
    class Mapper;

    namespace shapes{
        
        class Polygon : public Shape{
            std::vector<Point> points;

        public:
            Polygon(std::vector<Point> pts, clr::RGB c = clr::RGB(), int thickness = 0)
            : points(pts),
            Shape(
                std::accumulate(pts.begin(), pts.end(), Point(), [](Point p1, Point p2){ return p1 + p2; })/pts.size(),
                c, thickness
            ) {}

            void rotate(double angle) override {
                for(auto &point : points){
                    point = ROT_MAT * point;
                }
                
                center = std::accumulate(
                    points.begin(),
                    points.end(),
                    Point()
                )/points.size();
            }

            ShapePtr rotated(double angle) const override {
                ShapePtr poly = std::make_unique<Polygon>(*this);
                poly->rotate(angle);
                return poly;
            }

            void shift(Point p) override {
                for(auto &point : points){
                    point += p;
                }

                center += p;
            }

            ShapePtr shifted(Point p) const override {
                ShapePtr poly = std::make_unique<Polygon>(*this);
                poly->shift(p);
                return poly;
            }

            void draw(Mapper * m) const override {
                // m->drawPolygon(points, color, thickness);
            }
        };
    }
}