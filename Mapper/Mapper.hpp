#pragma once

#include <iostream>
#include <vector>
#include <sstream>
#include <fstream>
#include <stdio.h>
#include <time.h>


struct size{
    int height;
    int width;
};

struct RGB{
    int red;
    int green;
    int blue;

    RGB():
    red(0),
    green(0),
    blue(0){}


    RGB(int v):
    red(v),
    green(v),
    blue(v){}

    RGB(int r, int g, int b){
        red = r;
        green = g;
        blue = b;
    }

    std::string Pixel(){
        std::stringstream s;
        s << red << " " << green << " " << blue;
        return s.str();
    }
};


struct Point{
    float x;
    float y;

    Point() : x(0), y(0) {}
    Point(float x_, float y_) : x(x_), y(y_) {};

};

class Mapper{
    private:
        std::string m_filename;
        std::string m_pType;
        size m_s;
        int m_max;
        RGB *m_map;


    public:
        // Mapper();
        Mapper(std::string = "output.ppm", std::string = "P3", int h = 100, int w = 100, int m = 255, std::string = "reset");
        ~Mapper();

        void resetFile();

        void loadFile();

        void fillWhite();

        void fillColor(RGB = RGB());

        void randomize();

        void randomizeGrey();

        void drawLine(Point p1 = Point(), Point p2 = Point(), RGB = RGB(), bool thick = false);

        void drawTri(Point p1 = Point(), Point p2 = Point(), Point p3 = Point(), RGB = RGB(), bool thick = false);

        void drawFourPoints(Point[], RGB = RGB(), bool thick = false);

        void drawMulti(std::vector<Point>, RGB = RGB(), bool thick = false);

        void drawRect(float top = 0, float left = 0, float height = -1, float width = -1, RGB  = RGB(), std::string alignment = "none");

        void drawCircle(int top = 0, int left = 0, int r = -1, RGB = RGB(), bool filled = true, bool inverted = false, std::string alignment = "none");

        void drawEllipse(int top = 0, int left = 0, int r1 = -1, int r2 = -1, RGB = RGB(), bool filled = true, bool inverted = false, std::string alignment = "none");
        
        void setInfo();
        void setState();

};