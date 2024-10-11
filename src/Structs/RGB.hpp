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

            constexpr explicit RGB(uint8_t v) noexcept :
            red(std::clamp<uint8_t>(v, 0, 255)),
            green(std::clamp<uint8_t>(v, 0, 255)),
            blue(std::clamp<uint8_t>(v, 0, 255))
            {}

            constexpr RGB(uint8_t r, uint8_t g, uint8_t b) noexcept :
            red(std::clamp<uint8_t>(r, 0, 255)),
            green(std::clamp<uint8_t>(g, 0, 255)),
            blue(std::clamp<uint8_t>(b, 0, 255))
            {}

            explicit constexpr RGB(const map::Point3D& p) noexcept:
            red(std::clamp<uint8_t>(uint8_t(p.x), 0, 255)),
            green(std::clamp<uint8_t>(uint8_t(p.y), 0, 255)),
            blue(std::clamp<uint8_t>(uint8_t(p.z), 0, 255))
            {}


            constexpr void invert() noexcept {
                red = 255 - red;
                green = 255 - green;
                blue = 255 - blue;
            }

            constexpr RGB inverted() const noexcept {
                RGB rgb = *this;
                return rgb.invert(), rgb;
            }

            constexpr bool operator==(const RGB& rgb) const noexcept = default;

            friend std::ostream& operator<<(std::ostream &os, const RGB &c) noexcept {
                return (os << int(c.red) << " " << int(c.green) << " " << int(c.blue));
            }

            static RGB RAND() noexcept {
                return RGB{
                    static_cast<uint8_t>(std::rand() % 255),
                    static_cast<uint8_t>(std::rand() % 255),
                    static_cast<uint8_t>(std::rand() % 255)
                };
            }
        };

        constexpr inline RGB RED{255, 0, 0};

        constexpr inline RGB GREEN{0, 255, 0};

        constexpr inline RGB BLUE{0, 0, 255};

        constexpr inline RGB WHITE{255, 255, 255};

        constexpr inline RGB BLACK{0, 0, 0};
    }
}
