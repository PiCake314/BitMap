#pragma once

#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <cmath>
#include <cassert>
#include <variant>
// #include <type_traits>

#include "../Structs/Size.hpp"
#include "../Structs/RGB.hpp"
#include "../Structs/Point.hpp"
#include "../Structs/Complex.hpp"
#include "../Structs/Shapes.hpp"

#include "../Enums/Loadtype.hpp"
#include "../Enums/Fold.hpp"
#include "../Enums/Alignment.hpp"
#include "../Enums/RectAlignment.hpp"


#define OUTPUT_PATH "output/"
#define VIDEO_OUTPUT_PATH "output/vids/"
#define VIDEO_TEMP_PATH "output/vids/.temp/"

using Shape_t = std::variant<
    map::shapes::Line,
    map::shapes::Circle,
    map::shapes::Rect,
    map::shapes::Triangle,
    map::shapes::Ellipse
>;



namespace map{

    class Mapper{

        private:
            std::string m_Filename;
            std::ofstream m_File;
            Size m_Size;

            int m_FPS; // for video only

            std::string m_PType; // Meta Data
            int m_Max; // Meta Data
            clr::RGB *m_Map; // The canvas (2D array of RGB values)

            bool m_Set_state;

            int m_XCenter;
            int m_YCenter;

            void setInfo();

        public:
            // Mapper();
            Mapper(std::string = "output.ppm", int h = 100, int w = 100, Loadtype = Loadtype::reset);
            ~Mapper();

            void setFPS(int);

            int getFPS() const;

            void doSet();

            void noSet();

            void resetFile();

            void loadFile();

            void setState();

            void setFile(std::string);

            void fillWhite();

            void fillColor(clr::RGB = clr::RGB());

            void randomize();

            void randomizeGrey();

            clr::RGB getColorAt(Point = Point());

            void drawAt(Point = Point(), clr::RGB = clr::RGB());

            void drawLine(Point p1, Point p2, clr::RGB = clr::RGB(), int thickness = 0);

            void drawTri(Point p1, Point p2, Point p3, clr::RGB = clr::RGB(), int thickness = 0);

            void drawFourPoints(Point[], clr::RGB = clr::RGB(), bool thick = false);

            void drawMulti(std::vector<Point>, clr::RGB = clr::RGB(), bool thick = false);


            /**
             * @param height/width: negative values will result in them being 10% of the height.
             */
            void drawRect(Point center, float height = -1, float width = -1, clr::RGB  = clr::RGB(), bool filled = true, bool thick = false, RectAlignment alignment = RectAlignment::Rnone);


            /**
             * @param r: negative values will result in them being 10% of the height.
             * @param alignment: sets the alignment of the shape.
             */
            void drawCircle(Point center, int r = -1, clr::RGB = clr::RGB(), bool filled = true, bool inverted = false, int thickness = 2, Alignment alignment = Alignment::none);


           /**
            * @param r1/r2: negative values will result in them being 10% of the height.
            */
            void drawEllipse(Point center, int r1 = -1, int r2 = -1, clr::RGB = clr::RGB(), bool filled = true, bool inverted = false, int thickness = 1, Alignment alignment = Alignment::none);

            
            // template <class T>
            // requires std::is_base_of<Shape, T>::value
            void draw(Shape_t shape);


            /**
             * @brief Creates a bezian curve that goes from p1 to p3 curved by p2.
             */
            void bezierQuadCurve(Point p1, Point p2, Point p3, float = 0.1, clr::RGB = clr::RGB(), bool thick = false);


            /**
             * @brief Creates a bezian curve from a vector of points
             */
            void bezierCurve(std::vector<Point>, float = 0.1, clr::RGB = clr::RGB(), bool thick = false);


            void plot(int(*)(int), clr::RGB = clr::RGB(), bool thick = false);


            void plotXY(double(*func)(double, double), double(*result)(double, double), clr::RGB = clr::RGB());
            
            
            void plotIfTrue(bool (*)(int, int), clr::RGB = clr::RGB());


            /**
             * @brief Folds the canvas on itself (i.e. Copys the top half to the bottom half with t2b)
             * 
             * @param Fold: use one of the provided constants (l2r, r2l, t2b, b2t)
             * ! Deprecated
             */
            void fold(Fold);


            void rotate(float);


            void move(Shape_t, Point);



            // ----------------------- Video Related Functions -----------------------

            void saveFrame(int frame) const;

            void render(const std::string &output_file = "out.mp4") const;

            void clearFrames() const;

    };

}

