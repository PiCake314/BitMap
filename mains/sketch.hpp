#include "../src/Mapper/Mapper.hpp" // importing the library

extern int height, width; // importing the height and width of the canvas


map::shapes::Shape* growingCircle(const int frame, const int frames){
    int radius = (frame*1.)/(frames) * 100;
    return new map::shapes::Circle{{width/2., height/2. - 150}, radius, {.color={11, 134, 216}, .filled=true}};
}


map::shapes::Shape* textInMiddle(const int frame, const int frames){
    return new map::shapes::Text{"m", {width/2. + 4, height/2. - 170}, {.font="Consolas164"}};
}



map::shapes::Shape* restOfTexts(const int frame, const int frames){
    std::string text = "Consulting";
    int num_letters = (frame*1.)/(frames) * text.size();
    return new map::shapes::Text{text.substr(0, num_letters), {width/2., height/2. + 50}, {.font="Jetbrains"}};
}

map::shapes::Shape* restOfTexts2(const int frame, const int frames){
    std::string text = "Contracting";
    int num_letters = (frame*1.)/(frames) * text.size();
    return new map::shapes::Text{text.substr(0, num_letters), {width/2., height/2.+120}, {.font="Jetbrains"}};
}


map::shapes::Shape* restOfTexts3(const int frame, const int frames){
    std::string text = "Code Review";
    int num_letters = (frame*1.)/(frames) * text.size();
    return new map::shapes::Text{text.substr(0, num_letters), {width/2., height/2.+190}, {.font="Jetbrains"}};
}


map::shapes::Shape* restOfTexts4(const int frame, const int frames){
    std::string text = "Interview Prep";
    int num_letters = (frame*1.)/(frames) * text.size();
    return new map::shapes::Text{text.substr(0, num_letters), {width/2., height/2.+260}, {.font="Jetbrains"}};
}



void canvas(map::Mapper &m){
    m.fill(map::clr::BLACK);
    m.loadFont("Consolas164");

    m.animate(growingCircle, .5);
    auto circle = map::shapes::Circle{{width/2., height/2. - 150}, 100, {.color={11, 134, 216}, .filled=true}};
    m.draw(&circle);
    auto text = map::shapes::Text{"m", {width/2. + 4, height/2. - 170}, {.font="Consolas164"}};
    m.draw(&text);

    m.animate(textInMiddle, .5);

    m.loadFont("Jetbrains");

    m.animate(restOfTexts, .5);
    auto t = map::shapes::Text{"Consulting", {width/2., height/2.+50}, {.font="Jetbrains"}};
    m.draw(&t);

    m.animate(restOfTexts2, .5);
    t = map::shapes::Text{"Contracting", {width/2., height/2.+120}, {.font="Jetbrains"}};
    m.draw(&t);

    m.animate(restOfTexts3, .5);
    t = map::shapes::Text{"Code Review", {width/2., height/2.+190}, {.font="Jetbrains"}};
    m.draw(&t);

    m.animate(restOfTexts4, .5);

}