#include <ranges>
#include <limits>

#include "Shapes.hpp"



map::renderables::shapes::Shape::Shape(map::Point p, map::clr::RGB c, bool f, int t, std::vector<map::Point> pts)
: Renderable{p}, color(c), filled{f}, thickness(t), points(pts)
{
    color.depth = 1;
}

// map::renderables::shapes::Shape::Shape(const map::renderables::shapes::Shape& other) = default;

// map::renderables::shapes::Shape::Shape(map::renderables::shapes::Shape&& other) noexcept = default;

// map::renderables::shapes::Shape& map::renderables::shapes::Shape::operator=(const map::renderables::shapes::Shape& other) = default;

// map::renderables::shapes::Shape& map::renderables::shapes::Shape::operator=(map::renderables::shapes::Shape&& other) noexcept = default;


void map::renderables::shapes::Shape::rotate(double angle){
    for(auto& point : points){
        point.rotate(angle, center);
    }
}


void map::renderables::shapes::Shape::rotate(double angle, const map::Point& cent){
    for(auto& point : points){
        point.rotate(angle, cent);
    }
}


[[nodiscard]] map::renderables::RenderablePtr map::renderables::shapes::Shape::rotated(double angle) const {
    // map::renderables::shapes::ShapePtr s = std::make_unique<map::renderables::shapes::Shape>(*this); // apparently this is a bug
    map::renderables::RenderablePtr s = this->clone();
    static_cast<Shape*>(s.get())->rotate(angle);
    // s->rotate(angle);
    return s;
}

void map::renderables::shapes::Shape::shift(const map::Point& p){
    center += p;
    std::ranges::for_each(points, [p](Point &pt){pt += p;});
}

[[nodiscard]] map::renderables::RenderablePtr map::renderables::shapes::Shape::shifted(const Point& p) const {
    // map::renderables::shapes::ShapePtr s = std::make_unique<map::renderables::shapes::Shape>(*this);
    map::renderables::RenderablePtr s = this->clone();
    static_cast<Shape*>(s.get())->shift(p);
    // s->shift(p);
    return s;
}


[[nodiscard]] std::vector<std::pair<size_t, size_t>> map::renderables::shapes::Shape::getLocks(Size size, const size_t root_pix_per_lock) const {
    std::vector<std::pair<size_t, size_t>> lockIndices;

    if(points.empty()) return lockIndices;

    // calculate the bounding box
    auto left = size_t(points[0].x);
    auto top = size_t(points[0].y);
    auto right = size_t(points[0].x);
    auto bottom = size_t(points[0].y);

    for(const auto& point : points){
        if(point.x < left)    left   = size_t(point.x);
        if(point.y < top)     top    = size_t(point.y);
        if(point.x > right)   right  = size_t(point.x);
        if(point.y > bottom)  bottom = size_t(point.y);
    }

    const size_t half_thickness = size_t(thickness/2);

    const auto x1 = std::clamp<size_t>(left - half_thickness, 0, size_t(size.width) -1);
    const auto x2 = std::clamp<size_t>(right + half_thickness, 0, size_t(size.width) -1);
    const auto y1 = std::clamp<size_t>(top - half_thickness, 0, size_t(size.height) -1);
    const auto y2 = std::clamp<size_t>(bottom + half_thickness, 0, size_t(size.height) -1);

    if(filled){
        for(size_t i = y1; i <= y2; ++i){
            for(size_t j = x1; j <= x2; ++j){
                if(insideShape({j, i})){
                    lockIndices.push_back({i/root_pix_per_lock, j/root_pix_per_lock});
                    j = ((j/root_pix_per_lock) + 1) * root_pix_per_lock;
                }
            }
        }
    }
    else for(size_t i = y1; i <= y2; ++i){ // only add the points that are on the border
            for(size_t j = x1; j <= x2; ++j){
                if(onBorder({j, i})){
                    lockIndices.push_back({i/root_pix_per_lock, j/root_pix_per_lock});
                    j = ((j/root_pix_per_lock) + 1) * root_pix_per_lock;
                }
            }
        }

    // removing duplicate lock indices
    std::ranges::sort(lockIndices);
    lockIndices.erase(std::unique(lockIndices.begin(), lockIndices.end()), lockIndices.end());

    // for(auto [i, j] : lockIndices){
    //     std::cout << (i*size.width/root_pix_per_lock) + j << ", ";
    // }
    // puts("");

    return lockIndices;
}

void map::renderables::shapes::Shape::setDepth(int depth) noexcept { color.depth = depth; }

[[nodiscard]] int map::renderables::shapes::Shape::getDepth() const noexcept { return color.depth; }

[[nodiscard]] bool map::renderables::shapes::Shape::onBorder(const map::Point& p) const {
    if (points.size() < 2) return points.empty() ? false : points[0] == p;


    for(size_t i = 0, j = points.size() - 1; i < points.size(); j = i++){
        if(
        ((points[i].y - p.y < std::numeric_limits<double>::epsilon()) and ((points[i].x <= p.x and p.x <= points[j].x) or (points[j].x <= p.x and p.x <= points[i].x))) or
        ((points[i].x - p.x < std::numeric_limits<double>::epsilon()) and ((points[i].y <= p.y and p.y <= points[j].y) or (points[j].y <= p.y and p.y <= points[i].y))) or
        (std::abs(points[i].x - p.x) < 2 and std::abs(points[i].y - p.y) < 2)
        )
            return true;
    }

    return false;
}

[[nodiscard]] bool map::renderables::shapes::Shape::insideShape(const map::Point& p) const {
    if(points.size() < 3){
        if(points.size() == 1) return points[0] == p;

        if(points.size() == 2){
            // taken from Line::on()
            const Point& p1 = points[0];
            const Point& p2 = points[1];

            if(p.x < std::min(p1.x, p2.x) || p.x > std::max(p1.x, p2.x) || p.y < std::min(p1.y, p2.y) || p.y > std::max(p1.y, p2.y))
                return false;

            const double a = p2.y - p1.y;
            const double b = p1.x - p2.x;
            const double c = p2.x*p1.y - p1.x*p2.y;
            const double eq = std::abs(a*p.x + b*p.y + c);

            // calculates distance the distance squared 
            return (eq * eq)/(a*a + b*b) <= std::pow(thickness/2., 2);
        }

        return false;
    }

    bool inside = false;

    for(size_t i = 0, j = points.size() - 1; i < points.size(); j = i++){
        if(((points[i].y > p.y) != (points[j].y > p.y))
        && (p.x < (points[j].x - points[i].x) * (p.y - points[i].y) / (points[j].y - points[i].y) + points[i].x))
            inside = !inside;
    }

    return inside;
}




// map::renderables::shapes::Shape::~Shape() = default;


