#include "../src/Mapper/Mapper.hpp"
// #include "funcs.cpp"
// #include "rdtsc.h"

int height = 500, width = 500;

void setup(int argc, char **argv, std::string &filename, int &h, int &w, int &fps, map::Loadtype arg, bool debug = false);


Shape_t scene1(int frame, int frames){
	map::shapes::Line l({width/5.0, height/2.0}, height/3, 90 DEGREES, map::clr::RGB(255, 0, 0), 3);
	map::Point shift{3*width/5.0, 0};
	l.rotate(360 DEGREES * (frame/double(frames)));
	l.shift(shift * (frame/double(frames)));

	return l;
}


Shape_t scene2(int frame, int frames){
	map::shapes::Line l({4*width/5.0, height/2.0}, height/3, 90 DEGREES, map::clr::RGB(255, 0, 0), 3);
	map::Point shift{-3*width/5.0, 0};
	l.rotate(360 DEGREES * (frame/double(frames)));
	l.shift(shift * (frame/double(frames)));

	return l;
}

int main(int argc, char **argv){
	/* --------------------------- Meta Data --------------------------- */

    std::string filename = "output.ppm";
	int fps = 0;
    map::Loadtype loadtype = map::Loadtype::reset;

	setup(argc, argv, filename, height, width, fps, loadtype, true);

    map::Mapper m = map::Mapper("output.ppm", height, width, loadtype);
	// m.setFPS(fps);


	/* --------------------------- Put your code here --------------------------- */

	using namespace map;
	std::cout << "fps: " << fps << std::endl;
	// int seconds = 2;

	m.animate(scene1, 2);
	m.animate(scene2, 1);


	m.render(filename);
	m.clearFrames();

	/* -------------------------------------------------------------------------- */
    return 0;
}






void setup(int argc, char **argv, std::string &filename, int &h, int &w, int &fps, map::Loadtype arg, bool debug){
	if(argc > 1 && (std::string(argv[1]) == "l" || std::string(argv[1]) == "load"))
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

