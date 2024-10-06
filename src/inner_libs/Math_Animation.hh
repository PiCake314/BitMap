#pragma once

#include "../Mapper/Mapper.hpp"


auto animatePlot(std::invocable<double> auto func, size_t thickness, map::clr::RGB color, map::Size size)
requires (std::same_as<decltype(func(double{})), double>)
{
    return [
        func, thickness, color,
        width = size.width, height = size.height,
        shapes_vec = map::renderables::shapes::Shapes{}
    ](const size_t frame, const size_t frames, const double dt) mutable -> map::renderables::shapes::Shapes {

        const auto x2 = double(frame +1)/frames * width;
        for(auto x = double(frame)/frames * width; x < x2; ++x){
            shapes_vec.push_back(std::make_unique<map::renderables::shapes::Circle>(map::Point{x, func(x)}, thickness, map::renderables::shapes::Circle::Data{.color = color}));
        }

        // shapes_vec.push_back(std::make_unique<shapes::Line>(p1, p2, shapes::Line::Data{.color = BLACK, .thickness = 5}));

        map::renderables::shapes::Shapes new_vec;
        for(const auto &shape : shapes_vec) new_vec.push_back(shape->clone());

        return new_vec;
    };
}
