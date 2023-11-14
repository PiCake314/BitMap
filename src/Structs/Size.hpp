#pragma once

namespace map{
    struct Size{
        size_t width, height;

        bool operator==(const Size&) const = default;
    };
}