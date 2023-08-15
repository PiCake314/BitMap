#pragma once

namespace map{
    struct Size{
        int height, width;

        bool operator==(const Size&) const = default;
    };
}