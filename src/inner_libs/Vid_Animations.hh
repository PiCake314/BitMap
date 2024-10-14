#pragma once

#include "../Mapper/Mapper.hpp"



auto letterByLetter(
    const std::string_view text,
    const map::Point &point,
    const std::string_view fontname = "",
    const map::Alignment alignment = map::Alignment::none) noexcept
{
    using namespace map::renderables;


    return [=](const size_t frame, const size_t frames, const double dt) -> RenderablePtr {

        const size_t num_chars = text.size();
        const double chars = double(num_chars * frame) / frames;

        const std::string_view subtext = text.substr(0, chars);

        return std::make_unique<Text>(subtext, point, Text::Data{.font = fontname.begin(), .alignment = alignment});
    };

}


