#pragma once

#include <iostream>
#include <string>
#include <vector>
#include <deque>
#include <set>
#include <fstream>
#include <cmath>
#include <cassert>
#include <string_view>
#include <string>
#include <cstring>
#include <memory>
#include <mutex>
#include <concepts>
#include <utility>
#include <filesystem>
#include <chrono>
#include <numbers>

#include <unistd.h>

#include "../Structs/Renderables/Renderables.hpp"
#include "../Structs/Renderables/Shapes/Shapes.hpp"
#include "../Structs/RGB.hpp"
#include "../Structs/Point.hpp"
#include "../Structs/Font.hpp"
#include "../Structs/ImageBuffer.hpp"
#include "../Enums/Alignment.hpp"
#include "../Utility/Size.hpp"
#include "../Utility/UDLs.hpp"
#include "../Config/Config.hpp"
#include "../Config/DIRs.hpp"


#include "../Structs/Renderables/Audio.hpp"
#include "../Structs/Renderables/Text.hpp"
#include "../Structs/Renderables/Image.hpp"
#include "../Structs/Renderables/Latex.hpp"



namespace map{

    constexpr const char* DEFAULT_FONT = "Default";

    // Forward declaration
    namespace renderables{
        struct Renderable;
        using RenderablePtr = std::unique_ptr<Renderable>;
        using Renderables   = std::vector<RenderablePtr>;

        struct Audio;
        // struct Image;
    }


    class Mapper{

        private:
            const std::filesystem::path m_Filename;
            const std::filesystem::path m_Filename_vid;
            Size m_Size;

            // for video only
            const size_t m_FPS;
            const double m_Delta;
            size_t m_Current_frame;

            std::vector<fnt::Font> m_Fonts;

            // friend struct renderables::Image;
            std::vector<ImageBuffer> m_Images;

            friend struct renderables::Audio;
            using Frame = size_t;
            std::vector<std::pair<renderables::Audio, Frame>> m_Sounds;

            // Meta Data
            std::string_view m_PType;
            size_t m_Max;
            /* volatile */ clr::RGB *m_Map = nullptr; // The canvas (2D array of RGB values)

            bool m_Set_state;

            struct { size_t x{}, y{};} m_Center;

            // for multithreading
            const size_t m_Root_pix_per_lock;
            std::deque<std::deque<std::mutex>> m_Locks;

            void setInfo();

            void resetFile();

            // void loadFile();

            ssize_t adjustX(ssize_t x) const noexcept {
                return x - m_Center.x;
            }

            ssize_t adjustY(ssize_t y) const noexcept {
                return y + m_Center.y;
            }


        public:
            // Mapper();
            Mapper(std::filesystem::path, Size);
            Mapper(std::filesystem::path, Size, size_t fps);

            Mapper(Mapper &&) = delete;
            Mapper(const Mapper &) = delete;
            Mapper &operator=(Mapper &&) = delete;
            Mapper &operator=(const Mapper &) = delete;

            ~Mapper();

            void loadFont(const std::string_view = DEFAULT_FONT);

            std::ptrdiff_t loadImage(const std::filesystem::path&, double scale = 1);

            // void setFPS(int);

            size_t getFPS() const noexcept;

            void doSet();

            void noSet();


            /**
             * @brief copies the internal array to the output file.
            */
            void setState();

            // void setFile(std::string);

            auto getCenter() const noexcept { return m_Center; }

            void setCenter(decltype(m_Center) center) noexcept { m_Center = center; }

            Size getSize() const noexcept;

            [[deprecated]]
            void fillWhite();

            void fill(clr::RGB = clr::WHITE);

            template <bool grey_scale>
            void randomize() noexcept;

            [[deprecated]]
            void randomizeGrey();

            [[deprecated]]
            clr::RGB getColorAt(const Point&);

            [[deprecated]]
            void drawAt(const Point&, clr::RGB);

            template <bool called_from_shape_class = false>
            void drawLine(const Point &p1, const Point &p2, clr::RGB = clr::RGB{}, int thickness = 0);

            template <bool called_from_shape_class = false>
            void drawTri(const Point &p1, const Point &p2, const Point &p3, clr::RGB = clr::RGB{}, int thickness = 0);

            [[deprecated]]
            void drawFourPoints(Point[], clr::RGB = clr::RGB{}, bool thick = false);

            template <bool called_from_shape_class = false>
            void drawPolygon(const std::vector<Point>&, clr::RGB = clr::RGB{}, bool filled = false, int thick = 1);


            /**
             * @param height: negative values will result in them being 10% of the height.
             * @param width: negative values will result in them being 10% of the height.
             */
            template <bool called_from_shape_class = false>
            void drawRect(double height, double width, Point center, clr::RGB  = clr::RGB{}, bool filled = true, bool thick = false, Alignment alignment = Alignment::none);


            /**
             * @param r: negative values will result in them being 10% of the height.
             */
            template <bool called_from_shape_class = false>
            void drawCircle(int r, Point center, clr::RGB = clr::RGB{}, bool filled = true, bool inverted = false, int thickness = 2, Alignment alignment = Alignment::none);


           /**
            * @param r1/r2: negative values will result in them being 10% of the height.
            */
            template <bool called_from_shape_class = false>
            void drawEllipse(const Point &center, int r1 = -1, int r2 = -1, clr::RGB = clr::RGB{}, bool filled = true, bool inverted = false, int thickness = 1, Alignment alignment = Alignment::none);


            /**
             * @param font: the name of the font to use. (passing "" will use the default font)
            */
            void drawText(const std::string_view, Point, const std::string_view font = "", const Alignment = Alignment::none);


