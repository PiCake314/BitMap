#include <iostream>
// #include <fstream>

extern "C" {
    #define STB_IMAGE_IMPLEMENTATION
    #include "stb_image.h"
}


int main(){
    std::string filename = "images/Zelda.png";

    // fstream file(filename);

    // if(!file.is_open()){
    //     cout << "NOT OPEN" << endl;
    //     return 0;
    // }

    // ... x = width, y = height, n = # 8-bit components per pixel ...
    // ... replace '0' with '1'..'4' to force that many components per pixel
    // ... but 'n' will always be the number that it would have been if you said 0

    int x,y,n;
    unsigned char *data = stbi_load(filename.c_str(), &x, &y, &n, 0);
    
    if (data != nullptr && x > 0 && y > 0)
    {
        if (n == 3)
        {
            
            std::cout << "First pixel: RGB "
                      << static_cast<int>(data[0]) << " "
                      << static_cast<int>(data[1]) << " "
                      << static_cast<int>(data[2]);
        }
        else if (n == 4)
        {
            std::cout << "First pixel: RGBA "
                      << static_cast<int>(data[0]) << " "
                      << static_cast<int>(data[1]) << " "
                      << static_cast<int>(data[2]) << " "
                      << static_cast<int>(data[3]) << '\n';
        }
    }
    else{
        std::cout << "Fuck!" << std::endl;
    }

    stbi_image_free(data);
}