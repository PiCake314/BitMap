#include "../src/Mapper/Mapper.hpp"
#include "../src/Enums/RectAlignment.hpp"

/* ---------------------- Fractal example starts here! ---------------------- */
int getValue(map::clr::RGB c, std::vector<map::clr::RGB> cl){
  int s = cl.size();

  for(int i=0; i<s; i++)
    if(c == cl[i]) return i;

  return 0;
}


map::clr::RGB getColor(map::Mapper &m, int x, int y, std::vector<map::clr::RGB> cl){
  int n = 0;
  for(int i=-1; i<=1; i++)
    n += getValue(m.getColorAt(map::Point(x-1, y+i)), cl);


  int mod = cl.size();

  return cl[n%mod];
}


void fract(map::Mapper &m, int height, int width){
    map::clr::RGB def = map::clr::RGB();
    m.fillColor(def);
    m.setState();


    std::vector<map::clr::RGB> color_list = {def,
      map::clr::RGB(200, 150, 0), map::clr::RGB(130, 0, 170), map::clr::RGB(150, 20, 0),
      map::clr::RGB(20, 150, 150), map::clr::RGB(0, 200, 100)};

    m.drawAt(map::Point(0, height), color_list[1]);

    for(int i=1; i<height; i++)
      for(int j=1; j<width-1; j++)
        m.drawAt(map::Point(i, j), getColor(m, i, j, color_list));


    m.setState();
}



/* ------------------------ Circle Recursion example ------------------------ */
void circRec(map::Mapper &m, int x, int y, int r){
    m.drawCircle(map::Point(x, y), r, map::clr::RGB(200, 150, 0), false);

    if(r > 10){
      circRec(m, x, y + 50, r*.75);
      circRec(m, x, y - 50, r*.75);
    }
}


/* ----------------------- Triangle Recursion example ----------------------- */
void triRec(map::Mapper &m, map::Point p1, map::Point p2, map::Point p3, int n){
    m.drawTri(p1, p2, p3, map::clr::GREEN);

    if(p1.x < 720){
      p1.x += 10, p2.x -= 10, p3.x -= 10;
      p2.y += 5, p3.y -= 5;
      triRec(m, p1, p2, p3, n+1);
    }
}


/* ----------------------- Rectangle Recursion example ---------------------- */
void rectRec(map::Mapper &m, int t, int l, int side){
    m.drawRect(map::Point(t, l), side, side, map::clr::BLUE, false);

    if(side > 50){
      rectRec(m, t - 100, l - 100, side*.75);
      rectRec(m, t - 100, l + 100, side*.75);
      rectRec(m, t + 100, l - 100, side*.75);
      rectRec(m, t + 100, l + 100, side*.75);
    }
}


