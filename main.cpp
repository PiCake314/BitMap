#include "Mapper/Mapper.hpp"
#include "rdtsc.h"


void drawKuwaitFlag(Mapper &m, int h){
    m.drawRect(0, 0, 0.33, 0, RGB(0, 255, 0), "width");

    m.drawRect(0.67, 0, 0.33, 0, RGB(255, 0, 0), "width");

    m.drawCircle(0, -h/2, h/2, RGB(0, 0, 0));
}


int main(int argc, char** argv){
    if(argc < 2){
        std::cerr << "\033[31mUsage: ./main + <command> (reset/load)" << std::endl;
        return 0;
    }
    int height = 100, width = 200;
    Mapper m("output.ppm", "P3", height, width, 255, argv[1]);
    
  long long cycStart, cycStop;
  cycStart = rdtscll();
  
  m.fillColor();
  m.drawRect(0, 0, 0.33, 0, RGB(0, 255, 0), "width");
  m.drawRect(0.33, 0, 0.34, 0, RGB(255, 255, 255), "width");
  m.drawRect(0.67, 0, 0.33, 0, RGB(255, 0, 0), "width");
  std::vector<Point> p = {Point(0, 0), Point(height/3.0f, 40), Point(height/1.5, 40), Point(100, 0)};
  m.drawMulti(p, RGB(), true);


  cycStop = rdtscll();
  long diff = cycStop - cycStart;
  long diffPerPixel = diff / (width*height);
  fprintf(stderr, "Took %ld cycles to process, or %ld cycles per pixel\n", diff, diff/(width*height));

    return 0;    
}