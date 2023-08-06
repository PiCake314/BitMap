#include "../src/Mapper/Mapper.hpp"
#include "../src/Structs/Shapes/Shapes.hpp"
// #include "funcs.cpp"
// #include "rdtsc.h"

int height = 500, width = 500;

void setup(int argc, char **argv, std::string &filename, int &h, int &w, int &fps, map::Loadtype &arg, bool debug = false);


map::shapes::ShapePtr scene(int frame, const int frames){
	return std::make_unique<map::shapes::Circle>(map::shapes::Circle(map::Point{0 + width *(float(frame)/frames), float(height/2)}, 20));
}


int main(int argc, char **argv){
	srand(time(NULL));
	/* --------------------------- Meta Data --------------------------- */

    std::string filename = "output.ppm";
	int fps = 0;
    map::Loadtype loadtype = map::Loadtype::reset;

	setup(argc, argv, filename, height, width, fps, loadtype, true);

    map::Mapper m = map::Mapper(filename, {height, width}, fps, loadtype);
	// m.setFPS(fps);


	/* --------------------------- Put your code here --------------------------- */


	map::shapes::ShapePtr c = std::make_unique<map::shapes::Circle>(map::Point{static_cast<double>(width)/2, static_cast<double>(height)/2}, 100, map::clr::RED, true);
	m.draw(c.get());

	// m.animate(scene, .5);


	/* -------------------------------------------------------------------------- */

	// m.render(filename);
	// m.clearFrames();

    return 0;
}






void setup(int argc, char **argv, std::string &filename, int &h, int &w, int &fps, map::Loadtype &arg, bool debug){
	std::string argv1 = argv[1];
	if(argc > 1 && (argv1 == "l" || argv1 == "load"))
		arg = map::Loadtype::load;


    if(argc > 3){
		filename = argv[3];

		if(std::string(argv[2]) == "video"){
			assert(argc > 4);
			fps = std::stoi(argv[6]);
			if(fps == 0) fps = 24;

			if(filename == "def") filename = "res.mp4";
			else filename = filename.substr(3);
		}
		else if(filename == "def") filename = "output.ppm";
		else filename = filename.substr(3);
    }
	
	if(argc > 5){
		h = std::stoi(argv[4]);
		w = std::stoi(argv[5]);

		if(h == 0) h = 300;
		if(w == 0) w = 300;
	}


	if(debug){
		std::cout << "ARGC: " << argc << std::endl;
		for(int i = 0; i < argc; i++)
			std::cout << "argv[" << i << "]: " << argv[i] << std::endl;
		
		std::cout << "filename: " << filename << std::endl;
	}
}

