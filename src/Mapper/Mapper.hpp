#pragma once

#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <cmath>
#include <cassert>
#include <variant>
#include <string_view>

#include "../Structs/Size.hpp"
#include "../Structs/RGB.hpp"
#include "../Structs/Point.hpp"
#include "../Structs/Complex.hpp"
// #include "../Structs/Shapes/Shapes.hpp"

#include "../Enums/Loadtype.hpp"
#include "../Enums/Fold.hpp"
#include "../Enums/Alignment.hpp"
#include "../Enums/RectAlignment.hpp"


#define OUTPUT_PATH "output/ppms/"
#define VIDEO_OUTPUT_PATH "output/vids/"
#define VIDEO_TEMP_PATH "output/vids/.temp/"
#define MANGLED "__out__"
#define MANGLED_PPM MANGLED ".ppm"
#define MANGLED_PNG(frame) MANGLED + std::to_string(frame) + ".png"


#define DEGREES * M_ PI / 180

namespace map{

    // Forward declaration
    namespace shapes{
        struct Shape;
        using ShapePtr = std::unique_ptr<Shape>;
    }
    

    class Mapper{

        private:
            std::string m_Filename;
            std::string m_Filename_vid;
            Size m_Size;

            int m_FPS; // for video only
            int m_Current_frame; // for video only

            std::string m_PType; // Meta Data
            int m_Max; // Meta Data
            clr::RGB *m_Map; // The canvas (2D array of RGB values)

            bool m_Set_state;

            [[maybe_unused]] int m_XCenter;
            [[maybe_unused]] int m_YCenter;

            void setInfo();
            
            void resetFile();

            void loadFile();

        public:
            // Mapper();
            Mapper(std::string, Size, Loadtype = Loadtype::reset);
            Mapper(std::string, Size, int fps, Loadtype = Loadtype::reset);
            // Mapper(Mapper &&);

            ~Mapper();

            void setFPS(int);

            int getFPS() const;

            void doSet();

            void noSet();

            void setState();

            void setFile(std::string);

            Size getSize() const;

            [[deprecated]]
            void fillWhite();

            void fill(clr::RGB = clr::WHITE);

            void randomize();

            void randomizeGrey();

            [[deprecated]]
            clr::RGB getColorAt(Point = Point());

            [[deprecated]]
            void drawAt(Point, clr::RGB);

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

            
            void draw(map::shapes::Shape *shape);


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
             */
            [[deprecated]]
            void fold(Fold);


            /**
             * @brief Rotates the canvas by the given angle. (in radians)
            */
            void rotate(float);



            void animate(map::shapes::Shape *(*)(int, const int), float seconds);



            // ----------------------- Video Related Functions -----------------------

            private:
            void saveFrame();
            
            public:
            void render(const std::string &output_file = "out.mp4") const;

            void clearFrames() const;


            // ----------------------- Operators -----------------------

            clr::RGB &operator[](Point);

            clr::RGB &operator[](int);

            clr::RGB *begin();

            clr::RGB *end();

    };

}

#include "../Structs/Shapes/Shapes.hpp"