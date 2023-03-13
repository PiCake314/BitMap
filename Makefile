

deb: debugging/mainDebug.cpp Mapper/Mapper.cpp
	g++ -std=c++20 -o main debugging/mainDebug.cpp Mapper/Mapper.cpp -O3 && ./main r


mapper: mains/main.cpp Mapper/Mapper.cpp
	g++ -std=c++17 -o main mains/main.cpp Mapper/Mapper.cpp -O3 && ./main r && convert images/output.ppm images/output.png


vidoeDebug: debugging/mainDebug.cpp Mapper/Mapper.cpp
	g++ -std=c++20 -o main debugging/mainDebug.cpp Mapper/Mapper.cpp -O3 && ./main r


video: mains/main.cpp Mapper/Mapper.cpp
	echo $(var1)

clean: 
	rm main