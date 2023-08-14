#include "../src/Mapper/Mapper.hpp"

extern int height, width;


map::shapes::Shape *scene(int frame, const int frames){
    map::Point p{width * static_cast<double>(frame)/frames, static_cast<double>(height)/2};

    return new map::shapes::Circle{p, 150, map::clr::RED, true};
}



void canvas(map::Mapper &m){
    // m.fill(map::clr::RGB(255, 255, 0));

    // map::shapes::Rect *top_l = new map::shapes::Rect({}, static_cast<double>(height)/2 - 50, static_cast<double>(width)/2 - 50, map::clr::BLUE, true, false, map::RectAlignment::Rtop_left);
    // map::shapes::Rect *top_r = new map::shapes::Rect({}, static_cast<double>(height)/2 - 50, static_cast<double>(width)/2 - 50, map::clr::BLUE, true, false, map::RectAlignment::Rtop_right);
    // map::shapes::Rect *bot_l = new map::shapes::Rect({}, static_cast<double>(height)/2 - 50, static_cast<double>(width)/2 - 50, map::clr::BLUE, true, false, map::RectAlignment::Rbottom_left);
    // map::shapes::Rect *bot_r = new map::shapes::Rect({}, static_cast<double>(height)/2 - 50, static_cast<double>(width)/2 - 50, map::clr::BLUE, true, false, map::RectAlignment::Rbottom_right);

    // m.noSet();
    // std::cerr << "Drawing rects" << std::endl;
    // m.draw(top_l);
    // std::cerr << "Drawing rects" << std::endl;
    // m.draw(top_r);
    // std::cerr << "Drawing rects" << std::endl;
    // m.draw(bot_l);
    // std::cerr << "Drawing rects" << std::endl;
    // m.draw(bot_r);

    // m.setState();

    // delete top_l;
    // delete top_r;
    // delete bot_l;
    // delete bot_r;


    m.fill(map::clr::BLUE);

    map::shapes::Rect r1({}, 0, 100, map::clr::RGB(255, 255, 0), true, false, map::RectAlignment::Rheight);
    map::shapes::Rect r2({}, 100, 0, map::clr::RGB(255, 255, 0), true, false, map::RectAlignment::Rwidth);

    m.draw(&r1);
    m.draw(&r2);

}