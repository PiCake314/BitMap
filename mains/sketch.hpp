#include "../src/Mapper/Mapper.hpp" // importing the library
#include <vector>
#include <array>


extern size_t height, width; // importing the height and width of the canvas

map::shapes::Shapes bunchOfShapes(const int frame, const int frames, const double dt){
    using Data = map::shapes::Circle::Data;
    using std::operator""s;

    map::shapes::Shapes shapes;
    const int NUM_SHAPES = 10;

    // create NUM_SHAPES circles with rainbow colors
    for(int i = 0; i < NUM_SHAPES; i++){
        const double t = (frame + i) * dt;
        const double x = 0.5 * width + 0.3 * width * cos(t);
        const double y = 0.5 * height + 0.3 * height * sin(t);
        const double r = 0.1 * width + 0.05 * width * sin(t);
        const map::clr::RGB color = map::clr::RGB{int((0.5 + 0.5 * cos(t)) * 255), int((0.5 + 0.5 * sin(t)) * 255), int((0.5 + 0.5 * cos(t + 0.5)) * 255)};
        shapes.push_back(std::make_unique<map::shapes::Circle>(map::Point{x, y}, r, Data{.color = color}));
    }

    if(const int quarter_frames = frames/4; frame % quarter_frames == 0){ // every 1/4 of the frames
        shapes.push_back(std::make_unique<map::shapes::Audio>("click.mp3"s));
    }

    return shapes;
}


void canvas(map::Mapper &m){
    
    m.animate(bunchOfShapes, 2 * M_PI);


}