#pragma once
#include "fstream"
#include <vector>
#include "RGB.hpp"
#include "Size.hpp"

#define FONT_PATH "fonts/"

namespace map::fnt{
    enum Alphabet{
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
        int width{}, height{}, xoffset{}, yoffset{}, xadvance{};

        map::clr::RGB *buffer = nullptr;


        operator char() const{
            return static_cast<char>(ID);
        }

        ~Letter(){
            // if(buffer)
            //     delete[] buffer;
        }
    };


    class Font{
        const std::string m_Fontname;
        std::vector<fnt::Letter> m_Letters;
        int m_Fontsize{};
        bool m_Bold = false;
        bool m_Italic = false;
        Size m_Spacing = {0, 0};
        clr::RGB m_Transparent_color = clr::BLACK;

        public:
        Font(std::string_view fontname)
        : m_Fontname{fontname}, m_FNT_Filename{m_Fontname + ".fnt"}, m_PPM_Filename{m_Fontname + ".ppm"}
        {
            assert(m_FNT_Filename.substr(m_FNT_Filename.length()  - 4) == ".fnt");
            assert(m_PPM_Filename.substr(m_PPM_Filename.length() - 4) == ".ppm");

            loadinfo();
            loadimage();
            loadlettersinfo();
        }

        [[nodiscard]] const std::string& getFontname() const{
            return m_Fontname;
        }

        [[nodiscard]] int getFontSize() const{
            return m_Fontsize;
        }

        [[nodiscard]] bool isBold() const{
            return m_Bold;
        }

        [[nodiscard]] bool isItalic() const{
            return m_Italic;
        }

        [[nodiscard]] Size getSpacing() const{
            return m_Spacing;
        }

        [[nodiscard]] const clr::RGB& getTransparentColor() const{
            return m_Transparent_color;
        }

        [[nodiscard]] size_t size() const{
            return m_Letters.size();
        }

        [[nodiscard]] const Letter& operator [](Alphabet ID) const{
            return m_Letters[static_cast<int>(ID) - static_cast<int>(Alphabet::SPACE)];
        }

        [[nodiscard]] const Letter& operator [](char c) const{
            return m_Letters[static_cast<int>(c) - static_cast<int>(Alphabet::SPACE)];
        }

        [[nodiscard]] const Letter& operator [](int index) const{
            return m_Letters[index];
        }


        private:
        std::string m_FNT_Filename;
        std::string m_PPM_Filename;

        int m_Num_letters{};

        map::Size m_Image_size;
        map::clr::RGB *m_Image_buffer = nullptr;


        void loadinfo(){
            std::ifstream file{FONT_PATH + m_FNT_Filename};
            if(!file.is_open())
            assert(file.is_open());

            std::string line;
            std::string w;
            std::string h;
            std::string num_letters;

            std::getline(file, line);

            size_t size_ind = line.find("size=");
            assert(size_ind != std::string::npos);
            std::string size_str = line.substr(size_ind + 5);
            m_Fontsize = std::stoi(size_str.substr(0, size_str.find(" ")));


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
            m_Spacing.width = std::stoi(spacing_str.substr(0, spacing_str.find(",")));
            m_Spacing.height = std::stoi(spacing_str.substr(spacing_str.find(",") + 1));


            file >> line >> line >> line >> w >> h;
            std::getline(file, line);
            std::getline(file, line);
            file >> line >> num_letters;

            m_Num_letters = std::stoi(num_letters.substr(6));

            m_Image_size = {std::stoi(w.substr(7)), std::stoi(h.substr(7))};
            m_Image_buffer = new map::clr::RGB[m_Image_size.width * m_Image_size.height];

            file.close();
        }


        void loadimage(){
            std::ifstream file{FONT_PATH + m_PPM_Filename};
            assert(file.is_open());

            std::string line;
            std::getline(file, line);
            std::getline(file, line);
            std::getline(file, line);

            for(int i = 0; i < m_Image_size.height; i++){
                for(int j = 0; j < m_Image_size.width; j++){
                    int r, g, b;
                    file >> r >> g >> b;

                    m_Image_buffer[i*m_Image_size.width + j] = {r, g, b};
                }
            }

            file.close();
        }


        void loadlettersinfo(){
            std::ifstream file{FONT_PATH + m_FNT_Filename};
            assert(file.is_open());

            m_Letters.reserve(m_Num_letters);

            std::string line;
            std::getline(file, line);
            std::getline(file, line);
            std::getline(file, line);
            std::getline(file, line);

            for(int index = 0; index < m_Num_letters && !file.eof(); index++){
                file >> line;

                if(line == "char"){
                    int id, x, y, width, height, xoffset, yoffset, xadvance;

                    file >> line;
                    id = std::stoi(line.substr(3));
                    file >> line;
                    x = std::stoi(line.substr(2));
                    file >> line;
                    y = std::stoi(line.substr(2));
                    file >> line;
                    width = std::stoi(line.substr(6));
                    file >> line;
                    height = std::stoi(line.substr(7));
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

                    for(int i = 0; i < height; ++i){
                        for(int j = 0; j < width; ++j){
                            m_Letters[index].buffer[i*width + j] = m_Image_buffer[(y + i)* m_Image_size.width + (x + j)];
                        }
                    }
                }
            }

            delete[] m_Image_buffer;
        }
    };
}