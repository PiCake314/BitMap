#pragma once
#include <fstream>
#include <vector>
#include <string>
#include <string_view>
#include <cassert>
#include <memory>
#include <utility>

#include "RGB.hpp"
#include "Size.hpp"

#define FONT_PATH "fonts/"

namespace map::fnt{
    enum class Alphabet{
        SPACE = 32, Exclamation, Quotation, Hash, Dollar, Percent, Ampersand, Apostrophe, LeftParenthesis, RightParenthesis,
        Asterisk, Plus, Comma, Minus, Period, Slash, Zero, One, Two, Three, Four, Five, Six, Seven, Eight, Nine,
        Colon, Semicolon, LessThan, Equal, GreaterThan, Question, At,
        A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z,
        LeftBracket, Backslash, RightBracket, Caret, Underscore, Backtick,
        a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p ,q, r, s, t, u, v, w, x, y, z,
        LeftBrace, Pipe, RightBrace, Tilde
    };

    // const int ALPHABET_SIZE = Alphabet::Tilde - Alphabet::SPACE + 1;


    struct Letter{
        Alphabet ID{};
        int xoffset{}, yoffset{}, xadvance{};
        size_t width{}, height{};

        map::clr::RGB *buffer = nullptr;


        explicit operator char() const{
            return static_cast<char>(ID);
        }

        // ~Letter(){
        //     // if(buffer)
        //     //     delete[] buffer;
        // }
    };


    class Font{
        const std::string m_Fontname;
        std::vector<fnt::Letter> m_Letters;
        size_t m_Fontsize{};
        bool m_Bold = false;
        bool m_Italic = false;
        Size m_Spacing = {0, 0};
        clr::RGB m_Transparent_color = clr::BLACK;

        public:
        Font(std::string_view fontname)
        : m_Fontname{fontname}, m_FNT_Filename{m_Fontname + ".fnt"}, m_PPM_Filename{m_Fontname + ".ppm"}
        {
            assert(m_FNT_Filename.substr(m_FNT_Filename.length() - 4) == ".fnt");
            assert(m_PPM_Filename.substr(m_PPM_Filename.length() - 4) == ".ppm");

            loadinfo();
            auto image_buffer = loadimage();
            loadlettersinfoFrom(std::move(image_buffer));
        }

        [[nodiscard]] std::string_view getFontname() const noexcept {
            return m_Fontname;
        }

        [[nodiscard]] size_t getFontSize() const noexcept {
            return m_Fontsize;
        }

        [[nodiscard]] bool isBold() const noexcept {
            return m_Bold;
        }

        [[nodiscard]] bool isItalic() const noexcept {
            return m_Italic;
        }

        [[nodiscard]] Size getSpacing() const noexcept {
            return m_Spacing;
        }

        [[nodiscard]] const clr::RGB &getTransparentColor() const noexcept {
            return m_Transparent_color;
        }

        [[nodiscard]] size_t size() const noexcept {
            return m_Letters.size();
        }

        [[nodiscard]] const Letter &operator [](Alphabet ID) const noexcept {
            return m_Letters[static_cast<size_t>(ID) - static_cast<size_t>(Alphabet::SPACE)];
        }
        [[nodiscard]] Letter &operator [](Alphabet ID) noexcept {
            return m_Letters[static_cast<size_t>(ID) - static_cast<size_t>(Alphabet::SPACE)];
        }


        [[nodiscard]] const Letter &operator [](char c) const noexcept {
            return m_Letters[static_cast<size_t>(c) - static_cast<size_t>(Alphabet::SPACE)];
        }
        [[nodiscard]] Letter &operator [](char c) noexcept {
            return m_Letters[static_cast<size_t>(c) - static_cast<size_t>(Alphabet::SPACE)];
        }


        [[nodiscard]] const Letter &operator [](size_t index) const noexcept {
            return m_Letters[index];
        }
        [[nodiscard]] Letter &operator [](size_t index) noexcept {
            return m_Letters[index];
        }


        private:
        const std::string m_FNT_Filename;
        const std::string m_PPM_Filename;

        size_t m_Num_letters{};

        map::Size m_Image_size;
        // map::clr::RGB *m_Image_buffer = nullptr;


