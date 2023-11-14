#include "../src/Mapper/Mapper.hpp" // importing the library

extern size_t height, width; // importing the height and width of the canvas


map::Point vel = {50, 10}; // positive x is right, positive y is down
map::Point pos = {width/4., height/4.};
const double gravity = 500;
const int radius = 10;
const double mass = 1;

map::shapes::ShapePtr bouncingBall(const double delta){

    pos = {(pos.x + vel.x * delta), (pos.y + vel.y * delta)};

    // if the ball hits the ground, bounce it
    if(pos.y >= height - radius){
        // vel.y = -vel.y;
        vel.y = -abs(vel.y);
    }
    else{
        vel.y = vel.y + gravity * delta;
    }


    // if the ball hits the wall, flip the x velocity
    if(pos.x > width - radius){
        vel.x = -vel.x;
        pos.x = width - radius;
    }
    else if(pos.x < radius){
        vel.x = -vel.x;
        pos.x = radius;
    }

    // returning the ball
    return std::make_unique<map::shapes::Circle>(pos, radius, map::shapes::Circle::Data{.color = map::clr::RED, .filled = true});
}


map::shapes::ShapePtr rotatingStick(const int frame, const int frames){
    using Type = map::shapes::Line;
    using Data = map::shapes::Line::Data;
    const double desired_angle = 2 * M_PI;

    const double angle = (double)frame/frames * desired_angle;

    return std::make_unique<Type>(map::Point{width/2., height/2.}, 100, angle, Data{.color = map::clr::BLUE});
}


void canvas(map::Mapper &m){
    // std::vector<map::Point> star;
    // for(int i = 0; i < 5; i++){
    //     star.push_back({width/2. + 100*cos(i * 2 * M_PI/5), height/2. + 100*sin(i * 2 * M_PI/5)});
    //     star.push_back({width/2. + 50*cos((i + .5) * 2 * M_PI/5), height/2. + 50*sin((i + .5) * 2 * M_PI/5)});
    // }

    // m.drawPolygon(star, map::clr::RGB(100, 20, 150), true);

    // m.fill(map::clr::RGB{11, 134, 44});

    // m.animate(bouncingBall, 10);

    m.animate(rotatingStick, 2);
}