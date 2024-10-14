#pragma once

#include "../Mapper/Mapper.hpp"


auto animatePlot(std::invocable<double> auto func, size_t thickness, map::clr::RGB color, map::Size size)
requires (std::same_as<decltype(func(double{})), double>)
{
    using namespace map::renderables;

    return [
        func, thickness, color,
        width = size.width, height = size.height,
        shapes_vec = Renderables{}
    ](const size_t frame, const size_t frames, const double dt) mutable -> Renderables {


        const double x2 = double(frame +1)/frames * (1.5 * width);
        for(double x = double(frame)/frames * width; x < x2; ++x){
            shapes_vec.push_back(std::make_unique<shapes::Circle>(map::Point{x, func(x)}, thickness, shapes::Circle::Data{.color = color}));
        }

        Renderables new_vec;
        for(const auto &shape : shapes_vec) new_vec.push_back(shape->clone());

        return new_vec;
    };
}
