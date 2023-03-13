

deb: debugging/mainDebug.cpp src/Mapper/Mapper.cpp
	g++ -std=c++20 -o main debugging/mainDebug.cpp src/Mapper/Mapper.cpp -O3 && ./main r


mapper: mains/main.cpp src/Mapper/Mapper.cpp
	g++ -std=c++17 -o main mains/main.cpp src/Mapper/Mapper.cpp -O3 && ./main r && convert images/output.ppm images/output.png


videodeb: debugging/mainDebug.cpp src/Mapper/Mapper.cpp
	g++ -std=c++20 -o main debugging/mainDebug.cpp src/Mapper/Mapper.cpp -O3 && ./main r video def$(filename) 0$(fps)


image: debugging/mainDebug.cpp src/Mapper/Mapper.cpp
	g++ -std=c++20 -o main debugging/mainDebug.cpp src/Mapper/Mapper.cpp -O3 && ./main r image def$(filename)


video: mains/main.cpp src/Mapper/Mapper.cpp
	echo $(var1)


install:
	brew install ImageMagick && brew install ffmpeg


clean: 
	rm main