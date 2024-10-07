#pragma once

#include <vector>
#include <cmath>
#include <memory>
#include <numeric>

// #include "../../Mapper/Mapper.hpp"

#include "../Point.hpp"
#include "../RGB.hpp"
#include "../../Utility/Size.hpp"
#include "../../Enums/Alignment.hpp"

namespace map{

    class Mapper;

    namespace renderables{

        struct Renderable;

        using RenderablePtr = std::unique_ptr<Renderable>;

        struct Renderable {
            friend class map::Mapper;

            // Shared
            Point center;


            Renderable(Point point) noexcept : center{point} {}

            Renderable(const Renderable& other) = default;

            Renderable(Renderable&& other) noexcept = default;

            Renderable& operator=(const Renderable& other) = default;

            Renderable& operator=(Renderable&& other) noexcept = default;

            // [[nodiscard]] virtual std::vector<std::pair<size_t, size_t>> getLocks(Size size, const size_t root_pix_per_lock) const = 0;

            // virtual void setDepth(int depth) noexcept {};

            // [[nodiscard]] virtual int getDepth() const noexcept { return 100; };

            virtual RenderablePtr clone() const = 0;

            virtual ~Renderable() = default;

            protected:
            virtual void draw(Mapper*) const = 0;


        };
    }
}



#include "Text.hpp"
#include "Audio.hpp"
#include "Image.hpp"
