#include "Mapper/Mapper.hpp"
#include "rdtsc.h"


int main(int argc, char** argv){
    if(argc < 2){
        std::cerr << "\033[31mUsage: ./main + <command> (reset/load)" << std::endl;
        return 0;
    }
  long long cycStart, cycStop;
  cycStart = rdtscll();

    int height = 500, width = 1000;
    map::Mapper m = map::Mapper("output.ppm", "P3", height, width, 255, argv[1]);


    // m.drawRect(0, 0, 0.3333, 0, clr::RGB(50, 150, 0), "width");
    // m.drawRect(0.6666, 0, 0.33333, 0,clr:: RGB(255, 0, 0), "width");
    // Point Ps[] = {Point(0, 0), Point(height/3, width/4), Point(2*height/3, width/4), Point(height, 0)};
    // m.drawFourPoints(Ps, clr::RGB());

    // std::cin.get();

    m.drawLine(Point(0, 0), Point(height, width));


  cycStop = rdtscll();
  long diff = cycStop - cycStart;
  long diffPerPixel = diff / (width*height);
  fprintf(stderr, "Took %ld cycles to process, or %ld cycles per pixel\n", diff, diff/(width*height));

    return 0;    
}