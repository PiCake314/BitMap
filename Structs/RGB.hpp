#pragma once

#include <iostream>
#include <sstream>

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

    RGB(int r, int g, int b){
        red = r;
        green = g;
        blue = b;
    }

    bool operator==(RGB rgb){
        return this->red == rgb.red && this->green == rgb.green && this->blue == rgb.blue;
    }

    friend std::ostream& operator << (std::ostream &os, const RGB &c){
        return (os << c.red << " " << c.green << " " << c.blue);
    }
};



