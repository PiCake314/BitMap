#include "../src/Mapper/Mapper.hpp"

extern int height, width;


void canvas(map::Mapper &m){
    using namespace map::shapes;

    m.noSet();

    m.fill();

    Rect green({0, height/6.}, 0, height/3., {color: {0, 150, 0}, filled: true, rectAlignment: map::RectAlignment::Rwidth});
    Rect red({0, 5*height/6.}, 0, height/3., {color: {180, 0, 0}, filled: true, rectAlignment: map::RectAlignment::Rwidth});


    m.draw(&green);
    m.draw(&red);

    map::Point points[4] = {{0, 0}, {width/4., height/3.}, {width/4., 2*height/3.}, {0, height*1.}};
    m.drawFourPoints(points, map::clr::BLACK, false);

    m.setState();

}