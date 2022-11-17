

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
