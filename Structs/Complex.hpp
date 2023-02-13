#include <iostream>
#include <cmath>

struct Complex{
    int R;
    int I;

    Complex() : R(0), I(0) {}
    Complex(int r, int i) : R(r), I(i) {};

    Complex operator+(const Complex &other){
        return Complex(R + other.R, I + other. I);
    }

    void operator+=(int r){
        R += r;
    }

    // Complex operator -(const Complex &other);

    Complex operator*(const Complex &other){
        return Complex(R*other.R - I*other.I, I*other.R + R*other.I);
    }

    Complex operator/(int d){
        return Complex(R/d, I/d);
    }

    int mag(){
        return sqrt(R*R + I*I);
    }
};