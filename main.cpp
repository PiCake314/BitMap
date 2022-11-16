#include "Mapper/Mapper.hpp"
#include "rdtsc.h"


void drawKuwaitFlag(Mapper &m, int h, int w){
    Point Ps[] = {Point(0, 0), Point(h/3, w/4), Point(2*h/3, w/4), Point(h, 0)};


    m.drawRect(0, 0, 0.3333, 0, RGB(50, 150, 0), "width");
    m.drawRect(0.6666, 0, 0.33333, 0, RGB(255, 0, 0), "width");
    m.drawFourPoints(Ps, RGB());
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


RGB Red(){
    return RGB(255, 0, 0);
}

RGB Green(){
    return RGB(0, 255, 0);
}

RGB Blue(){
    return RGB(0, 0, 255);
}


int getValue(RGB c, std::vector<RGB> cl){
  int s = cl.size();

  for(int i=0; i<s; i++)
    if(c == cl[i]) return i;

  return 0;
}


RGB getColor(Mapper &m, int x, int y, std::vector<RGB> cl){
  
  int n = 0;
  for(int i=-1; i<=1; i++)
    n += getValue(m.getColorAt(Point(x-1, y+i)), cl);


  int mod = cl.size();

  return cl[n%mod];
}


void frac(Mapper &m, int height, int width){
    RGB def = RGB();
    m.fillColor(def);
    m.isSet(false);


    std::vector<RGB> color_list = {def,
      RGB(200, 150, 0), RGB(130, 0, 170), RGB(150, 20, 0), RGB(20, 150, 150), RGB(0, 200, 100)};

    m.drawAt(Point(0, height), color_list[1]);

    for(int i=1; i<height; i++)
      for(int j=1; j<width-1; j++)
        m.drawAt(Point(i, j), getColor(m, i, j, color_list));


    m.setState();
}


int main(int argc, char** argv){
    if(argc < 2){
        std::cerr << "\033[31mUsage: ./main + <command> (reset/load)" << std::endl;
        return 0;
    }
  long long cycStart, cycStop;
  cycStart = rdtscll();

    int height = 10000, width = 10000;
    Mapper m = Mapper("output.ppm", "P3", height, width, 255, argv[1]);
    m.isSet(false);


    m.bezianCruve(Point(height/2, height/10), Point(height/2, 9*height/10), Point(height/10, height/2), RGB(), 0.001);


    m.setState();



  cycStop = rdtscll();
  long diff = cycStop - cycStart;
  long diffPerPixel = diff / (width*height);
  fprintf(stderr, "Took %ld cycles to process, or %ld cycles per pixel\n", diff, diff/(width*height));

    return 0;    
}