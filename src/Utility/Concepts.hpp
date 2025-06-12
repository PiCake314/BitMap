#pragma once

#include <concepts>


namespace map::cpts {

    template <typename T>
    concept numeric = std::integral<T> || std::floating_point<T>;

}