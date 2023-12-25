#include "../src/Mapper/Mapper.hpp" // importing the library
#include <vector>
#include <array>

extern size_t height, width; // importing the height and width of the canvas


const map::Point3D center{width / 2., height / 2., 0};

constexpr double shape_size = 200.;
// constexpr double square_size_half = square_size / 2.;
constexpr int DIM = 4;
constexpr int ARR_SIZE = 16;
std::array<map::PointND<DIM>, ARR_SIZE> points = {
    map::PointND<DIM>{-.5, -.5, -.5, .5},
    {.5, -.5, -.5, .5},
    {.5, .5, -.5, .5},
    {-.5, .5, -.5, .5},
    {-.5, -.5, .5, .5},
    {.5, -.5, .5, .5},
    {.5, .5, .5, .5},
    {-.5, .5, .5, .5},
    {-.5, -.5, -.5, -.5},
    {.5, -.5, -.5, -.5},
    {.5, .5, -.5, -.5},
    {-.5, .5, -.5, -.5},
    {-.5, -.5, .5, -.5},
    {.5, -.5, .5, -.5},
    {.5, .5, .5, -.5},
    {-.5, .5, .5, -.5}
};




double angle = 0;
std::vector<map::shapes::ShapePtr> spinningCube(const int frame, const int frames, double delta){
    using namespace map;
    using namespace map::shapes;

    // // const double angle = M_PI * .5 / frames;
    // const double angle = 120 * delta DEGREES;

    Point projected[ARR_SIZE];
    constexpr double distance = 1.5;

    // doing necessary rotations
    for(int i = 0; i < ARR_SIZE; ++i){
        auto p = points[i].rotated<1, 2>(angle);
        // p.rotate<2, 3>(angle);
        p.rotate<2, 3>(angle);

        // projection matrix
        const double z = 1 / (distance - (p[DIM -1]));

        double projection_matrix[DIM][DIM] = {};
        for(int j = 0; j < 2; ++j){
            projection_matrix[j][j] = z;
        }

        projected[i] = (projection_matrix * p).toPoint();

        // scaling and translating
        projected[i] *= shape_size;
        projected[i] += center.toPoint();
    }


    std::vector<ShapePtr> shapes;

    for(const auto &point : projected){
        shapes.push_back(std::make_unique<Circle>(point, 5, Circle::Data{.color = clr::RED, .thickness = 10}));
    }


    // drawing the lines for the tessaract
    // for(int i = 0; i < ARR_SIZE; ++i){
    //     for(int j = i + 1; j < ARR_SIZE; ++j){
    //         if(__builtin_popcount(i ^ j) == 1){
    //             shapes.push_back(std::make_unique<Line>(projected[i], projected[j], Line::Data{.color = clr::BLUE}));
    //         }
    //     }
    // }

    // doing it manually
    for(int i = 0; i < 4; ++i){
        shapes.push_back(std::make_unique<Line>(projected[i], projected[(i + 1) % 4], Line::Data{.color = clr::BLUE}));
        shapes.push_back(std::make_unique<Line>(projected[i + 4], projected[((i + 1) % 4) + 4], Line::Data{.color = clr::BLUE}));
        shapes.push_back(std::make_unique<Line>(projected[i], projected[i + 4], Line::Data{.color = clr::BLUE}));
    }

    for(int i = 0; i < 4; ++i){
        // connect(8, i, (i + 1) % 4, projected3d); // 8 is the offset
        shapes.push_back(std::make_unique<Line>(projected[i + 8], projected[(i + 1) % 4 + 8], Line::Data{.color = clr::BLUE}));
        // connect(8, i + 4, ((i + 1) % 4) + 4, projected3d);
        shapes.push_back(std::make_unique<Line>(projected[i + 8 + 4], projected[((i + 1) % 4) + 4 + 8], Line::Data{.color = clr::BLUE}));
        // connect(8, i, i + 4, projected3d);
        shapes.push_back(std::make_unique<Line>(projected[i + 8], projected[i + 8 + 4], Line::Data{.color = clr::BLUE}));
    }

    for(int i = 0; i < 4; ++i){
        // connect(0, i, i + 8, projected3d);
        shapes.push_back(std::make_unique<Line>(projected[i], projected[i + 8], Line::Data{.color = clr::BLUE}));
    }

    


    angle += 100 * delta DEGREES;
    return shapes;
}


void canvas(map::Mapper &m){
    using namespace map;
    using namespace shapes;


    m.animate(spinningCube, 4.5);

}

