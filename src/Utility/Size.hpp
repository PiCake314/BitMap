#pragma once

#include <ostream>

namespace map{
    struct Size{
        size_t width, height;

        bool operator==(const Size&) const = default;


        friend std::ostream &operator<<(std::ostream &os, const Size &s) noexcept {
            return os << s.width << 'x' << s.height;
        }
    };
}
