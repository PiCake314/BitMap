#pragma once

#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <cmath>
#include <cassert>

#include "../Structs/Size.hpp"
#include "../Structs/RGB.hpp"
#include "../Structs/Point.hpp"
#include "../Structs/Fold.hpp"


namespace map{
        enum Fold{
            r2l = 0,
            l2r,
            t2b,
            b2t
        };

        enum Alignment{
            none = -1,
            center = 0,
            top,
            bottom,
            left,
            right
        };

        enum RectAlignment{
            none = -1,
            center = 0,
            top,
            bottom,
            left,
            right,

            top_left = 5,
            top_right,
            bottom_left,
            bottom_right,
            width,
            height
        };

        enum Type{
            reset = 0,
            load = 1
        };


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
            Mapper(std::string = "output.ppm", int h = 100, int w = 100, Type = Type::reset);
            ~Mapper();

            void doSet();

            void noSet();

            void resetFile();

            void loadFile();

            void fillWhite();

            void fillColor(clr::RGB = clr::RGB());

            void randomize();

            void randomizeGrey();

            clr::RGB getColorAt(Point = Point());

            void drawAt(Point = Point(), clr::RGB = clr::RGB());

            void drawLine(Point p1, Point p2, clr::RGB = clr::RGB(), bool thick = false);

            void drawTri(Point p1, Point p2, Point p3, clr::RGB = clr::RGB(), bool thick = false);

            void drawFourPoints(Point[], clr::RGB = clr::RGB(), bool thick = false);

            void drawMulti(std::vector<Point>, clr::RGB = clr::RGB(), bool thick = false);


            /**
             * @param height/width: negative values will result in them being 10% of the height.
             */
            void drawRect(Point = Point(), float height = -1, float width = -1, clr::RGB  = clr::RGB(), bool filled = true, bool thick = false, RectAlignment alignment = RectAlignment::none);


            /**
             * @param r: negative values will result in them being 10% of the height.
             * @param alignment: sets the alignment of the shape.
             */
            void drawCircle(Point = Point(), int r = -1, clr::RGB = clr::RGB(), bool filled = true, bool inverted = false, int thickness = 2, Alignment alignment = Alignment::none);


           /**
            * @param r1/r2: negative values will result in them being 10% of the height.
            */
            void drawEllipse(int top = 0, int left = 0, int r1 = -1, int r2 = -1, clr::RGB = clr::RGB(), bool filled = true, bool inverted = false, Alignment alignment = Alignment::none);


            /**
             * @brief Creates a bezian curve that goes from p1 to p3 curved by p2.
             */
            void bezierQuadCurve(Point p1, Point p2, Point p3, float = 0.1, clr::RGB = clr::RGB(), bool thick = false);


            /**
             * @brief Creates a bezian curve from a vector of points
             */
            void bezierMultiCurve(std::vector<Point>, float = 0.1, clr::RGB = clr::RGB(), bool thick = false);


            /**
             * @brief Folds the canvas on itself (i.e. Copys the top half to the bottom half with t2b)
             * 
             * @param Fold: use one of the provided constants (l2r, r2l, t2b, b2t)
             */
            void fold(Fold);

            /*
                Distance between 2 points!
            */
            int dist(Point, Point);


            void setState();
    };

}