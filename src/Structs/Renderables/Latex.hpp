// #pragma once

// #include <string_view>

// #include "Renderables.hpp"
// #include "../RGB.hpp"


// namespace map::renderables{

//     struct Latex final : Image{

//         // use for named arguments
//         struct Data{
//             // DO NOT ACCESS THESE DIRECTLY
//             double scale{1};
//             map::Alignment alignment{map::Alignment::none};
//         };

//         std::string_view latex;

//         Latex(std::string_view, const Point&, Data&&);

//         RenderablePtr clone() const override;

//         ~Latex() override;

//         protected:
//         void draw(Mapper *m) const override;


//         private:
//             void loadPPM();
//             inline static size_t tex_id = 1;

//     };

// }