/* ------------------------------- Kuwait flag ------------------------------ */
void drawKuwaitFlag(map::Mapper &m, int h, int w){
    map::Point Ps[] = {map::Point(0, 0), map::Point(h/3, w/4), map::Point(2*h/3, w/4), map::Point(h, 0)};

    m.drawRect(map::Point(1.0/6, 0), 0.3333, 0, map::clr::RGB(50, 150, 0), true, 1, map::RectAlignment::Rwidth);
    m.drawRect(map::Point(5.0/6, 0), 0.34, 0, map::clr::RGB(255, 0, 0), true, false, map::RectAlignment::Rwidth);
    m.drawFourPoints(Ps, map::clr::RGB());
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

/* -------------------------------- MandelBrot ------------------------------ */

void MandelBrot(map::Mapper &m, int height, int width){
  const int  MAX_BOUND = 255;

  const float minR = -2, maxR = 2;
  const float minI = -2, maxI = 2;
  // int c = 1;

  map::clr::RGB rainbow[7] = {
    map::clr::RGB(148, 0, 211),
    map::clr::RGB(75, 0, 130),
    map::clr::RGB(0, 0, 255),
    map::clr::RGB(0, 255, 0),
    map::clr::RGB(255, 255, 0),
    map::clr::RGB(255, 127, 0),
    map::clr::RGB(255, 0, 0)
  };

  m.noSet();
  m.fillWhite();

	for(int i = 0; i < height; i++){
		for(int j = 0; j < width; j++){

      double cr = i * ((maxR - minR)/width) + minR;
      double ci = j * ((maxI - minI)/height) + minI;

      Complex z;

      int n;
      for(n = 0; n < MAX_BOUND && z.mag() < 2; n++)
        z = z * z + Complex(cr, ci);


      // use with MAX_BOUND = 10
			// int RGBValue = (n % 256);
      // if(n < 3) m.drawAt({j, i} , map::clr::RGB(0, 0, 0));
      // else if(n < 10) m.drawAt({j, i} , rainbow[n-3]);
      // else m.drawAt({j, i} , map::clr::RGB(RGBValue, RGBValue, RGBValue));
      // m.drawAt({j, i} , map::clr::RGB(n*25, n*25, n*25));
      // m.drawAt({j, i} , rainbow[n%7]);
      // m.drawAt({j, i} , map::clr::RGB(n, n, n));

      // if(n == MAX_BOUND) m.drawAt({j, i} , map::clr::RGB(255, 255, 255));
      // else m.drawAt({j, i});

		}
	}
  m.setState();

}


void julia(map::Mapper &m, int height, int width){
  const int  MAX_BOUND = 140;

  const float minR = -2, maxR = 2;
  const float minI = -2, maxI = 2;

  map::clr::RGB rainbow[7] = {
    map::clr::RGB(148, 0, 211),
    map::clr::RGB(75, 0, 130),
    map::clr::RGB(0, 0, 255),
    map::clr::RGB(0, 255, 0),
    map::clr::RGB(255, 255, 0),
    map::clr::RGB(255, 127, 0),
    map::clr::RGB(255, 0, 0)
  };

  m.noSet();
  m.fillWhite();

	for(int i = 0; i < height; i++){
		for(int j = 0; j < width; j++){

      double cr = i * ((maxR - minR)/width) + minR;
      double ci = j * ((maxI - minI)/height) + minI;
      Complex c((i * ((maxR - minR)/width) + minR), (j * ((maxI - minI)/height) + minI));

      // −0.7269 + 0.1889
      c = Complex(-0.7269, .1889);

      Complex z;
      z = Complex(cr, ci);

      int n;
      for(n = 0; n < MAX_BOUND && z.mag() < 2; n++)
        z = z * z + c;



      if(n == MAX_BOUND) m.drawAt({j, i} , map::clr::RGB(255, 255, 255));
      else m.drawAt({j, i});

		}
	}
  m.setState();
}


void findPi(){
  Complex epsilon(0, .01);
  Complex c = (Complex(-.75, 0) + epsilon);

  Complex z;
  long long n;
  for(n = 0; z.R < 2; n++) z = (z * z) + c;
  

  std::cout << "π: " << n << std::endl;
}

void setPlane(map::Mapper &m, int height, int width){
  m.drawLine({height/2, 0}, {height/2, width}, map::clr::RGB(), true);
  m.drawLine({0, width/2}, {height, width/2}, map::clr::RGB(), true);
}

void drawHeart(map::Mapper &m){
  double (*func)(double, double) = [](double x, double y){
    return (((x*x)/1000 + (y*y)/1000 - 10) *((x*x)/1000 + (y*y)/1000 - 10) *((x*x)/1000 + (y*y)/1000 - 10));
  };

  double (*res)(double, double) = [](double x, double y){
    return ((x*x*y*y*y)/10000000);
  };

  m.plotXY(func, res, map::clr::RED);
}



// ------------------------------- Video -------------------------------- //
int vid(map::Mapper &m, int fps, std::string filename){
  

	std::cout << "FPS: " << fps << std::endl;

	map::shapes::Circle c(map::Point(100, 100), 50, map::clr::RGB(255, 0, 0), true);

	m.noSet();
	for(int i = 0; i < fps; i++){
		m.setFile("FirstVid/f" + std::to_string(i+1) + ".ppm");

		m.fillWhite();
		c.center = map::Point(100, 100 + i*(850/24));
		m.draw(c);
		m.rotate(map::Rotate::ccw);

		m.setState();
		std::system(("convert output/FirstVid/f" + std::to_string(i+1) + ".ppm output/FirstVid/f" + std::to_string(i+1) + ".png").c_str());
		std::system(("rm output/FirstVid/f" + std::to_string(i+1) + ".ppm").c_str());
	}

	std::system(("ffmpeg -r 24 -f image2 -s 1000x1000 -i output/FirstVid/f%d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p output/" + filename).c_str());
	std::system("rm output/FirstVid/f*.png");
}