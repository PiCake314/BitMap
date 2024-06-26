#pragma once

#include "../Mapper/Mapper.hpp"
#include <optional>


namespace map::util{

    bool isNumber(std::string s){
        for(char c : s)
            if(!isdigit(c))
                return false;

        return true;
    }

    bool isValidP(std::string_view P){
        return (P == "P3" || P == "P5" || P == "P6");
    }

    bool isValidHeight(int height){
        return (height >= 1);
    }

    bool isValidWidth(int width){
        return (width >= 1);
    }

    bool isValidMax(int max){
        return (max <= 255);
    }

    bool areValid(const std::string& fn, std::string_view P, int h, int w, int M){
        return (isValidP(P) && isValidHeight(h) && isValidWidth(w) && isValidMax(M));
    }

    bool areValidString(std::string p, std::string h, std::string w, std::string m){
        return (isNumber(h) && isNumber(w) && isNumber(m) && isValidP(p) &&  isValidHeight(std::stoi(h)) && isValidWidth(std::stoi(w)) && isValidMax(std::stoi(m)));
    }

    bool safePoint(map::Point p, map::Size s){
        return (p.x >= 0 && p.x < s.width && p.y >= 0 && p.y < s.height);
    }


    map::Point lerp(map::Point p1, map::Point p2, float dt){
        int x =  p1.x + (p2.x-p1.x)*dt;
        int y =  p1.y + (p2.y-p1.y)*dt;
        // TODO: refactor using std::lerp

        return map::Point(x, y);
    }



    // std::vector<std::pair<int, int>> outter_prod(int begin1, int end1, int begin2, int end2){
    //     std::vector<std::pair<int, int>> ret((end1 - begin1) * (end2 - begin2));

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


    constexpr double distFromLineSquared(map::Point p1, map::Point p2, map::Point p){
        const double a = p2.y - p1.y;
        const double b = p1.x - p2.x;
        const double c = p2.x*p1.y - p1.x*p2.y;

        return (std::abs(a*p.x + b*p.y + c) * std::abs(a*p.x + b*p.y + c))/(a*a + b*b);
    }

    
    std::pair<bool, std::optional<map::shapes::Line>> on_any_line(map::Point p, std::vector<map::shapes::Line> lines){
        for(const auto &line : lines){
            if(line.on(p)) return {true, line};
        }

        return {false, std::nullopt};
    }

} // namespace map::util