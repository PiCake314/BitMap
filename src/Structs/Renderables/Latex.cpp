#include "Latex.hpp"
#include "../RGB.hpp"
#include "../../Config/DIRs.hpp"


#include <filesystem>
#include <fstream>
#include <cstdio>
#include <utility>



map::renderables::Latex::Latex(std::string_view latex, const Point &point, Data &&d)
: Image{map::dirs::TEMP_TEX_DIR / std::to_string(tex_id++), point, std::move(d)}, latex{latex}
{
    std::filesystem::create_directories(map::dirs::TEMP_TEX_DIR); // just ensures that the directory exists

    std::string_view preamble =
R"(
\documentclass[preview]{standalone}
\usepackage{amsmath}

\begin{document}
)";

    std::string_view postamble =
R"(
\end{document}
)";


    std::ofstream file{filename.replace_extension(".tex")};
    file << preamble << latex << postamble;
    file.close();


    const std::string pdflatex_cmd =
        "pdflatex -halt-on-error -interaction=nonstopmode -output-directory="
        + map::dirs::TEMP_TEX_DIR.string() + " "
        + filename.filename().replace_extension(".tex").string();


    const std::string magick_cmg =
        "magick -density 1000 " + filename.replace_extension(".pdf").string()
        + " -background white -alpha remove -alpha off -quality 90 -resize " + std::to_string(scale * 100) + "% "
        + filename.replace_extension(".png").string();


    std::system(pdflatex_cmd.c_str());
    std::system(magick_cmg.c_str());

    // pclose(popen(pdflatex_cmd.c_str(), "r"));
    // pclose(popen(magick_cmg.c_str(), "r"));

    

    // removing artifacts
    std::filesystem::remove(filename.replace_extension(".aux"));
    std::filesystem::remove(filename.replace_extension(".log"));
    std::filesystem::remove(filename.replace_extension(".pdf"));

    filename.replace_extension(".png");

}


map::renderables::RenderablePtr map::renderables::Latex::clone() const {
    return std::make_unique<Latex>(*this);
}



map::renderables::Latex::~Latex() {
    std::filesystem::remove(filename);
    std::filesystem::remove(filename.replace_extension(".tex"));
}





