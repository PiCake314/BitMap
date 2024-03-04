#pragma once

#include <iostream>
#include <string>
#include <vector>
#include <deque>
#include <fstream>
#include <cmath>
#include <cassert>
#include <variant>
#include <optional>
#include <string_view>
#include <string>
#include <cstring>
#include <memory>
#include <mutex>
#include <concepts>

#include "../Structs/Size.hpp"
#include "../Structs/RGB.hpp"
#include "../Structs/Point.hpp"
#include "../Structs/Complex.hpp"
#include "../Structs/Shapes/Shapes.hpp"
#include "../Structs/Font.hpp"

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


#define DEFUALT_FONT "Default"

#define DEGREES /180. * M_PI

namespace map{

    // Forward declaration
    namespace shapes{
        struct Shape;
        using ShapePtr = std::unique_ptr<Shape>;
    }
    

    class Mapper{

        private:
            const std::string m_Filename;
            const std::string m_Filename_vid;
            Size m_Size;
            
            // for video only
            const int m_FPS;
            const double m_Delta;
            int m_Current_frame;

            std::vector<fnt::Font> m_Fonts;

            // Meta Data
            std::string_view m_PType;
            int m_Max;
            /* volatile */ clr::RGB *m_Map = nullptr; // The canvas (2D array of RGB values)

            bool m_Set_state;

            [[maybe_unused]] int m_XCenter;
            [[maybe_unused]] int m_YCenter;

            // for multithreading
            const int m_Root_pix_per_lock;
            std::deque<std::deque<std::mutex>> m_Locks;

            void setInfo();
            
            void resetFile();

            void loadFile();

        public:
            // Mapper();
            Mapper(std::string_view, Size, Loadtype = Loadtype::reset);
            Mapper(std::string_view, Size, int fps, Loadtype = Loadtype::reset);
            // Mapper(Mapper &&);

            ~Mapper();

            void loadFont(std::string_view = DEFUALT_FONT);

            // void setFPS(int);

            int getFPS() const;

            void doSet();

            void noSet();


            /**
             * @brief copies the internal array to the output file.
            */
            void setState();

            void setFile(std::string);

            Size getSize() const;

            [[deprecated]]
            void fillWhite();

            void fill(clr::RGB = clr::WHITE);

            void randomize();

            void randomizeGrey();

            [[deprecated]]
            clr::RGB getColorAt(Point);

            [[deprecated]]
            void drawAt(Point, clr::RGB);

            void drawLine(Point p1, Point p2, clr::RGB = clr::RGB(), int thickness = 0);

            void drawTri(Point p1, Point p2, Point p3, clr::RGB = clr::RGB(), int thickness = 0);

            void drawFourPoints(Point[], clr::RGB = clr::RGB(), bool thick = false);

            void drawPolygon(const std::vector<Point>&, clr::RGB = clr::RGB(), bool filled = false, int thick = 1);


            /**
             * @param height/width: negative values will result in them being 10% of the height.
             */
            void drawRect(Point center, float height = -1, float width = -1, clr::RGB  = clr::RGB(), bool filled = true, bool thick = false, RectAlignment alignment = RectAlignment::none);


            /**
             * @param r: negative values will result in them being 10% of the height.
             * @param alignment: sets the alignment of the shape.
             */
            void drawCircle(Point center, int r = -1, clr::RGB = clr::RGB(), bool filled = true, bool inverted = false, int thickness = 2, Alignment alignment = Alignment::none);


           /**
            * @param r1/r2: negative values will result in them being 10% of the height.
            */
            void drawEllipse(Point center, int r1 = -1, int r2 = -1, clr::RGB = clr::RGB(), bool filled = true, bool inverted = false, int thickness = 1, Alignment alignment = Alignment::none);


            /**
             * @param font: the name of the font to use. (passing "" will use the default font)
            */
            void drawText(std::string_view, Point, std::string font = "Default", Alignment = Alignment::none);

            
            template <bool locked = false>
            void draw(const shapes::ShapePtr shape);

            // template<template<typename> typename FR, typename T>
            // requires std::ranges::forward_range<FR<T>> &&
            // std::same_as<std::ranges::range_value_t<FR<T>>, shapes::Shape*>
            void draw(std::vector<shapes::ShapePtr> &shapes, const int num_threads = 2);


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

            // void animate(map::shapes::ShapePtr (*)(const double), float seconds);

            void animate(map::shapes::ShapePtr (*)(const int, const int, const double), float seconds);

            // void animate(map::shapes::ShapePtr (*)(const int, const int), float seconds);


            void animate(std::vector<map::shapes::ShapePtr> (*)(const int, const int, const double), float seconds);


            // ----------------------- Video Related Functions -----------------------

            // private:
            void saveFrame();
            
            public:
            void render(const std::string& output_file = "out.mp4") const;

            void clearFrames() const;

            // ----------------------- Operators -----------------------

            clr::RGB &operator[](const Point&);
            
            map::clr::RGB &at(const Point&);

            clr::RGB &operator[](int);

            map::clr::RGB &at(int i);

            clr::RGB *begin();

            clr::RGB *end();


            // ----------------------- Private funcs -----------------------
        private:
            bool safePoint(map::Point p){
                return p.x >= 0 && p.x < m_Size.width && p.y >= 0 && p.y < m_Size.height;
            }

    };

}