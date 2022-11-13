#include "Mapper/Mapper.hpp"
#include "rdtsc.h"


void drawKuwaitFlag(Mapper &m, int h, int w){
    m.drawRect(0, 0, 0.33, 0, RGB(120, 200, 0), "width");
    m.drawRect(0.67, 0, 0.33, 0, RGB(255, 0, 0), "width");
    // m.drawCircle(0, -h/2, h/2, RGB(0, 0, 0));

    // m.drawMulti({Point(0, 0),
    //              Point(h/3, w/4),
    //              Point(2*h/3, w/4),
    //              Point(h, 0),
                 
    //   });

    Point Ps[] = {Point(0, 0), Point(h/3, w/4), Point(2*h/3, w/4), Point(h, 0)};
    m.drawFourPoints(Ps);
}


void drawSmileyFace(Mapper &m, int height){
    m.fillColor(RGB(50, 50, 50));
    m.drawCircle(0, 0, 0.4*height, RGB(200, 150, 0), true, false, "center");

    m.drawEllipse(0.3*height, 0.3*height, 0.1*height, 0.05*height, RGB());

    m.drawEllipse(0.3*height, 0.7*height-2*(0.05*height), 0.1*height, 0.05*height, RGB());

    m.drawLine(Point(0.55*height, 0.5*height), Point(0.62*height, 0.5*height), RGB(), true);

    std::vector<Point> smile = {Point(0.7*height, 0.3*height), Point(0.78*height, 0.4*height), Point(0.8*height, 0.5*height), Point(0.78*height, 0.6*height),  Point(0.7*height, 0.7*height)};

    m.drawMulti(smile, RGB(), true);
}

int main(int argc, char** argv){
    if(argc < 2){
        std::cerr << "\033[31mUsage: ./main + <command> (reset/load)" << std::endl;
        return 0;
    }
  long long cycStart, cycStop;
  cycStart = rdtscll();

    int height = 250, width = 500;
    Mapper m("output.ppm", "P3", height, width, 255, argv[1]);


    // m.drawCircle(0, 0, 50, RGB(150, 0, 200), true, false, "center");

    drawKuwaitFlag(m, height, width);
    // Point Ps[] = {Point(20, 30), Point(50, 220), Point(190, 230), Point(180,30)};
    // m.drawFourPoints(Ps);
  


  cycStop = rdtscll();
  long diff = cycStop - cycStart;
  long diffPerPixel = diff / (width*height);
  fprintf(stderr, "Took %ld cycles to process, or %ld cycles per pixel\n", diff, diff/(width*height));

    return 0;    
}