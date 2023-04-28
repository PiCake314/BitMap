#include "../Mapper/Mapper.hpp"
#include "funcs.cpp"
// #include "rdtsc.h"


int main(int argc, char** argv){

    std::string filename = "output.ppm";
	int fps = 0;

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

	std::cout << "ARGC: " << argc << std::endl;
	for(int i = 0; i < argc; i++)
		std::cout << "argv[" << i << "]: " << argv[i] << std::endl;
	
	std::cout << "filename: " << filename << std::endl;


    int height = 300, width = 300;
    map::Loadtype arg = argc > 1 ? (std::string(argv[1]) == "r" || std::string(argv[1]) == "reset"? map::Loadtype::reset : map::Loadtype::load) : map::Loadtype::reset;
    map::Mapper m = map::Mapper(filename, height, width, arg);


  // long long cycStart, cycStop;
  // cycStart = rdtscll();

  /* --------------------------- Put your code here --------------------------- */

	map::shapes::Ellipse e({150, 150}, 100, 150, map::clr::RGB(255, 0, 0), false, true);
	m.draw(e);



	/* -------------------------------------------------------------------------- */

  // cycStop = rdtscll();
  // long diff = cycStop - cycStart;
  // long diffPerPixel = diff / (width*height);
  // fprintf(stderr, "Took %ld cycles to process, or %ld cycles per pixel\n", diff, diff/(width*height));

    return 0;
}