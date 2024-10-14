#pragma once

// #include "../../Mapper/Mapper.hpp"
#include "Renderables.hpp"

namespace map{
    class Mapper;

    namespace renderables{

        struct Audio final : Renderable {

            // use for named arguments
            struct Data{
                // DO NOT ACCESS THESE DIRECTLY
                double volume = 1;
                const double speed = 1;
                const bool loop = false;
            };


            std::string filename;
            double volume;
            const double speed;
            const bool loop;

            Audio(std::string, Data&&);

            [[nodiscard]] RenderablePtr clone() const override;

            protected:
            void draw(Mapper *m) const override;

        };
    }

}
