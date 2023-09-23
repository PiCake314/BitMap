#pragma once

namespace map{
    enum class RectAlignment{
        none = -1,
        center = 0,
        // TODO: Multiple parameter using bit flag
        // Rtop,
        // Rbottom,
        // Rleft,
        // Rright,

        top_left = 5,
        top_right,
        bottom_left,
        bottom_right,
        width,
        height
    };
}