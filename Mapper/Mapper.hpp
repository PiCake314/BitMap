#pragma once

#include <iostream>
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

    RGB(){
        red = 0;
        green = 0;
        blue = 0;
    }

    RGB(int r, int g, int b){
        red =r;
        green = g;
        blue = b;
    }

    std::string Pixel(){
        std::stringstream s;
        s << red << " " << green << " " << blue;
        return s.str();
    }
};

class Mapper{
    private:
        std::string filename;
        std::string pType;
        size s;
        int max;
        RGB *map;


    public:
        // Mapper();
        Mapper(std::string = "output.ppm", std::string = "P3", int = 100, int = 100, int = 255, std::string = "reset");
        // ~Mapper();

        void resetFile();

        void loadFile();

        void fillWhite();

        void fillColor(int, int, int);

        void randomize();

        void randomizeGrey();

        void drawRect(std::string alignment = "none", RGB color = RGB(255, 255, 255), int top = 0, int left = 0, int height = 10, int width = 10);

        void drawCircle(std::string alignment = "none", RGB color = RGB(255, 255, 255), int top = 0, int left = 0, int r = 10);
        
        void setInfo();
        void setState();

};