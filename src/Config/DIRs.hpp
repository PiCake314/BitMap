#pragma once

#include <filesystem>
#include <cstdlib>

namespace map::dirs{

    inline const std::filesystem::path TEMP = ".temp";

    // inline const std::filesystem::path OUT_DIR = "output";

    // inline const std::filesystem::path PPMS_DIR = OUT_DIR / "ppms";
    // inline const std::filesystem::path TEMP_PPMS_DIR = PPMS_DIR / TEMP;

    // inline const std::filesystem::path VIDS_DIR = OUT_DIR / "vids";
    // inline const std::filesystem::path TEMP_VIDS_DIR = VIDS_DIR / TEMP;

    // inline const std::filesystem::path TEMP_TEX_DIR = PPMS_DIR / ".tex";

    // inline const std::filesystem::path SOUNDS_DIR = "sounds/";

    inline const std::filesystem::path MANGLED = "__out__";
    inline const std::filesystem::path MANGLED_PPM = MANGLED.string() + ".ppm";
    inline const std::filesystem::path MANGLED_MP4 = MANGLED.string() + ".mp4";

    inline const std::filesystem::path FONTS_DIR = []{
        // if a built-in path exists, use it, otherwise use fonts/
        const auto var = std::getenv("MAPPER_FONT_PATH");
        return var ? var : "fonts";
    }();

}
