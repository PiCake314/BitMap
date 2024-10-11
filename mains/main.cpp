#include <string>
#include <filesystem>
#include <optional>
#include <chrono>
#include <dlfcn.h>

// #include <Mapper.hpp>
#include "../src/Mapper/Mapper.hpp"




/**
 * @returns true if video, false if image
*/
bool setup(int argc, char **argv, std::filesystem::path &filename, size_t &fps){
	filename = argv[2];
	if(filename.empty()) throw std::runtime_error("Invalid output filename");

	map::Config::width = std::stoul(argv[3]);
	map::Config::height = std::stoul(argv[4]);


	constexpr size_t DEFAULT_SIZE = 512;
	if(map::Config::width <= 0) map::Config::width = DEFAULT_SIZE;
	if(map::Config::height <= 0) map::Config::height = DEFAULT_SIZE;

	const auto ext = filename.extension();
	bool vid = ext == ".mp4";

	if(vid){
		assert(argc >= 6);
		fps = std::stoul(argv[5]);
		if(fps <= 0) fps = 24;
	}
	else assert(ext == ".ppm");

	return vid;
}

#ifndef DYLIB
extern "C" void canvas(map::Mapper&, size_t, size_t);
#endif


int main(int argc, char **argv){

	if(argc <= 4){
		std::cerr << "ERROR: Not enough arguments\n";
		std::cerr << "Usage: " << argv[0] << " <input file> <output file> <height> <width> <fps(opt)>\n";
		return 1;
	}

	srand(time(NULL));
	/* ---------------------------- Set Up ---------------------------- */

    std::filesystem::path filename;
	size_t fps{};

	bool vid = setup(argc, argv, filename, fps);


	/* ------------------------ Loading Canvas ------------------------ */


	#ifdef DYLIB
	void *handle = dlopen(argv[1], RTLD_LAZY);
	if(not handle){
		std::cerr << "Error loading library: " << dlerror() << '\n';
		return 1;
	}

	const auto canvas = reinterpret_cast<void (*)(map::Mapper&, size_t, size_t)>(dlsym(handle, "canvas"));

	if(char *err = dlerror(); err){
		std::cerr << "Error loading symbol: " << err << '\n';
		dlclose(handle);
		return 1;
	}
	#endif

	/* ---------------------------------------------------------------- */

	// Creating the mapper object
	auto m = vid ?
		map::Mapper(filename, map::Size{map::Config::width, map::Config::height}, fps):
		map::Mapper(filename, map::Size{map::Config::width, map::Config::height});


	/* ---------------------------------------------------------------- */
	auto start = std::chrono::high_resolution_clock::now();

	canvas(m, map::Config::width, map::Config::height);

	m.setState();

	if(vid){ // extra steps for video
		m.render();
		m.clearFrames();
	}


	const auto end = std::chrono::high_resolution_clock::now();
	auto res = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);

	std::clog << "Performance time: " << res.count() << "ms\n";


	#ifdef DYLIB
	dlclose(handle);
	#endif
}
