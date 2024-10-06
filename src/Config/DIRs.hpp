#pragma once

#include <filesystem>

namespace map{

    constexpr auto TEMP = ".temp";

    inline const std::filesystem::path OUT_DIR = "output/";

    inline const std::filesystem::path PPMS_DIR = OUT_DIR / "ppms/";
    inline const std::filesystem::path PPMS_TEMP_DIR = PPMS_DIR / TEMP;

    inline const std::filesystem::path VIDS_DIR = OUT_DIR / "vids/";
    inline const std::filesystem::path TEMP_VIDS_DIR = VIDS_DIR / TEMP;

    inline const std::filesystem::path TEMP_PDFS_DIR = OUT_DIR / ".pdf";

    // inline const std::filesystem::path SOUNDS_DIR = "sounds/";

    inline const std::filesystem::path MANGLED = "__out__";
    inline const std::filesystem::path MANGLED_PPM = MANGLED.string() + ".ppm";
    inline const std::filesystem::path MANGLED_MP4 = MANGLED.string() + ".mp4";

}
