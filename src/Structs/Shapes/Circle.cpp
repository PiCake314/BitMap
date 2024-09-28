#include "Circle.hpp"


map::shapes::Circle::Circle(Point p, int r, Data &&d)
: Shape(p, d.color, d.filled, d.thickness), radius(r), inverted(d.inverted), alignment(d.alignment)
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
            center = {double(r), height/2.};
            break;
        case Alignment::right:
            center = {double(width - size_t(r)), height/2.};
            break;
        case Alignment::top:
            center = {width/2. , double(r)};
            break;
        case Alignment::bottom:
            center = {width/2., double(height - size_t(r))};
            break;
        case Alignment::none:
            center = p;
            break;
    }
}


void map::shapes::Circle::rotate(double) {}


// map::shapes::ShapePtr map::shapes::Circle::rotated(double angle) const { return std::make_unique<Circle>(*this); }


std::vector<std::pair<size_t, size_t>> map::shapes::Circle::getLocks(Size size, const size_t root_pix_per_lock) const {
    std::vector<std::pair<size_t, size_t>> locks;

    const size_t x = size_t(center.x);
    const size_t y = size_t(center.y);
    const size_t half_thickness = size_t(thickness/2);

    const size_t x1 = std::max(x - size_t(radius) - half_thickness, size_t(0));
    const size_t x2 = std::min(x + size_t(radius) + half_thickness, size.width -1);
    const size_t y1 = std::max(y - size_t(radius) - half_thickness, size_t(0));
    const size_t y2 = std::min(y + size_t(radius) + half_thickness, size.height -1);
    
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


bool map::shapes::Circle::onBorder(const Point& p) const {
    const int dx = int(p.x - center.x);
    const int dy = int(p.y - center.y);
    const int dist = dx*dx + dy*dy;
    const int half_thickness = thickness/2;
    const int r = radius + half_thickness;
    const int R = radius - half_thickness;

    return dist <= r*r && dist >= R*R;
}


// bool map::Shapes::Circle



void map::shapes::Circle::draw(Mapper *m) const {
    m->drawCircle<true>(center, radius, color, filled, inverted, thickness, alignment);
}

std::unique_ptr<map::shapes::Shape> map::shapes::Circle::clone() const {
    return std::make_unique<Circle>(*this);
}
