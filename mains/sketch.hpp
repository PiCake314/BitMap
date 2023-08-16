#include "../src/Mapper/Mapper.hpp" // importing the library

extern int height, width; // importing the height and width of the canvas


void canvas(map::Mapper &m){
    using namespace map::shapes;

    m.fill();

    const int stripe_width = height/13 + 1;
    const double x_mid = width/2;

    for(int i = 0; i < 7; i++){
        const Rect red({x_mid, i*2*stripe_width + stripe_width/2.}, width, stripe_width, {.color = {200, 0, 0}, .filled = true});

        m.draw(&red);
    }

    const double box_width = width/2.5;
    const double box_height = 7*stripe_width;

    const Rect box({}, box_width, box_height, {.color = {0, 0, 150}, .filled = true, .rectAlignment = map::RectAlignment::Rtop_left});

    m.draw(&box);


    const int outline_width = box_width ;
    const int outline_height = box_height - 5;

    bool flag = true;

    // 11 by 9 grid
    for(int i = 0; i < 9; i++){
        for(int j = 0; j < 11; j++, flag = !flag){ // toggling the flag
            if(flag){
                const double x = (j/11.)*outline_width + 25;
                const double y = (i/9.)*outline_height + 25;
                const Circle star({x, y}, 10, {.color = map::clr::WHITE, .filled = true});

                m.draw(&star);
            }
        }
    }

}