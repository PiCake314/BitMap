#include <string_view>
#include <optional>
#include <chrono>

#include "../src/Mapper/Mapper.hpp"

#define DEFAULT_SIZE 500

size_t height = DEFAULT_SIZE, width = DEFAULT_SIZE;


#include "sketch.hpp"


/**
 * @returns true if video, false if image
*/
bool setup(int argc, char **argv, std::string &filename, size_t &h, size_t &w, int &fps, map::Loadtype &arg, bool debug){
	std::string_view argv1 = argv[1];
	std::string_view mode = "image";

	if(argc > 1 && (argv1 == "e" || argv1 == "edit"))
		arg = map::Loadtype::edit;


    if(argc > 3){
		mode = argv[2];
		filename = argv[3];

		if(mode == "video"){
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
		h = std::stoul(argv[4]);
		w = std::stoul(argv[5]);

		if(h == 0) h = DEFAULT_SIZE;
		if(w == 0) w = DEFAULT_SIZE;
	}


	if(debug){
		std::cout << "ARGC: " << argc << std::endl;
		for(int i = 0; i < argc; i++)
			std::cout << "argv[" << i << "]: " << argv[i] << std::endl;
		
		std::cout << "filename: " << filename << std::endl;
	}

	return mode == "video";
}


int main(int argc, char **argv){
	srand(time(NULL));
	/* --------------------------- Meta Data --------------------------- */

    std::string filename = "output.ppm";
	int fps = 0;
    map::Loadtype loadtype = map::Loadtype::reset;

	bool vid = setup(argc, argv, filename, height, width, fps, loadtype, false);

	// std::optional<map::Mapper> m;
	// if(vid) m.emplace(filename, map::Size{width, height}, fps, loadtype);
	// else m.emplace(filename, map::Size{width, height}, loadtype);

	auto m = vid ?
		map::Mapper(filename, map::Size{width, height}, fps, loadtype) :
		map::Mapper(filename, map::Size{width, height}, loadtype);


	/* ----------------------------------------------------------------- */
	auto start = std::chrono::high_resolution_clock::now();

	canvas(m);

	if(vid){
		m.setState();
		m.render(filename);
		m.clearFrames();
	}
	else{
		m.setState();
	}

	auto end = std::chrono::high_resolution_clock::now();

	auto res = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);

	std::clog << "Performance time: " << res.count() << "ms\n";
}
