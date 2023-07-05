#include "../src/Mapper/Mapper.hpp"
// #include "funcs.cpp"
// #include "rdtsc.h"

int height = 500, width = 500;

void setup(int argc, char **argv, std::string &filename, int &h, int &w, int &fps, map::Loadtype &arg, bool debug = false);

int countNeighbors(map::Mapper &m, map::Point p){
	int count = 0;

	for(int i = -1; i <= 1; i++){
		for(int j = -1; j <= 1; j++){
			if(i == 0 && j == 0) continue;

			map::Point p2 = map::Point((width + (int)p.x + i) % width, (height + (int)p.y + j) % height);

			if(m[p2] == map::clr::WHITE){
				count++;
			}
		}
	}

	return count;
}


int main(int argc, char **argv){
	srand(time(NULL));
	/* --------------------------- Meta Data --------------------------- */

    std::string filename = "output.ppm";
	int fps = 0;
    map::Loadtype loadtype = map::Loadtype::reset;

	setup(argc, argv, filename, height, width, fps, loadtype, true);

    map::Mapper m = map::Mapper("output.ppm", {height, width}, fps, loadtype);
	// m.setFPS(fps);


	/* --------------------------- Put your code here --------------------------- */

	using namespace map;
	std::cout << "fps: " << fps << std::endl;
	int seconds = 20;
	int frames = fps * seconds;

	clr::RGB alt[height][width];

	for(auto &pixle : m){
		if(rand() % 100 > 90){
			pixle = clr::WHITE;
		}
		else{
			pixle = clr::BLACK;
		}
	}

	for(int frame = 0; frame <= frames; frame++){
		for(int i = 0; i < height; i++){
			for(int j = 0; j < width; j++){
				alt[i][j] = m[Point(i, j)];
			}
		}

		
		for(int i = 0; i < height; i++){
			for(int j = 0; j < width; j++){
				Point p = Point(i, j);
				int neighbors = countNeighbors(m, p);

				if(neighbors < 2 || neighbors > 3){
					alt[i][j] = clr::BLACK;
				}
				else if(neighbors == 3){
					alt[i][j] = clr::WHITE;
				}
			}
		}

		for(int i = 0; i < height; i++){
			for(int j = 0; j < width; j++){
				m[Point(i, j)] = alt[i][j];
			}
		}
		std::cout << "frame: " << frame << '/' << frames << std::endl;
		m.setState();
		m.saveFrame();
	}



	m.render(filename);
	m.clearFrames();

	/* -------------------------------------------------------------------------- */
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

