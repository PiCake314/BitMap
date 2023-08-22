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
            if(buffer)
                delete[] buffer;
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

        [[nodiscard]] const int getFontSize() const{
            return m_Fontsize;
        }

        [[nodiscard]] const bool isBold() const{
            return m_Bold;
        }

        [[nodiscard]] const bool isItalic() const{
            return m_Italic;
        }

        [[nodiscard]] const Size& getSpacing() const{
            return m_Spacing;
        }

        [[nodiscard]] const clr::RGB& getTransparentColor() const{
            return m_Transparent_color;
        }

        [[nodiscard]] const int size() const{
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
            assert(file.is_open());

            std::string line;
            std::string w;
            std::string h;
            std::string num_letters;

            file >> line >> line >> line;
            m_Fontsize = std::stoi(line.substr(5));

            file >> line;
            m_Bold = line.at(5) == '1';

            file >> line;
            m_Italic = line.at(7) == '1';

            std::getline(file, line);
            int spacing_ind = line.find("spacing=");
            if(spacing_ind != std::string::npos){
                std::string spacing_str = line.substr(spacing_ind + 8);
                m_Spacing.width = std::stoi(spacing_str.substr(0, spacing_str.find(",")));
                m_Spacing.height = std::stoi(spacing_str.substr(spacing_str.find(",") + 1));
            }

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