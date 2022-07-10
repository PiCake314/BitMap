#include <iostream>
#include <fstream>
#include <stdio.h>
#include <time.h>


using namespace std;


int main(){
    srand(time(NULL));

    ofstream file("test.ppm");

    file << "P3\n";
    //545 x 702
    file << 100 << " " << 100 << '\n';
    file << "255\n";

    int x = 0;

    for(int i=0; i<100; i++)
        for(int j=0; j<100; ++j)
            file << 255 << " " << 256 << " " << 0 << " ";

}