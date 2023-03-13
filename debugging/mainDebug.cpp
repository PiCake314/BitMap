#include "../Mapper/Mapper.hpp"
#include "funcs.cpp"
// #include "rdtsc.h"


int main(int argc, char** argv){
    using String = std::string;
    using std::cout, std::cin;


    int height = 1000, width = 1000;
    map::Type arg = argc > 1 ? (std::string(argv[1]) == "r" || std::string(argv[1]) == "reset"? map::Type::reset : map::Type::load) : map::Type::reset;
    map::Mapper m = map::Mapper("FirstVid/f1.ppm", height, width, arg);

  // long long cycStart, cycStop;
  // cycStart = rdtscll();

  /* --------------------------- Put your code here --------------------------- */

  m.noSet();
  for(int i = 0; i < 24; i++){
    m.fillWhite();
    m.drawCircle(Point(100, 100 + i*(850/24)), 50, clr::RGB(255, 0, 0), true);

    m.setState();
    m.setFile("FirstVid/f" + std::to_string(i+2) + ".ppm");
    std::system(("convert images/FirstVid/f" + std::to_string(i+1) + ".ppm images/FirstVid/f" + std::to_string(i+1) + ".png").c_str());
    std::system(("rm images/FirstVid/f" + std::to_string(i+1) + ".ppm").c_str());
  }

  /* -------------------------------------------------------------------------- */
// ffmpeg -r 24 -f image2 -s 1000x1000 -i images/FirstVid/f%d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p images/FirstVid/Res.mp4

  // cycStop = rdtscll();
  // long diff = cycStop - cycStart;
  // long diffPerPixel = diff / (width*height);
  // fprintf(stderr, "Took %ld cycles to process, or %ld cycles per pixel\n", diff, diff/(width*height));

    return 0;
}