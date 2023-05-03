

deb: debugging/mainDebug.cpp src/Mapper/Mapper.cpp
	g++ -std=c++20 -o main debugging/mainDebug.cpp src/Mapper/Mapper.cpp  && ./main r image def$(filename) 0$(h) 0$(w)


# mapper: mains/main.cpp src/Mapper/Mapper.cpp
# 	g++ -std=c++17 -o main mains/main.cpp src/Mapper/Mapper.cpp -O3 && ./main r && convert output/output.ppm images/output.png


videodeb: debugging/mainDebug.cpp src/Mapper/Mapper.cpp
	g++ -std=c++20 -o main debugging/mainDebug.cpp src/Mapper/Mapper.cpp -O3 && ./main r video def$(filename) 0$(h) 0$(w) 0$(fps)


video: mains/main.cpp Mapper/Mapper.cpp
	echo $(var1)

clean: 
	rm main