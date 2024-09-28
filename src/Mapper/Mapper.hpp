#pragma once

#include <iostream>
#include <string>
#include <vector>
#include <deque>
#include <set>
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
#include <utility>

#include "../Structs/Size.hpp"
#include "../Structs/RGB.hpp"
#include "../Structs/Point.hpp"
#include "../Structs/Shapes/Shapes.hpp"
#include "../Structs/Font.hpp"

#include "../Enums/Loadtype.hpp"
#include "../Enums/Alignment.hpp"
#include "../Enums/RectAlignment.hpp"


#define PPM_OUTPUT_PATH "output/ppms/"
#define VIDEO_OUTPUT_PATH "output/vids/"
#define VIDEO_TEMP_PATH "output/vids/.temp/"

#define AUDIO_INPUT_PATH "sounds/"

#define MANGLED "__out__"
#define MANGLED_PPM MANGLED ".ppm"
#define MANGLED_PNG(frame) MANGLED + std::to_string(frame) + ".png"
#define MANGLED_MP4 MANGLED ".mp4"


#define DEFUALT_FONT "Default"

#define DEGREES /180. * M_PI

namespace map{

    // Forward declaration
    namespace shapes{
        struct Shape;
        using ShapePtr = std::unique_ptr<Shape>;
        using Shapes   = std::vector<ShapePtr>;

        struct Audio;
    }
    

    class Mapper{

        private:
            const std::string m_Filename;
            const std::string m_Filename_vid;
            Size m_Size;
            
            // for video only
            const size_t m_FPS;
            const double m_Delta;
            size_t m_Current_frame;

            std::vector<fnt::Font> m_Fonts;

            friend struct shapes::Audio;
            using Frame = size_t;
            std::vector<std::pair<shapes::Audio, Frame>> m_Sounds;

            // Meta Data
            std::string_view m_PType;
            size_t m_Max;
            /* volatile */ clr::RGB *m_Map = nullptr; // The canvas (2D array of RGB values)

            bool m_Set_state;

            [[maybe_unused]] size_t m_XCenter;
            [[maybe_unused]] size_t m_YCenter;

            // for multithreading
            const size_t m_Root_pix_per_lock;
            std::deque<std::deque<std::mutex>> m_Locks;

            void setInfo();
            
            void resetFile();

            void loadFile();

        public:
            // Mapper();
            Mapper(std::string_view, Size, Loadtype = Loadtype::reset);
            Mapper(std::string_view, Size, size_t fps, Loadtype = Loadtype::reset);

            Mapper(Mapper &&) = delete;
            Mapper(const Mapper &) = delete;
            Mapper &operator=(Mapper &&) = delete;
            Mapper &operator=(const Mapper &) = delete;

            ~Mapper();

            void loadFont(std::string_view = DEFUALT_FONT);

            // void setFPS(int);

            size_t getFPS() const;

            void doSet();

            void noSet();


            /**
             * @brief copies the internal array to the output file.
            */
            void setState();

            // void setFile(std::string);

            Size getSize() const;

            [[deprecated]]
            void fillWhite();

            void fill(clr::RGB = clr::WHITE);

            template <bool grey_scale>
            void randomize();

            [[deprecated]]
            void randomizeGrey();

            [[deprecated]]
            clr::RGB getColorAt(Point);

            [[deprecated]]
            void drawAt(Point, clr::RGB);

            template <bool called_from_shape_class = false>
            void drawLine(const Point &p1, const Point &p2, clr::RGB = clr::RGB(), int thickness = 0);

            template <bool called_from_shape_class = false>
            void drawTri(const Point &p1, const Point &p2, const Point &p3, clr::RGB = clr::RGB(), int thickness = 0);

            [[deprecated]]
            void drawFourPoints(Point[], clr::RGB = clr::RGB(), bool thick = false);

            template <bool called_from_shape_class = false>
            void drawPolygon(const std::vector<Point>&, clr::RGB = clr::RGB(), bool filled = false, int thick = 1);


            /**
             * @param height: negative values will result in them being 10% of the height.
             * @param width: negative values will result in them being 10% of the height.
             */
            template <bool called_from_shape_class = false>
            void drawRect(Point center, double height = -1, double width = -1, clr::RGB  = clr::RGB(), bool filled = true, bool thick = false, RectAlignment alignment = RectAlignment::none);


            /**
             * @param r: negative values will result in them being 10% of the height.
             */
            template <bool called_from_shape_class = false>
            void drawCircle(Point center, int r = -1, clr::RGB = clr::RGB(), bool filled = true, bool inverted = false, int thickness = 2, Alignment alignment = Alignment::none);


           /**
            * @param r1/r2: negative values will result in them being 10% of the height.
            */
            template <bool called_from_shape_class = false>
            void drawEllipse(const Point &center, int r1 = -1, int r2 = -1, clr::RGB = clr::RGB(), bool filled = true, bool inverted = false, int thickness = 1, Alignment alignment = Alignment::none);


            /**
             * @param font: the name of the font to use. (passing "" will use the default font)
            */
            void drawText(const std::string_view, const Point, const std::string_view font, const Alignment = Alignment::none);


            void draw(shapes::Shape*);

            template <bool locked = false>
            void draw(const shapes::ShapePtr);

            // template<template<typename> typename FR, typename T>
            // requires std::ranges::forward_range<FR<T>> &&
            // std::same_as<std::ranges::range_value_t<FR<T>>, shapes::Shape*>
            void draw(shapes::Shapes &&shapes, const int num_threads = 2);


            /**
             * @brief Creates a bezian curve from a vector of points
             */
            void bezierCurve(std::vector<Point>, double = .1, clr::RGB = clr::RGB(), bool thick = false);


            void plot(size_t(*)(size_t), clr::RGB = clr::RGB(), bool thick = false);


            void plot(double(*func)(double, double), double(*result)(double, double), clr::RGB = clr::RGB());


            void plot(bool (*)(size_t, size_t), clr::RGB = clr::RGB());


            /**
             * @brief Rotates the canvas by the given angle. (in radians)
            */
            void rotate(double);

            // void animate(map::shapes::ShapePtr (*)(const double), double seconds);

            /**
             * @brief Animates the canvas by calling the given function for each frame.
             * @param provider: a function that takes the current frame, the total number of frames and the time step and returns a shape.
             * @param seconds: the total time of the animation.
            */
            void animate(map::shapes::ShapePtr (*)(const int, const int, const double), double seconds);

            // void animate(map::shapes::ShapePtr (*)(const int, const int), double seconds);

            /**
             * @brief Animates the canvas by calling the given function for each frame.
             * @param provider: a function that takes the current frame, the total number of frames and the time step and returns a vector of shapes.
             * @param seconds: the total time of the animation.
            */
            void animate(map::shapes::Shapes (*)(const int, const int, const double), double seconds);


            // ----------------------- Video Related Functions -----------------------

            // private:
            void saveFrame();
            
            public:
            void render(const std::string& output_file = "out.mp4") const;

            void clearFrames() const;

            // ----------------------- Operators -----------------------

            clr::RGB &operator[](const Point&);
            
            map::clr::RGB &at(const Point&);

            clr::RGB &operator[](size_t);

            map::clr::RGB &at(size_t i);

            clr::RGB *begin();

            clr::RGB *end();


            // ----------------------- Private funcs -----------------------
        private:
            bool safePoint(const map::Point& p){
                return p.x >= 0 && p.x < m_Size.width && p.y >= 0 && p.y < m_Size.height;
            }

    };

}
