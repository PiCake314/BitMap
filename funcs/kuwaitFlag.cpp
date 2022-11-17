

void drawKuwaitFlag(Mapper &m, int h, int w){
    Point Ps[] = {Point(0, 0), Point(h/3, w/4), Point(2*h/3, w/4), Point(h, 0)};


    m.drawRect(0, 0, 0.3333, 0, RGB(50, 150, 0), "width");
    m.drawRect(0.6666, 0, 0.33333, 0, RGB(255, 0, 0), "width");
    m.drawFourPoints(Ps, RGB());
}
