#pragma once

#include "Shapes.hpp"

namespace map::renderables::shapes{

    struct Line final : Shape{

        // use for named arguments
        struct Data{
            // DO NOT ACCESS THESE DIRECTLY
            clr::RGB color{};
            int thickness{1};
        };


        int length;
        double angle;
        public:

        Line(Point c, int len, double angle, Data && = Data{.color = clr::RGB{}, .thickness = 1});

        Line(Point s, Point e, Data && = Data{.color = clr::RGB{}, .thickness = 1});

        Line(const Line& other) = default;

        Line(Line&& other) noexcept = default;

        Line& operator=(const Line& other) = default;

        Line& operator=(Line&& other) noexcept = default;



        Point start() const;

        Point end() const;

        [[nodiscard]] bool on(Point p) const;

        void draw(Mapper *m) const override;

        protected:
        RenderablePtr clone() const override;

        private:
            Point m_start, m_end;
    };
}
