#include "../src/Mapper/Mapper.hpp" // importing the library

extern size_t height, width; // importing the height and width of the canvas

#include <vector>

void canvas(map::Mapper &m){
    using namespace map;

    // make a bunch of shapes
    auto s1 = shapes::Rect{{}, 100, 100, {.color = clr::RED, .filled = true, .rectAlignment = RectAlignment::top_right}};
    auto s2 = shapes::Circle{{}, 100, {.color = clr::BLUE, .filled = true, .alignment = Alignment::center}};
    auto s3 = shapes::Ellipse{{}, 50, 100, {.color = clr::GREEN, .filled = true, .alignment = Alignment::bottom}};


    std::vector<shapes::Shape*> shapes = {&s1, &s2, &s3};

    m.draw(shapes);
}