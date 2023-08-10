#pragma once

struct Size{
    int height;
    int width;

    Size(int h, int w) : height(h), width(w) {}


    bool operator==(const Size &other) const{
        return height == other.height && width == other.width;
    }
};