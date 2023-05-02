#include "Mapper.hpp"


bool isNumber(std::string s){
    for(char &c : s)
        if(!isdigit(c))
            return false;

    return true;
}

bool isValidP(std::string P){
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

bool areValid(std::string fn, std::string P, int h, int w, int M){
    return (isValidP(P) && isValidHeight(h) && isValidWidth(w) && isValidMax(M));
}

bool areValidString(std::string p, std::string h, std::string w, std::string m){
    return (isNumber(h) && isNumber(w) && isNumber(m) && isValidP(p) &&  isValidHeight(std::stoi(h)) && isValidWidth(std::stoi(w)) && isValidMax(std::stoi(m)));
}

bool safePoint(map::Point p, Size s){
    return p.y*s.height + p.x >= 0 && p.y*s.height + p.x < s.height*s.width;
}

// Point findTopLeft(Point Ps[]){
//     Point ret = Ps[0];
//     for(int i=1; i<4; i++)
//         if(Ps[i].x + Ps[i].y < ret.x + ret.y)
//             ret = Ps[i];

//     return ret;
// }

// Point findTopRight(Point Ps[]){
//     Point ret = Ps[0];
//     for(int i=1; i<4; i++)
//         if(Ps[i].x < ret.x && Ps[i].y > ret.y)
//             ret = Ps[i];

//     return ret;
// }

// Point findBottomRight(Point Ps[]){
//     Point tl = findTopLeft(Ps);

//     Point ret = Ps[0];
//     for(int i=1; i<4; i++)
//         if(Ps[i].x + Ps[i].y > ret.x + ret.y)
//             ret = Ps[i];

//     return ret;
// }

// Point findBottomLeft(Point Ps[]){
//     Point ret = Ps[0];
//     for(int i=1; i<4; i++)
//         if(Ps[i].x > ret.x && Ps[i].y < ret.y)
//             ret = Ps[i];

//     return ret;
// }

// void orderFourPoints(Point Ps[]){
//     Ps[0] = findTopLeft(Ps), Ps[1] = findTopRight(Ps), Ps[2] = findBottomRight(Ps), Ps[3] = findBottomLeft(Ps);
// }


map::Point lerp(map::Point p1, map::Point p2, float dt){
    int x =  p1.x + (p2.x-p1.x)*dt;
    int y =  p1.y + (p2.y-p1.y)*dt;

    return map::Point(x, y);
}



std::vector<std::pair<int, int>> outter_prod(int begin1, int end1, int begin2, int end2){
    std::vector<std::pair<int, int>> ret((end1 - begin1) * (end2 - begin2));

    for(int i = begin1; i < end1; i++){
        for(int j = begin2; j < end2; j++){
            ret.push_back(std::make_pair(i, j));
        }
    }

    return ret;
}