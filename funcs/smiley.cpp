
void drawSmileyFace(Mapper &m, int height){
    m.fillColor(RGB(50, 50, 50));
    m.drawCircle(0, 0, 0.4*height, RGB(200, 150, 0), true, false, "center");

    m.drawEllipse(0.3*height, 0.3*height, 0.1*height, 0.05*height, RGB());

    m.drawEllipse(0.3*height, 0.7*height-2*(0.05*height), 0.1*height, 0.05*height, RGB());

    m.drawLine(Point(0.55*height, 0.5*height), Point(0.62*height, 0.5*height), RGB(), true);

    std::vector<Point> smile = {Point(0.7*height, 0.3*height), Point(0.78*height, 0.4*height), Point(0.8*height, 0.5*height), Point(0.78*height, 0.6*height),  Point(0.7*height, 0.7*height)};

    m.drawMulti(smile, RGB(), true);
}
