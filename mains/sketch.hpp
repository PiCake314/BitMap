#include "../src/Mapper/Mapper.hpp" // importing the library
#include <vector>
#include <array>

extern size_t height, width; // importing the height and width of the canvas
using Shapes = std::vector<map::shapes::ShapePtr>;

std::unique_ptr<map::shapes::Text> getIndex(int index, const map::Point& location){
    return std::make_unique(std::to_string(index), location + map::Point{10, 10});
}

Shapes helper(int w, int h, int order){
    using namespace map;
    using namespace shapes;

    Shapes shapes;

    const double qW = w/4.;
    const double qH = h/4.;
    if(order <= 1){
        shapes.emplace_back(std::make_unique<Line>(Point{w - qW, qH}, Point{w - qW, h - qH}));
        // shapes.push_back
        shapes.emplace_back(std::make_unique<Line>(Point{w - qW, h - qH}, Point{qW, h - qH}));
        shapes.emplace_back(std::make_unique<Line>(Point{qW, h - qH}, Point{qW, qH}));

        return shapes;
    }

    auto up_left = helper(2*qW, 2*qH, order -1);
    auto down_left = helper(2*qW, 2*qH, order -1); // up_left;
    auto down_right = helper(2*qW, 2*qH, order -1); // up_left;
    auto up_right = helper(2*qW, 2*qH, order -1); // up_left;

    for(auto& line : up_left){
        line->rotate(-90 DEGREES, {qW, qH});
    }

    for(auto& line : down_left){
        line->shift({0, 2*qH});
    }
    
    for(auto& line : down_right){
        line->shift({2*qW, 2*qH});
    }
    
    for(auto& line : up_right){
        line->rotate(90 DEGREES, {qW, qH});
        line->shift({2*qW, 0});
    }

    // const int depth = order -2;
    shapes.emplace_back(std::make_unique<Line>(up_left.back()->points[1], down_left.back()->points[1]));
    shapes.emplace_back(std::make_unique<Line>(down_left.front()->points[0], down_right.back()->points[1]));
    shapes.emplace_back(std::make_unique<Line>(down_right.front()->points[0], up_right.front()->points[0]));


    // for(auto it = up_left.rbegin(); it != up_left.rend(); ++it){
    //     std::swap((*it)->points[0], (*it)->points[1]);
    //     shapes.push_back(std::move(*it));
    // }

    for(auto& line : up_right){
        shapes.push_back(std::move(line));
    }

    for(auto& line : down_right){
        shapes.push_back(std::move(line));
    }

    for(auto& line : down_left){
        shapes.push_back(std::move(line));
    }

    for(auto& line : up_left){
        shapes.push_back(std::move(line));
    }

    // for(auto it = up_right.rbegin(); it != up_right.rend(); ++it){
    //     std::swap((*it)->points[0], (*it)->points[1]);
    //     shapes.push_back(std::move(*it));
    // }


    return shapes;
}


// Shapes hilbertCurves(const int, const int, const double delta){
//     using namespace map;
//     using namespace shapes;

//     constexpr int order = 1;



//     return helper(width, height, order);

// }


void canvas(map::Mapper &m){
    using namespace map;
    using namespace shapes;

    m.loadFont("Default");

    constexpr int order = 3;

    auto shapes = helper(width, height, order);
    m.draw(shapes);

}

