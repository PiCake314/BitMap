#include "Ellipse.hpp"


map::shapes::Ellipse::Ellipse(Point p, int radius_1, int radius_2, Data &&d)
: Shape(p, d.color, d.filled, d.thickness), r1(radius_1), r2(radius_2), inverted(d.inverted), alignment(d.alignment)
{
    switch(alignment){
        // case Alignment::top_left:
        //     center = {r, r};
        //     break;
        // case Alignment::top_right:
        //     center = {width - r, r};
        //     break;
        // case Alignment::bottom_left:
        //     center = {r, height - r};
        //     break;
        // case Alignment::bottom_right:
        //     center = {width - r, height - r};
        //     break;
        case Alignment::center:
            center = {width/2., height/2.};
            break;
        case Alignment::left:
            center = {double(r1), height/2.};
            break;
        case Alignment::right:
            center = {double(width - size_t(r1)), height/2.};
            break;
        case Alignment::top:
            center = {width/2. , double(r2)};
            break;
        case Alignment::bottom:
            center = {width/2., double(height - size_t(r2))};
            break;
        case Alignment::none:
            center = p;
            break;
    }
}


void map::shapes::Ellipse::rotate([[maybe_unused]] double angle) {
    throw std::runtime_error("Ellipse::rotate() is not implemented");
}

// map::shapes::ShapePtr map::shapes::Ellipse::rotated(double angle) const {
//     throw std::runtime_error("Ellipse::rotated() is not implemented");

//     return std::make_unique<Ellipse>(*this);
// }

std::vector<std::pair<size_t, size_t>> map::shapes::Ellipse::getLocks(Size size, const size_t root_pix_per_lock) const {
    std::vector<std::pair<size_t, size_t>> locks;

    const size_t x = size_t(center.x);
    const size_t y = size_t(center.y);
    const size_t half_thickness = size_t(thickness/2);

    const size_t x1 = std::max(x - size_t(r1) - half_thickness, size_t(0));
    const size_t x2 = std::min(x + size_t(r1) + half_thickness, size.width -1);
    const size_t y1 = std::max(y - size_t(r2) - half_thickness, size_t(0));
    const size_t y2 = std::min(y + size_t(r2) + half_thickness, size.height -1);
    
    if(filled){
        const size_t x1_lock = x1 / root_pix_per_lock;
        const size_t x2_lock = x2 / root_pix_per_lock;
        const size_t y1_lock = y1 / root_pix_per_lock;
        const size_t y2_lock = y2 / root_pix_per_lock;

        for(size_t i = y1_lock; i <= y2_lock; ++i){
            for(size_t j = x1_lock; j <= x2_lock; ++j){
                locks.push_back({i, j});
            }
        }

        // std::ranges::sort(locks);
        // locks.erase(std::unique(locks.begin(), locks.end()), locks.end()); // hopefully not needed :))
    }
    else{
                                                // only need to lock the border of the circle
        for(size_t i = y1; i <= y2; ++i){
            for(size_t j = x1; j <= x2; ++j){
                if(onBorder({j, i})){
                    locks.push_back({i / root_pix_per_lock, j / root_pix_per_lock});
                }
            }
        }


        std::ranges::sort(locks);
        locks.erase(std::unique(locks.begin(), locks.end()), locks.end());
    }

    return locks;
}

bool map::shapes::Ellipse::onBorder(const Point& p) const {
    const int dx = int(p.x - center.x);
    const int dy = int(p.y - center.y);
    const int radius1 = r1 + thickness / 2;
    const int radius2 = r2 + thickness / 2;

    return (dx * dx * radius2 * radius2 + dy * dy * radius1 * radius1) == (radius1 * radius1 * radius2 * radius2);
}



void map::shapes::Ellipse::draw(Mapper *m) const {
    m->drawEllipse<true>(center, r1, r2, color, filled, inverted, thickness, alignment);
}

map::shapes::ShapePtr map::shapes::Ellipse::clone() const {
    return std::make_unique<Ellipse>(*this);
}
