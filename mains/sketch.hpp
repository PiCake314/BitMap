#include "../src/Mapper/Mapper.hpp" // importing the library
#include <vector>
#include <array>


extern size_t height, width; // importing the height and width of the canvas

double timer{};

double smoothMin(const double a, const double b, const double k){
    const double h = std::max(k - std::abs(a - b), 0.) / k;
    return std::min(a, b) - h * h * h * k * (1./6.);
}

double sphere(const map::Point3D& p, const double r){
    return p.mag() - r;
}

double cube(const map::Point3D& p, const map::Point3D& s){
    const map::Point3D d = p.abs() - s;
    return (d.max({0, 0, 0}) + map::Point3D{std::min(std::max(d.x, std::max(d.y, d.z)), 0.)}).mag();
}


double world(const map::Point3D& p){
    const map::Point3D s1_pos = {3, 0, 0};
    const auto sphere1 = sphere(p - s1_pos, 1);

    const auto box1 = cube(p, map::Point3D{.75});

    const double ground = - p.y + .75; // inverted since origin is at the top left

    return smoothMin(ground, smoothMin(sphere1, box1, 2), 1);
}


map::clr::RGB image(const map::Point& coord){
    const map::Point uv = (coord * 2. - map::Point{width, height}) / height;

    map::Point3D ro{0, -1, -5};      // ray origin
    map::Point3D rd = map::Point3D{uv.x, uv.y, 1}.normalized(); // ray direction

    double t{}; // distance

    ro.rotate<map::Point3D::Axis::Y>(timer); // rotating the camera
    rd.rotate<map::Point3D::Axis::Y>(timer); // rotating the ray direction

    // raymarching
    for(int i{}; i < 80; ++i){
        map::Point3D p = ro + rd * t; // position along the ray

        double d = world(p); // distance to the shape

        t += d; // marching...

        if(d < .001 || t > 100) break; // if we are close enough to the shape or if we are too far away, we stop
    }

    map::Point3D color = {t, t, t}; // creating grayscale image
    color *= 255; // rescailing to RGB
    color *= .05; // the intensity of the depth (the higher the darker)

    return color;
    // return {int(uv.x * 255), int(uv.y * 255), 0};
}


void canvas(map::Mapper &m){
    using namespace map;
    using namespace shapes;

    const int frames = m.getFPS() * 2;

    for(int frame{}; frame < frames; ++frame){
        for(int i = 0; i < height; ++i){
            for(int j = 0; j < width; ++j){
                m[{j, i}] = image({j, i});
            }
        }

        m.setState();
        m.saveFrame();
        timer += double(2 * M_PI) / frames;
    }
}