            void drawImage(const std::filesystem::path&, Point, const double scale = 1, const Alignment = Alignment::none);


            /**
             * @param string_view: "frac{1}{2}" will be turned into 1/2. No need for any meta data.
            */
            void drawLatex(const std::string_view, Point, const double scale = 1, const Alignment = Alignment::none);


            void draw(renderables::Renderable&);


            template <bool locked = false>
            void draw(const renderables::RenderablePtr);


            void draw(renderables::Renderables &&shapes, const int num_threads = 1);


            /**
             * @brief Creates a bezian curve from a vector of points
             */
            void bezierCurve(std::vector<Point>, double = .1, clr::RGB = clr::RGB{}, bool thick = false);


            void plot(ssize_t(*)(size_t), clr::RGB = clr::RGB{}, size_t thickness = 2);


            void plot(double(*func)(double, double), double(*result)(double, double), clr::RGB = clr::RGB{});


            void plot(bool (*)(size_t, size_t), clr::RGB = clr::RGB{});


            void plot(std::invocable<size_t> auto func, clr::RGB color = clr::RGB{}, size_t thickness = 2) 
            requires std::same_as<decltype(func(size_t{})), ssize_t>
            {
                for (size_t j = 0; j < m_Size.width; ++j){
                    const auto value = func(j);
                    const double half_thickness = thickness/2.;

                    for(size_t y = std::max<size_t>(value - half_thickness, 0); y < std::min<size_t>(value + half_thickness, m_Size.height); ++y){
                        for(size_t x = std::max<size_t>(j - half_thickness, 0); x < std::min<size_t>(j + half_thickness, m_Size.width); ++x){
                            const Point original = {j, value};
                            const Point current = {x, y};

                            if(safePoint(current) and Point::distSqrd(original, current) <= std::pow(half_thickness, 2)){
                                m_Map[y*m_Size.width + x] = color;
                            }
                        }
                    }

                }

                if(m_Set_state) setState();
            }


            /**
             * @brief Rotates the canvas by the given angle. (in radians)
            */
            void rotate(double);

            // void animate(map::renderables::RenderablePtr (*)(const double), double seconds);

            /**
             * @brief Animates the canvas by calling the given function for each frame.
             * @param provider: a function that takes the current frame, the total number of frames and the time step and returns a shape.
             * @param seconds: the total time of the animation.
            */
            void animate(map::renderables::RenderablePtr (*)(const size_t, const size_t, const double), const std::chrono::duration<double>&);

            // void animate(map::renderables::RenderablePtr (*)(const int, const int), double seconds);

            /**
             * @brief Animates the canvas by calling the given function for each frame.
             * @param provider: a function that takes the current frame, the total number of frames and the time step and returns a vector of shapes.
             * @param seconds: the total time of the animation.
            */
            void animate(map::renderables::Renderables (*)(const size_t, const size_t, const double), const std::chrono::duration<double>&);

            /**
             * @brief A templated version of the animate function to allow for lambdas with captures.
            */
            void animate(std::invocable<const size_t, const size_t, const double> auto providor, const std::chrono::duration<double>& duration)
            requires (std::same_as<decltype(providor(size_t{}, size_t{}, double{})), renderables::RenderablePtr>
                   or std::same_as<decltype(providor(size_t{}, size_t{}, double{})), renderables::Renderables>)
            {
                assert(m_FPS > 0 && "FPS must be greater than 0!");

                std::filesystem::create_directories(map::dirs::TEMP);


                std::clog << "Beginning Scene:\n";
                const size_t frames = size_t(std::chrono::duration_cast<std::chrono::seconds>(duration).count() * m_FPS);

                std::vector<clr::RGB> temp{m_Map, m_Map + m_Size.width * m_Size.height};
                const size_t temp_size = temp.size() * sizeof(clr::RGB);

                for(size_t frame = 0; frame <= frames; frame++){
                    memcpy(m_Map, &temp[0], temp_size);

                    auto shape = providor(frame, frames, m_Delta);

                    draw(std::move(shape));

                    if(!m_Set_state) setState();
                    saveFrame();
                    std::clog << frame << '/' << frames << '\n';

                    // delete shape; // for non unique_ptr
                }
                // copy(temp, m_Map); // can be replaced with memcpy
                memcpy(m_Map, &temp[0], temp_size);

                std::clog << "Scene Ended!\n";
            }


            void wait(const std::chrono::duration<double>&) noexcept;


            // ----------------------- Video Related Functions -----------------------

            // private:
            void saveFrame();
            
            public:
            /**
             * @param output_file: keep as std::string to include extra functionality such as operator + and +=.
             */
            void render() const;

            void clearFrames() const;

            // ----------------------- Operators -----------------------

            clr::RGB& operator[](const Point&) noexcept;

            clr::RGB& operator[](size_t) noexcept;

            map::clr::RGB& at(const Point&);

            map::clr::RGB& at(size_t i);

            clr::RGB *begin() noexcept;

            clr::RGB *end() noexcept;

            const clr::RGB *cbegin() const noexcept;

            const clr::RGB *cend() const noexcept;


            // ----------------------- Private funcs -----------------------
        private:
            bool safePoint(const map::Point& p){
                return p.x >= 0 && p.x < m_Size.width && p.y >= 0 && p.y < m_Size.height;
            }



            inline constexpr static bool INIT_STATE = false;

            inline static std::filesystem::path pngMangledWithFrame(size_t frame) noexcept {
                return map::dirs::MANGLED.string() + std::to_string(frame) + ".png";
            }

    };

}
