#pragma once

#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <stdio.h>
#include <time.h>

#include "../Structs/Size.hpp"
#include "../Structs/RGB.hpp"
#include "../Structs/Point.hpp"
#include "../Structs/Fold.hpp"


namespace map{

    /* Copy the right side to left side.*/
    const Fold r2l = "right";

    /* Copy the left side to right side.*/
    const Fold l2r = "left";

    /* Copy the top side to bottom side.*/
    const Fold t2b = "top";

    /* Copy the bottom side to top side.*/
    const Fold b2t = "bottom";


    class Mapper{
        private:
            std::string m_filename;
            std::string m_pType;
            size m_size;
            int m_max;
            clr::RGB *m_map;
            bool m_set_state;

            void setInfo();

        public:
            // Mapper();
            Mapper(std::string = "output.ppm", std::string = "P3", int h = 100, int w = 100, int m = 255, std::string = "reset");
            ~Mapper();

            void isSet(bool);

            bool getIsSet();

            void resetFile();

            void loadFile();

            void fillWhite();

            void fillColor(clr::RGB = clr::RGB());

            void randomize();

            void randomizeGrey();

            clr::RGB getColorAt(Point = Point());

            void drawAt(Point = Point(), clr::RGB = clr::RGB());

            void drawLine(Point p1 = Point(), Point p2 = Point(), clr::RGB = clr::RGB(), bool thick = false);

            void drawTri(Point p1 = Point(), Point p2 = Point(), Point p3 = Point(), clr::RGB = clr::RGB(), bool thick = false);

            void drawFourPoints(Point[], clr::RGB = clr::RGB(), bool thick = false);

            void drawMulti(std::vector<Point>, clr::RGB = clr::RGB(), bool thick = false);


            /*
                height/width: negative values will result in them being 10% of the height.
            */
            void drawRect(float top = 0, float left = 0, float height = -1, float width = -1, clr::RGB  = clr::RGB(), std::string alignment = "none");

            /*
                r: negative values will result in them being 10% of the height.
            */
            void drawCircle(int top = 0, int left = 0, int r = -1, clr::RGB = clr::RGB(), bool filled = true, bool inverted = false, std::string alignment = "none");


            /*
                r1/r2: negative values will result in them being 10% of the height.
            */
            void drawEllipse(int top = 0, int left = 0, int r1 = -1, int r2 = -1, clr::RGB = clr::RGB(), bool filled = true, bool inverted = false, std::string alignment = "none");


            void bezierQuadCurve(Point, Point, Point, float = 0.1, clr::RGB = clr::RGB(), bool thick = false);


            // void bezierCubicCurve(Point[], float = 0.1, clr::RGB = clr::RGB(), bool thick = false);


            void bezierMultiCurve(std::vector<Point>, float = 0.1, clr::RGB = clr::RGB(), bool thick = false);


            void fold(Fold);


            void setState();
    };
    
}