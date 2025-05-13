#pragma once

#include "../Mapper/Mapper.hpp"
#include <string_view>
#include <memory>



map::renderables::RenderablePtr Title(const std::string_view title, const map::Size size) noexcept {
    using Data = map::renderables::Text::Data;
    return std::make_unique<map::renderables::Text>(title, map::Point{}, Data{.font = "Consolas164", .alignment = map::Alignment::center});
}