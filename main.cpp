#include "Mapper/Mapper.hpp"
#include "rdtsc.h"


int main(int argc, char** argv){
    if(argc < 2){
        std::cerr << "\033[31mUsage: ./main + <command> (reset/load)" << std::endl;
        return 0;
    }
  long long cycStart, cycStop;
  cycStart = rdtscll();

    int height = 480, width = 720;

    Mapper m = Mapper("output.ppm", "P3", height, width, 255, argv[1]);

    m.fillColor();
    std::vector<Point> pts = {Point(height, 0), Point(height, width), Point(0, width), Point(0, 0), Point(height, 0)};
    m.bezierMultiCurve(pts, 0.01, RGB(255, 255, 255), true);

    // Point pts[] = {Point(height, 0), Point(0, 0), Point(height, width), Point(0, width)};
    // m.bezierCubicCurve(pts);

    

  cycStop = rdtscll();
  long diff = cycStop - cycStart;
  long diffPerPixel = diff / (width*height);
  fprintf(stderr, "Took %ld cycles to process, or %ld cycles per pixel\n", diff, diff/(width*height));

    return 0;    
}