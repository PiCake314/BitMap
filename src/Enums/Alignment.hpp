#pragma once

#include <ostream>
#include <numeric>

#include "../Structs/Point.hpp"
#include "../Utility/Size.hpp"

namespace map{
    enum class Alignment : unsigned char {
        none =       0b000000,
        center =     0b000001,
        top =        0b000010,
        bottom =     0b000100,
        left =       0b001000,
        right =      0b010000,
    };


    namespace detail{
        // could be a template
        struct AlignmentConverter{
            map::Alignment a;
            constexpr AlignmentConverter(const map::Alignment a) noexcept : a{a} {}
            constexpr AlignmentConverter(const unsigned char a) noexcept : a{static_cast<map::Alignment>(a)} {}

            constexpr AlignmentConverter operator|(const AlignmentConverter b) const noexcept {
                return static_cast<AlignmentConverter>(static_cast<unsigned char>(a) | static_cast<unsigned char>(b));
            }

            constexpr AlignmentConverter operator&(const AlignmentConverter b) const noexcept {
                return static_cast<AlignmentConverter>(static_cast<unsigned char>(a) & static_cast<unsigned char>(b));
            }

            constexpr operator bool() const noexcept { return static_cast<bool>(static_cast<unsigned char>(a)); }

            constexpr operator map::Alignment() const noexcept { return a; }

            constexpr operator unsigned char() const noexcept { return static_cast<unsigned char>(a); }
        };
    }



    inline Point align(const map::Alignment alignment, const Size &canvas_size, const Size &shape_size) noexcept {
        // map::Alignemnt is a bitmask
        Point p;

        if(detail::AlignmentConverter{alignment} & Alignment::top){
            p.y = shape_size.height/2;
        }
        else if(detail::AlignmentConverter{alignment} & Alignment::bottom){
            p.y = canvas_size.height - shape_size.height/2;
        }

        if(detail::AlignmentConverter{alignment} & Alignment::left){
            p.x = shape_size.width/2;
        }
        else if(detail::AlignmentConverter{alignment} & Alignment::right){
            p.x = canvas_size.width - shape_size.width/2;
        }


        if(detail::AlignmentConverter{alignment} & Alignment::center){
            p.x = canvas_size.width/2 - shape_size.width/2;
            p.y = canvas_size.height/2 - shape_size.height/2;

        }

        return p;
    }


    inline std::ostream &operator<<(std::ostream &os, const map::detail::AlignmentConverter ac){

        auto check = [&os](bool first, const map::detail::AlignmentConverter ac, const map::Alignment a){
            if(ac & a){
                if(not first) os << ", ";
                os << a;
                return false;
            }

            return first;
        };

        const auto list = {
            map::Alignment::center,
            map::Alignment::top,
            map::Alignment::bottom,
            map::Alignment::left,
            map::Alignment::right
        };

        constexpr bool first = true;
        std::accumulate(list.begin(), list.end(), first, [&check, &ac](bool first, map::Alignment a){
            return check(first, ac, a);
        });


        return os;
    }

}