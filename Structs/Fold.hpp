#include <iostream>

struct Fold{
    std::string f;

    Fold(const char s[]) : f(s) {}

    bool operator == (Fold s){
        return f == s.f;
    }
};