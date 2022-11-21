#include "Mapper/Mapper.hpp"
#include "rdtsc.h"


void circRec(map::Mapper &m, int x, int y, int r){
    m.drawCircle(x, y, r, clr::RGB(200, 150, 0), false);

    if(r > 10){
      circRec(m, x, y + 50, r*.75);
      circRec(m, x, y - 50, r*.75);
    }
}


void triRec(map::Mapper &m, Point p1, Point p2, Point p3, int n){
    m.drawTri(p1, p2, p3, clr::GREEN);
    // std::cin.get();

    std::cout << m.dist(p1, p2) << std::endl;
    if(p1.x < 720){
      p1.x += 10, p2.x -= 10, p3.x -= 10;

      std::cout << "N: " << n << std::endl;
      std::cout << "P1.X: " << p1.x << ", " << "P2.X: " << p2.x << std::endl;

      p2.y += 5, p3.y -= 5;
      triRec(m, p1, p2, p3, n+1);
    }
}


void rectRec(map::Mapper &m, int t, int l, int side){
    m.drawRect(t, l, side, side, clr::BLUE);

    if(side > 2){
      rectRec(m, t + 10, l - 10, side*.75);
      rectRec(m, t + 10, l + 10, side*.75);
    }
}


int main(int argc, char** argv){
    if(argc < 2){
        std::cerr << "\033[31mUsage: ./main + <command> (reset/load)" << std::endl;
        return 0;
    }
  long long cycStart, cycStop;
  cycStart = rdtscll();

    int height = 1080, width = 2160;
    map::Mapper m = map::Mapper("s4.ppm", "P3", height, width, 255, argv[1]);

    m.fillColor();

    m.noSet();
    // m.drawRect(0, 0, -1, -1, clr::BLUE, false, false, "");
    circRec(m, height/2, width/2, height/2);
    m.setState();



    // m.drawCircle(height/2, width/2, -1, clr::RED, 1, false, 10);
    // triRec(m, Point(height/10, width/2), Point(height*9/10, width/10), Point(height*9/10, width*9/10), 1);



  cycStop = rdtscll();
  long diff = cycStop - cycStart;
  long diffPerPixel = diff / (width*height);
  fprintf(stderr, "Took %ld cycles to process, or %ld cycles per pixel\n", diff, diff/(width*height));

    return 0;    
}