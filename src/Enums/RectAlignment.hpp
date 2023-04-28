#pragma once

namespace map{
    enum RectAlignment{
        Rnone = -1,
        Rcenter = 0,
        // TODO:
        // Rtop,
        // Rbottom,
        // Rleft,
        // Rright,

        Rtop_left = 5,
        Rtop_right,
        Rbottom_left,
        Rbottom_right,
        Rwidth,
        Rheight
    };
}