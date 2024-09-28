#include "../src/Mapper/Mapper.hpp"


#include <iostream>
#include <vector>
#include <functional>
#include <cassert>


constexpr int DEFAULT_SIZE = 500;
size_t height = DEFAULT_SIZE, width = DEFAULT_SIZE;


template <typename T>
void test(std::vector<T> tests){
    for(const auto &test : tests)
        assert(test());
}


int main(){

    std::vector<bool(*)()> tests = {{
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
    }};

    test(tests);
}
