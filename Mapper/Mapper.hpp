#pragma once

#include <iostream>
#include <fstream>
#include <stdio.h>
#include <time.h>


struct size{
    int height;
    int width;
};

class Mapper{
    private:
        std::string filename;
        std::fstream file;
        size s;

    public:
        // Mapper();
        Mapper(std::string = "output.ppm", int = 100, int = 100);
        ~Mapper();

        void fillWhite();

        void randomize();

        void randomizeGrey();

        void removePixel();

        void drawRect(int = 25, int = 25, int = 50, int = 50);

};