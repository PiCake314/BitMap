#pragma once

#include <ostream>
#include "../Structs/Point.hpp"

namespace map{
    struct Size{
        size_t width{}, height{};

        bool operator==(const Size&) const noexcept = default;

        // explicit operator Point() const noexcept { return {width, height}; }


        friend std::ostream &operator<<(std::ostream &os, const Size &s) noexcept {
            return os << s.width << 'x' << s.height;
        }
    };
}
