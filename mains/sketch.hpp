#include "../src/Mapper/Mapper.hpp" // importing the library

extern size_t height, width; // importing the height and width of the canvas

#include <vector>

void canvas(map::Mapper &m){
    using namespace map;


    // make a bunch of shapes
    // auto s1 = shapes::Rect{{}, 100, 100, {.color = clr::RED, .filled = true, .rectAlignment = RectAlignment::top_right}};
    // auto s2 = shapes::Circle{{}, 100, {.color = clr::BLUE, .filled = true, .alignment = Alignment::center}};
    // auto s3 = shapes::Ellipse{{}, 50, 100, {.color = clr::GREEN, .filled = true, .alignment = Alignment::bottom}};
    // map::shapes::Polygon non_convex{{
    //         {100, 100},
    //         {200, 100},
    //         {200, 200},
    //         {100, 200},
    //         {150, 150}
    //     }, {.color = clr::RGB(100, 20, 150), .filled = true}
    // };

    // non_convex.rotate(M_PI/4);

    // std::vector<shapes::Shape*> shapes = {&s1, &s2, &s3, &non_convex};


    std::vector<shapes::Shape*> shapes;
    for(int i = 0; i < 10'000; ++i){
        // create 100 circles with random radius and color and position
        shapes.push_back(new shapes::Circle{
            {rand() % width, rand() % height},
            rand() % 1000,
            {.color = clr::RGB(rand() % 255, rand() % 255, rand() % 255), .filled = true}
        });
    }

    m.draw(shapes, 5);
}