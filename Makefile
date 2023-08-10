

compile: mains/main.cpp src/Mapper/Mapper.cpp
	g++ -std=c++20 -o main mains/main.cpp src/Mapper/Mapper.cpp -Wall

video:  mains/main.cpp src/Mapper/Mapper.cpp
	g++ -std=c++20 -o main mains/main.cpp src/Mapper/Mapper.cpp -O3 && ./main r video def$(filename) 0$(h) 0$(w) 0$(fps)


image: mains/main.cpp src/Mapper/Mapper.cpp
	g++ -std=c++20 -o main mains/main.cpp src/Mapper/Mapper.cpp -O3 && ./main r image def$(filename) 0$(h) 0$(w)


test:
	make videodeb filename=test.mp4 h=100 w=100 fps=10 && rm main


clean: 
	rm main


install:
	brew install ImageMagick && brew install ffmpeg