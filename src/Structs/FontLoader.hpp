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

        // explain xoffset, yoffset, and xadvance
        // xoffset: how much to move the cursor to the right before drawing the next letter
        // yoffset: how much to move the cursor down before drawing the next letter
        // xadvance: how much to move the cursor to the right after drawing the letter

        map::clr::RGB *buffer = nullptr;


        operator char() const{
            return static_cast<char>(ID);
        }

        ~Letter(){
            // if(buffer)
                // delete[] buffer;
        }
    };

    class FontLoader{
        private:
            std::string m_FNT_Filename;
            std::string m_PPM_Filename;

            int m_Num_letters{};

            map::Size m_Image_size;
            map::clr::RGB *m_Image_buffer = nullptr;


        public:

            FontLoader(std::vector<Letter> &dst, Size &spacing, const std::string &fnt_filename, const std::string &ppm_filename = "")
            : m_FNT_Filename{fnt_filename},
            // if ppm_filename is empty, then use the fnt_filename to generate the ppm_filename
            m_PPM_Filename{ppm_filename == "" ? fnt_filename.substr(0, fnt_filename.length() - 4) + ".ppm" : ppm_filename}
            {
                assert(m_FNT_Filename.substr(m_FNT_Filename.length()  - 4) == ".fnt");
                assert(m_PPM_Filename.substr(m_PPM_Filename.length() - 4) == ".ppm");

                loadinfo(spacing);
                loadimage();
                loadlettersinfo(dst);
            }

            ~FontLoader(){
                if(m_Image_buffer)
                    delete[] m_Image_buffer;
            }

        private:

            void loadinfo(Size &spacing){
                std::ifstream file{FONT_PATH + m_FNT_Filename};
                assert(file.is_open());

                std::string line;
                std::string w;
                std::string h;
                std::string num_letters;

                std::getline(file, line);
                int spacing_ind = line.find("spacing=");
                if(spacing_ind != std::string::npos){
                    std::string spacing_str = line.substr(spacing_ind + 8);
                    spacing.width = std::stoi(spacing_str.substr(0, spacing_str.find(",")));
                    spacing.height = std::stoi(spacing_str.substr(spacing_str.find(",") + 1));
                }

                file >> line >> line >> line >> w >> h;
                std::getline(file, line);
                std::getline(file, line);
                file >> line >> num_letters;

                m_Num_letters = std::stoi(num_letters.substr(6));
                // dst.reserve(m_Num_letters);

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


            void loadlettersinfo(std::vector<Letter> &dst){
                std::ifstream file{FONT_PATH + m_FNT_Filename};
                assert(file.is_open());

                dst.reserve(m_Num_letters);

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

                        dst.push_back({});
                        dst[index].ID = static_cast<Alphabet>(id);
                        dst[index].width = width;
                        dst[index].height = height;
                        dst[index].xoffset = xoffset;
                        dst[index].yoffset = yoffset;
                        dst[index].xadvance = xadvance;

                        dst[index].buffer = new map::clr::RGB[width * height];

                        for(int i = 0; i < height; ++i){
                            for(int j = 0; j < width; ++j){
                                dst[index].buffer[i*width + j] = m_Image_buffer[(y + i)* m_Image_size.width + (x + j)];
                            }
                        }
                    }
                }
            }

    };
}