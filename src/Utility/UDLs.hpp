#pragma once
#include <cmath>

// left here for compatibility reasons
#define DEGREES /180. * M_PI

constexpr long double operator ""_deg(long double deg){
    return deg DEGREES;
}

constexpr long double operator""_deg(unsigned long long deg){
    return deg DEGREES;
}

