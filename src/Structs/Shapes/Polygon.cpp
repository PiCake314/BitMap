#include "Polygon.hpp"



map::shapes::Polygon::Polygon(std::vector<Point> pts, Data &&d)
: Shape(
    std::accumulate(pts.begin(), pts.end(), Point(), [](Point p1, Point p2){ return p1 + p2; })/pts.size(),
    d.color,
    d.thickness, 
    pts
)
{}


void map::shapes::Polygon::rotate(double angle){

    double ROT_MAT[2][2] = {
        {cos(angle), -sin(angle)},
        {sin(angle), cos(angle)}
    };

    for(auto &point : points){
        point = ROT_MAT * point;
    }
    
    center = std::accumulate(
        points.begin(),
        points.end(),
        Point()
    )/points.size();
}


map::shapes::ShapePtr map::shapes::Polygon::rotated(double angle) const {
    ShapePtr poly = std::make_unique<Polygon>(*this);
    poly->rotate(angle);
    return poly;
}


void map::shapes::Polygon::shift(Point p){
    for(auto &point : points){
        point += p;
    }

    center += p;
}


map::shapes::ShapePtr map::shapes::Polygon::shifted(Point p) const {
    ShapePtr poly = std::make_unique<Polygon>(*this);
    poly->shift(p);
    return poly;
}


void map::shapes::Polygon::draw(Mapper *m) const {
    // m->drawPolygon(points, color, thickness);
}