#pragma once

namespace map{
    struct Size{
        int width, height;

        bool operator==(const Size&) const = default;
    };
}