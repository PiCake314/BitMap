#pragma once

#include "Renderables.hpp"
// #include "../../Mapper/Mapper.hpp"


namespace map{
    class Mapper;

    namespace renderables{

        struct Text final : Renderable{

            // use for named arguments
            struct Data{
                // DO NOT ACCESS THESE DIRECTLY
                std::string font{};
                map::Alignment alignment{map::Alignment::none};

                // Data() = default 
            };


            std::string text;
            std::string font;
            map::Alignment alignment;

            Text(const std::string_view, const Point&, Data&& = Data{.font = "", .alignment = Alignment::none});

            [[nodiscard]] RenderablePtr clone() const override;

            protected:
            void draw(Mapper *m) const override;
        };
    }
}
