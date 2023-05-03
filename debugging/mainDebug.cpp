#include "../src/Mapper/Mapper.hpp"
// #include "funcs.cpp"
// #include "rdtsc.h"

// 2

void setup(int argc, char **argv, std::string &filename, int &h, int &w, int &fps, map::Loadtype arg, bool debug = false);

int main(int argc, char **argv){
	/* --------------------------- Meta Data --------------------------- */

    std::string filename = "output.ppm";
    int height = 500, width = 500;
	int fps = 0;
    map::Loadtype loadtype = map::Loadtype::reset;

	setup(argc, argv, filename, height, width, fps, loadtype, true);

    map::Mapper m = map::Mapper("output.ppm", height, width, loadtype);
	m.setFPS(fps);


	/* --------------------------- Put your code here --------------------------- */

	using namespace map;
	std::cout << "fps: " << fps << std::endl;
	int seconds = 3;
	int frames = fps * seconds;

	std::string file;

	shapes::Line l({width/2.f, 0.0}, {width/2.f, height/1.f}, clr::RGB(255, 0, 0), 1);
	m.draw(l);
	for(int frame = 0; frame < frames; frame++){
		float angle = 2*M_PI * (float(frame) / frames);

		m.draw(l.rotate(angle));


		std::cout << frame << '/' << frames << "fps\n";
		m.saveFrame(frame);
		m.fillWhite();
	}

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

