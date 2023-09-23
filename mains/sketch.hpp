#include "../src/Mapper/Mapper.hpp" // importing the library

extern int height, width; // importing the height and width of the canvas


map::shapes::ShapePtr drawLetterbyLetter(const int frame, const int frames){
    std::string text = "Ishan is da best!!";

    const double ratio = static_cast<double>(frame)/frames;
    const size_t len = text.size();
    const size_t index = static_cast<size_t>(ratio * len);

    std::string sub = text.substr(0, index);

    return std::make_unique<map::shapes::Text>(sub, map::Point{width/2., height/2.}, map::shapes::Text::Data{.font = "Fight!160"});
}



void canvas(map::Mapper &m){
    // std::vector<map::Point> star;
    // for(int i = 0; i < 5; i++){
    //     star.push_back({width/2. + 100*cos(i * 2 * M_PI/5), height/2. + 100*sin(i * 2 * M_PI/5)});
    //     star.push_back({width/2. + 50*cos((i + .5) * 2 * M_PI/5), height/2. + 50*sin((i + .5) * 2 * M_PI/5)});
    // }

    // // std::cout << "Points:\n";
    // // for(const auto &p : star)
    // //     std::cout << p << '\n';

    // m.drawPolygon(star, map::clr::RGB(100, 20, 150), true);

    m.loadFont("Fight!160");

    m.animate(drawLetterbyLetter, .5);
}