
DIR = mains

deb: mainDebug.cpp Mapper/Mapper.cpp
	g++ -std=c++17 -o main DIR/mainDebug.cpp Mapper/Mapper.cpp -O3 && ./main r && convert images/output.ppm images/output.png


mapper: mains/main.cpp Mapper/Mapper.cpp
	g++ -std=c++17 -o main DIR/main.cpp Mapper/Mapper.cpp -O3 && ./main r && convert images/output.ppm images/output.png


clean: 
	rm main