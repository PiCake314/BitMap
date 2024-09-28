#pragma once

#include "../Mapper/Mapper.hpp"
#include <optional>
#include <ranges>


namespace map::util{

    inline bool isNumber(std::string_view s){
        return std::ranges::all_of(s, isdigit);
    }

    inline bool isValidP(std::string_view P){
        return (P == "P3" || P == "P5" || P == "P6");
    }

    inline bool isValidHeight(size_t height){
        return (height >= 1);
    }

    inline bool isValidWidth(size_t width){
        return (width >= 1);
    }

    inline bool isValidMax(size_t max){
        return (max <= 255);
    }

    inline bool areValid(std::string_view fn, std::string_view P, size_t h, size_t w, size_t M){
        const std::string_view ext = fn.substr(fn.length() - 4);
        const bool valid_file_name = fn.length() > 4 and (ext == ".ppm" or ext == "mp4");

        return  valid_file_name and isValidP(P) and isValidHeight(h) and isValidWidth(w) and isValidMax(M);
    }

    inline bool areValidString(std::string_view p, std::string_view h, std::string_view w, std::string_view m){
        return isNumber(h) and
               isNumber(w) and
               isNumber(m) and
               isValidP(p) and
               isValidHeight(std::stoul(h.data())) and
               isValidWidth(std::stoul(w.data())) and
               isValidMax(size_t(std::atoi(m.data())));
    }

    inline bool safePoint(const map::Point &p, map::Size s){
        return (p.x >= 0 and p.x < s.width and p.y >= 0 and p.y < s.height);
    }


    inline map::Point lerp(const map::Point &p1, map::Point p2, double dt){
        double x =  p1.x + (p2.x - p1.x)* double(dt);
        double y =  p1.y + (p2.y - p1.y)* double(dt);
        // TODO: refactor using std::lerp

        return map::Point(x, y);
    }



    // std::vector<std::pair<size_t, size_t>> outter_prod(int begin1, int end1, int begin2, int end2){
    //     std::vector<std::pair<size_t, size_t>> ret((end1 - begin1) * (end2 - begin2));

    //     for(int i = begin1; i < end1; i++){
    //         for(int j = begin2; j < end2; j++){
    //             ret.push_back(std::make_pair(i, j));
    //         }
    //     }

    //     return ret;
    // }



    // void copy(const std::vector<map::clr::RGB> &src, map::clr::RGB *dest){
    //     int s = src.size();
    //     for(int i = 0; i < s; i++){
    //         dest[i] = src[i];
    //     }
    // }


    inline constexpr double distFromLineSquared(map::Point p1, map::Point p2, map::Point p){
        const double a = p2.y - p1.y;
        const double b = p1.x - p2.x;
        const double c = p2.x*p1.y - p1.x*p2.y;

        return (std::abs(a*p.x + b*p.y + c) * std::abs(a*p.x + b*p.y + c))/(a*a + b*b);
    }


    inline std::pair<bool, std::optional<map::shapes::Line>> on_any_line(map::Point p, std::vector<map::shapes::Line> lines){
        for(const auto &line : lines){
            if(line.on(p)) return {true, line};
        }

        return {false, std::nullopt};
    }

} // namespace map::util
