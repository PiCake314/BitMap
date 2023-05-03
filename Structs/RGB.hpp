#pragma once

#include <iostream>

namespace map{
    namespace clr{
        struct RGB{
            int red;
            int green;
            int blue;

            RGB():
            red(0),
            green(0),
            blue(0){}

            RGB(int v):
            red(v),
            green(v),
            blue(v){}

            RGB(int r, int g, int b):
            red(r), green(g), blue(b){}

            bool operator==(RGB rgb){
                return red == rgb.red && green == rgb.green && blue == rgb.blue;
            }

            friend std::ostream& operator << (std::ostream &os, const RGB &c){
                return (os << c.red << " " << c.green << " " << c.blue);
            }
        };

        const clr::RGB RED =  RGB(255, 0, 0);

        const clr::RGB GREEN = RGB(0, 255, 0);

        const clr::RGB BLUE = RGB(0, 0, 255);
    }
}