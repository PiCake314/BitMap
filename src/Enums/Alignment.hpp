#pragma once

namespace map{
    enum class Alignment : unsigned char {
        none =       0b000000,
        center =     0b000001,
        top =        0b000010,
        bottom =     0b000100,
        left =       0b001000,
        right =      0b010000,
    };
}

inline unsigned char operator&(unsigned char a, map::Alignment b){
    return a & static_cast<unsigned char>(b);
}

