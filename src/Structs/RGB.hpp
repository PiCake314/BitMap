#pragma once

#include <iostream>
#include <algorithm>

namespace map{
    namespace clr{
        struct RGB{
            uint16_t red;
            uint16_t green;
            uint16_t blue;

            RGB():
            red(0),
            green(0),
            blue(0)
            {}

            RGB(int v):
            red(std::clamp(v, 0, 255)),
            green(std::clamp(v, 0, 255)),
            blue(std::clamp(v, 0, 255))
            {}

            RGB(int r, int g, int b):
            red(std::clamp(r, 0, 255)),
            green(std::clamp(g, 0, 255)),
            blue(std::clamp(b, 0, 255))
            {}

            void invert(){
                red = 255 - red;
                green = 255 - green;
                blue = 255 - blue;
            }

            RGB inverted() const{
                return RGB{255 - red, 255 - green, 255 - blue};
            }

            bool operator==(const RGB& rgb) const = default;

            friend std::ostream& operator<<(std::ostream &os, const RGB &c){
                return (os << c.red << " " << c.green << " " << c.blue);
            }
        };

        const RGB RED{255, 0, 0};

        const RGB GREEN{0, 255, 0};

        const RGB BLUE{0, 0, 255};

        const RGB WHITE{255, 255, 255};

        const RGB BLACK{0, 0, 0};
    }
}