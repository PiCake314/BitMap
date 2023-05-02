#include "../src/Mapper/Mapper.hpp"
// #include "funcs.cpp"
// #include "rdtsc.h"


void setup(int argc, char **argv, std::string &filename, int &h, int &w, int &fps, map::Loadtype arg, bool debug = false){
	if(argc > 1 && (std::string(argv[1]) == "l" || std::string(argv[1]) == "load"))
		arg = map::Loadtype::load;


    if(argc > 3){
		filename = argv[3];

		if(std::string(argv[2]) == "video"){
			assert(argc > 4);
			fps = std::stoi(argv[4]);
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


int main(int argc, char **argv){
	/* --------------------------- Meta Data --------------------------- */

    std::string filename = "output.ppm";
    int height = 300, width = 300;
	int fps = 0;
    map::Loadtype loadtype = map::Loadtype::reset;

	setup(argc, argv, filename, height, width, fps, loadtype, true);

    map::Mapper m = map::Mapper(filename, height, width, loadtype);


	/* --------------------------- Put your code here --------------------------- */

	map::shapes::Ellipse e({150, 150}, 100, 150, map::clr::RGB(255, 0, 0), false, true, 1);
	m.draw(e);


	/* -------------------------------------------------------------------------- */
    return 0;
}