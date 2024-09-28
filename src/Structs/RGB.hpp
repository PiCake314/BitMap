#pragma once

#include <iostream>
#include <algorithm>
#include "Point.hpp"

namespace map{
    namespace clr{
        struct RGB{
            uint8_t red{};
            uint8_t green{};
            uint8_t blue{};

            mutable int depth{};

            constexpr RGB() noexcept = default;
            // red(0),
            // green(0),
            // blue(0)
            // {}

            constexpr explicit RGB(int v) noexcept :
            red(uint8_t(std::clamp(v, 0, 255))),
            green(uint8_t(std::clamp(v, 0, 255))),
            blue(uint8_t(std::clamp(v, 0, 255)))
            {}

            constexpr RGB(int r, int g, int b) noexcept :
            red(uint8_t(std::clamp(r, 0, 255))),
            green(uint8_t(std::clamp(g, 0, 255))),
            blue(uint8_t(std::clamp(b, 0, 255)))
            {}

            constexpr RGB(const map::Point3D& p) noexcept:
            red(uint8_t(std::clamp(int(p.x), 0, 255))),
            green(uint8_t(std::clamp(int(p.y), 0, 255))),
            blue(uint8_t(std::clamp(int(p.z), 0, 255)))
            {}

            constexpr void invert() noexcept {
                red = 255 - red;
                green = 255 - green;
                blue = 255 - blue;
            }

            constexpr RGB inverted() const noexcept {
                return RGB{255 - red, 255 - green, 255 - blue};
            }

            constexpr bool operator==(const RGB& rgb) const noexcept = default;

            friend std::ostream& operator<<(std::ostream &os, const RGB &c) noexcept {
                return (os << int(c.red) << " " << int(c.green) << " " << int(c.blue));
            }

            static RGB RAND() noexcept {
                return RGB{std::rand() % 255, std::rand() % 255, std::rand() % 255};
            }
        };

        constexpr inline RGB RED{255, 0, 0};

        constexpr inline RGB GREEN{0, 255, 0};

        constexpr inline RGB BLUE{0, 0, 255};

        constexpr inline RGB WHITE{255, 255, 255};

        constexpr inline RGB BLACK{0, 0, 0};
    }
}
