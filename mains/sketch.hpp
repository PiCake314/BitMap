#include "../src/Mapper/Mapper.hpp" // importing the library

extern size_t height, width; // importing the height and width of the canvas

#include <vector>
#include <algorithm>


void canvas(map::Mapper &m){
    using namespace map;
    using namespace shapes;


    // // make a bunch of shapes
    auto s1 = shapes::Rect{{}, int(width/4), int(height/4), {.color = clr::RED, .filled = true, .rectAlignment = RectAlignment::top_right}};
    auto s2 = shapes::Circle{{}, static_cast<int>(width/4), {.color = clr::BLUE, .filled = true, .alignment = Alignment::center}};
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

    // m.draw(shapes, 5);

// ==============================================

    // std::vector<Shape*> shapes;
    // for(int i = 0; i < 3'333; ++i){
    //     shapes.push_back(new shapes::Circle{
    //         {rand() % width, rand() % height},
    //         rand() % 100,
    //         {.color = clr::RGB(rand() % 255, rand() % 255, rand() % 255), .filled = bool(rand() % 2)}
    //     });

    //     // shapes.push_back(
    //     //     new shapes::Circle{{}, static_cast<int>(width/4), {.color = clr::RED, .filled = true, .alignment = Alignment::center}}
    //     // );
    // }

    // for(int i = 0; i < 3'333; ++i){
    //     shapes.push_back(new shapes::Rect{
    //         {rand() % width, rand() % height},
    //         rand() % 100, rand() % 100,
    //         {.color = clr::RGB(rand() % 255, rand() % 255, rand() % 255), .filled = bool(rand() % 2)}
    //     });
    // }

    // for(int i = 0; i < 3'333; ++i){
    //     shapes.push_back(new shapes::Rect{
    //         {rand() % width, rand() % height},
    //         rand() % 100, rand() % 100,
    //         {.color = clr::RGB(rand() % 255, rand() % 255, rand() % 255), .filled = bool(rand() % 2)}
    //     });
    // }

    // shapes.push_back(&s2);

    // m.draw(shapes, 5);
// ==============================================

    // const int away = 300;
    // Polygon p{{{away, away}, {width - away -1, away}, {width - away -1, height - away -1}, {away, height - away -1}}, {.color = clr::RED, .filled = false}};
    // Rect r{{}, int(width - 2*away), int(height - 2*away), {.color = clr::BLUE, .filled = false, .rectAlignment = RectAlignment::center}};
    // m.draw(std::vector<Shape*>{&r}, 1);


// ==============================================

    // std::vector<Shape*> shapes;
    // for(int i = 0; i < 10'000; ++i){
    //     shapes.push_back(new Circle{{rand() % width, rand() % height}, rand() % 500 , {.color = clr::RGB::RAND(), .filled = true}});
    // }

    // shapes.push_back(&s2);

    // m.draw(shapes, 5);


// ==============================================

    std::vector<Shape*> shapes;
    for(int i = 0; i < 10'000; ++i){
        shapes.push_back(new Rect{{rand() % width, rand() % height}, int(rand() % 500), int(rand() % 500), {.color = clr::RGB::RAND(), .filled = true}});
    }

    shapes.push_back(&s1);

    m.draw(shapes, 5);


// ==============================================

    // std::vector<Shape*> shapes;

    // for(int x = 0; x < 3; ++x)
    // for(int i = 0; i < 3'333; ++i){
    //     std::vector<Point> points;
    //     for(int p = 0; p < 5 - x; ++p){
    //         points.push_back({rand() % width, rand() % height});
    //     }

    //     shapes.push_back(new Polygon{points, {.color = clr::RGB::RAND(), .filled = true}});
    // }

    // // shapes.push_back(&s2);

    // m.draw(shapes, 1);


// ==============================================

    // Polygon croissont{
    //     {
    //         {width -1, 0},
    //         {0, height/2. -1},
    //         {width -1, height -1},
    //         {width/4. -1, height/2. -1}
    //     }, {.color = clr::RGB(255, 213, 0), .filled = true}
    // };

    // std::vector<Shape*> shapes = {&croissont};
    // m.draw(shapes);

}