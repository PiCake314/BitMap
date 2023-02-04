#include "../Mapper/Mapper.hpp"
#include "rdtsc.h"



/* ---------------------- Fractal example starts here! ---------------------- */
int getValue(clr::RGB c, std::vector<clr::RGB> cl){
  int s = cl.size();

  for(int i=0; i<s; i++)
    if(c == cl[i]) return i;

  return 0;
}


clr::RGB getColor(map::Mapper &m, int x, int y, std::vector<clr::RGB> cl){
  int n = 0;
  for(int i=-1; i<=1; i++)
    n += getValue(m.getColorAt(Point(x-1, y+i)), cl);


  int mod = cl.size();

  return cl[n%mod];
}


void fract(map::Mapper &m, int height, int width){
    clr::RGB def = clr::RGB();
    m.fillColor(def);
    m.setState();


    std::vector<clr::RGB> color_list = {def,
      clr::RGB(200, 150, 0), clr::RGB(130, 0, 170), clr::RGB(150, 20, 0),
      clr::RGB(20, 150, 150), clr::RGB(0, 200, 100)};

    m.drawAt(Point(0, height), color_list[1]);

    for(int i=1; i<height; i++)
      for(int j=1; j<width-1; j++)
        m.drawAt(Point(i, j), getColor(m, i, j, color_list));


    m.setState();
}



/* ------------------------ Circle Recursion example ------------------------ */
void circRec(map::Mapper &m, int x, int y, int r){
    m.drawCircle(Point(x, y), r, clr::RGB(200, 150, 0), false);

    if(r > 10){
      circRec(m, x, y + 50, r*.75);
      circRec(m, x, y - 50, r*.75);
    }
}


/* ----------------------- Triangle Recursion example ----------------------- */
void triRec(map::Mapper &m, Point p1, Point p2, Point p3, int n){
    m.drawTri(p1, p2, p3, clr::GREEN);

    if(p1.x < 720){
      p1.x += 10, p2.x -= 10, p3.x -= 10;
      p2.y += 5, p3.y -= 5;
      triRec(m, p1, p2, p3, n+1);
    }
}


/* ----------------------- Rectangle Recursion example ---------------------- */
void rectRec(map::Mapper &m, int t, int l, int side){
    m.drawRect(Point(t, l), side, side, clr::BLUE, false);

    if(side > 50){
      rectRec(m, t - 100, l - 100, side*.75);
      rectRec(m, t - 100, l + 100, side*.75);
      rectRec(m, t + 100, l - 100, side*.75);
      rectRec(m, t + 100, l + 100, side*.75);
    }
}


/* ------------------------------- Kuwait flag ------------------------------ */
void drawKuwaitFlag(map::Mapper &m, int h, int w){
    Point Ps[] = {Point(0, 0), Point(h/3, w/4), Point(2*h/3, w/4), Point(h, 0)};

    m.drawRect(Point(1.0/6, 0), 0.3333, 0, clr::RGB(50, 150, 0), true, 1, map::RectAlignment::width);
    m.drawRect(Point(5.0/6, 0), 0.34, 0, clr::RGB(255, 0, 0), true, false, map::RectAlignment::width);
    m.drawFourPoints(Ps, clr::RGB());
}


/* ------------------------------- Chess board ------------------------------ */
void draeChessBoard(map::Mapper &m, int h, int w){
  m.noSet();

  bool flag = false;
  for(int offX = 0; offX < h; offX += h/8){
    flag = !flag;
    for(int offY = 0; offY < w; offY += w/8){
      if(flag) m.drawRect({offX + h/16, offY + w/16}, h/8, w/8);
      flag = !flag;
    }
  }
  m.setState();

}




int main(int argc, char** argv){
    using String = std::string;
    using std::cout, std::cin;


    int height = 1024, width = 1024;
    map::Type arg = argc > 1 ? (argv[1] == "r" || argv[1] == "reset"? map::Type::reset : map::Type::load) : map::Type::reset;
    map::Mapper m = map::Mapper("debug.ppm", height, width, arg);

  long long cycStart, cycStop;
  cycStart = rdtscll();

  /* --------------------------- Put your code here --------------------------- */

  m.bezierMultiCurve({{0, 0}, {0, width/2}, {height, width/2}, {height, 0}, {0, 0}}, 0.01, clr::RGB(254, 194, 236), true);
  m.fold(map::Fold::l2r);
  m.drawEllipse(150, 400, 350, 112, clr::RGB(254, 194, 236), true, false, map::Alignment::center);

  /* -------------------------------------------------------------------------- */

  cycStop = rdtscll();
  long diff = cycStop - cycStart;
  long diffPerPixel = diff / (width*height);
  fprintf(stderr, "Took %ld cycles to process, or %ld cycles per pixel\n", diff, diff/(width*height));

    return 0;
}