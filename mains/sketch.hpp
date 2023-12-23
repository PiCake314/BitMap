#include "../src/Mapper/Mapper.hpp" // importing the library
#include <vector>

extern size_t height, width; // importing the height and width of the canvas


const map::Point3D center{width / 2., height / 2., 0};

constexpr double square_size = 200.;
// constexpr double square_size_half = square_size / 2.;
map::Point3D points[] = {
     {-.5, -.5, .5} // top left front
    ,{.5, -.5, .5} // top right front
    ,{.5, .5, .5} // bottom right front
    ,{-.5, .5, .5} // bottom left front
    ,{-.5, -.5, -.5} // top left back
    ,{.5, -.5, -.5} // top right back
    ,{.5, .5, -.5} // bottom right back
    ,{-.5, .5, -.5} // bottom left back
};


std::vector<map::shapes::ShapePtr> spinningCube(const int frame, const int frames, double delta){
    using namespace map;
    using namespace map::shapes;

    // const double angle = M_PI * .5 / frames;
    const double angle = 120 * delta DEGREES;

    Point projected[8];

    constexpr double distance = 1.5;
    // doing necessary rotations

    for(int i = 0; auto &point : points){
        point.rotate<Point3D::Axis::Z>(-angle);
        point.rotate<Point3D::Axis::X>(angle);
        // point.rotate<Point3D::Axis::Y>(2*angle);

        const double z = 1 / (distance - (point.z));

        const double projection_matrix[3][3] = {
             {z, 0, 0}
            ,{0, z, 0}
            ,{0, 0, 0}
        };

        projected[i] = (projection_matrix * point).toPoint();
        ++i;
    }


    for(auto &point : projected){
        point *= square_size;
        point += center.toPoint();
    }


    std::vector<ShapePtr> shapes;

    shapes.push_back(std::make_unique<Line>(projected[0], projected[1]));
    shapes.push_back(std::make_unique<Line>(projected[1], projected[2]));
    shapes.push_back(std::make_unique<Line>(projected[2], projected[3]));
    shapes.push_back(std::make_unique<Line>(projected[3], projected[0]));

    shapes.push_back(std::make_unique<Line>(projected[4], projected[5]));
    shapes.push_back(std::make_unique<Line>(projected[5], projected[6]));
    shapes.push_back(std::make_unique<Line>(projected[6], projected[7]));
    shapes.push_back(std::make_unique<Line>(projected[7], projected[4]));

    shapes.push_back(std::make_unique<Line>(projected[0], projected[4]));
    shapes.push_back(std::make_unique<Line>(projected[1], projected[5]));
    shapes.push_back(std::make_unique<Line>(projected[2], projected[6]));
    shapes.push_back(std::make_unique<Line>(projected[3], projected[7]));



    for(const auto &point : projected){
        shapes.push_back(std::make_unique<Circle>(point, 10, Circle::Data{.color = clr::RED}));
    }



    return shapes;
}


void canvas(map::Mapper &m){
    using namespace map;
    using namespace shapes;


    m.animate(spinningCube, 3.2);

}