        void loadinfo(){
            std::ifstream file{FONT_PATH + m_FNT_Filename};
            // if(!file.is_open()) // this is not needed haha
            assert(file.is_open());

            std::string line;
            std::string w;
            std::string h;
            std::string num_letters;

            std::getline(file, line);

            size_t size_ind = line.find("size=");
            assert(size_ind != std::string::npos);
            std::string size_str = line.substr(size_ind + 5);
            m_Fontsize = std::stoul(size_str.substr(0, size_str.find(" ")));


            size_t bold_ind = line.find("bold=");
            assert(bold_ind != std::string::npos);
            std::string bold_str = line.substr(bold_ind + 5);
            m_Bold = bold_str.at(0) == '1';


            size_t italic_ind = line.find("italic=");
            assert(italic_ind != std::string::npos);
            std::string italic_str = line.substr(italic_ind + 7);
            m_Italic = italic_str.at(0) == '1';


            size_t spacing_ind = line.find("spacing=");
            assert(spacing_ind != std::string::npos);
            std::string spacing_str = line.substr(spacing_ind + 8);
            m_Spacing.width = std::stoul(spacing_str.substr(0, spacing_str.find(",")));
            m_Spacing.height = std::stoul(spacing_str.substr(spacing_str.find(",") + 1));


            file >> line >> line >> line >> w >> h;
            std::getline(file, line);
            std::getline(file, line);
            file >> line >> num_letters;

            m_Num_letters = std::stoul(num_letters.substr(6));

            m_Image_size = {std::stoul(w.substr(7)), std::stoul(h.substr(7))};
            // m_Image_buffer = new map::clr::RGB[m_Image_size.width * m_Image_size.height];

            // file.close(); // not needed. RAII takes care of it.
        }


        std::unique_ptr<clr::RGB> loadimage(){
            std::ifstream file{FONT_PATH + m_PPM_Filename};
            assert(file.is_open());

            std::string line;
            std::getline(file, line);
            std::getline(file, line);
            std::getline(file, line);

            std::unique_ptr<clr::RGB> image_buffer{new clr::RGB[m_Image_size.width * m_Image_size.height]};
            auto buffer = image_buffer.get();

            for(size_t i = 0; i < m_Image_size.height; i++){
                for(size_t j = 0; j < m_Image_size.width; j++){
                    int r, g, b;
                    file >> r >> g >> b;

                    buffer[i*m_Image_size.width + j] = {r, g, b};
                }
            }

            // file.close(); // not needed. RAII takes care of it.
            return image_buffer;
        }


        void loadlettersinfoFrom(const std::unique_ptr<map::clr::RGB> image_buffer){
            std::ifstream file{FONT_PATH + m_FNT_Filename};
            assert(file.is_open());

            m_Letters.reserve(m_Num_letters);

            std::string line;
            std::getline(file, line);
            std::getline(file, line);
            std::getline(file, line);
            std::getline(file, line);

            map::clr::RGB* buffer = image_buffer.get();

            for(size_t index = 0; index < m_Num_letters && !file.eof(); ++index){
                file >> line;

                if(line == "char"){
                    size_t id, x, y, width, height;
                    int xoffset, yoffset, xadvance;

                    file >> line;
                    id = std::stoul(line.substr(3));
                    file >> line;
                    x = std::stoul(line.substr(2));
                    file >> line;
                    y = std::stoul(line.substr(2));
                    file >> line;
                    width = std::stoul(line.substr(6));
                    file >> line;
                    height = std::stoul(line.substr(7));
                    file >> line;
                    xoffset = std::stoi(line.substr(8));
                    file >> line;
                    yoffset = std::stoi(line.substr(8));
                    file >> line;
                    xadvance = std::stoi(line.substr(9));

                    std::getline(file, line);

                    m_Letters.push_back({});
                    m_Letters[index].ID = static_cast<Alphabet>(id);
                    m_Letters[index].width = width;
                    m_Letters[index].height = height;
                    m_Letters[index].xoffset = xoffset;
                    m_Letters[index].yoffset = yoffset;
                    m_Letters[index].xadvance = xadvance;

                    m_Letters[index].buffer = new map::clr::RGB[width * height];

                    for(size_t i = 0; i < height; ++i){
                        for(size_t j = 0; j < width; ++j){
                            m_Letters[index].buffer[i*width + j] = buffer[(y + i)* m_Image_size.width + (x + j)];
                        }
                    }
                }
            }
        }
    };
}
