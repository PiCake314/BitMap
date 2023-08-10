#include "../src/Mapper/Mapper.hpp"


#include <iostream>
#include <array>
#include <functional>
#include <cassert>

std::function<bool()> tests[] = {
    []() -> bool {
        using namespace map;
        using namespace map::shapes;

        Mapper m("test.ppm", {500, 500});
        m.noSet();
        m.fill();

        return m[Point{0, 0}] == clr::WHITE;
    },

    []() -> bool {
        using namespace map;
        using namespace map::shapes;

        Mapper m("test.ppm", {500, 500});

        return m.getSize() == Size{500, 500};
    },

    []() -> bool {
        using namespace map;
        using namespace map::shapes;

        Mapper m("test.ppm", {500, 500});

        // idk how I'm supposed to test images..
        return true;
    }
};


int main(){
    for(auto &test : tests)
        assert(test());
}