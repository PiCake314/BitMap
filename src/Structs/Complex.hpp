#pragma once

#include <iostream>
#include <cmath>

struct Complex{
    double R;
    double I;

    Complex() : R(0), I(0) {}
    Complex(double r, double i) : R(r), I(i) {};

    Complex operator+(Complex other){
        return Complex(R + other.R, I + other. I);
    }

    Complex operator*(Complex other){
        return Complex(R*other.R - I*other.I, I*other.R + R*other.I);
    }

    Complex operator/(int d){
        return Complex(R/d, I/d);
    }

    int mag(){
        return sqrt(R*R + I*I);
    }
};