
NoWarn = -Wno-attributes -Wno-unused-result -Wno-attributes


compile: mains/main.cpp src/Mapper/Mapper.cpp
	g++ -std=c++20 -o main mains/main.cpp src/Mapper/Mapper.cpp src/Structs/Shapes/*.cpp -Wall -Wno-attributes
	# -Wextra -Weverything -Wno-c++98-compat


video:  mains/main.cpp src/Mapper/Mapper.cpp
	g++ -std=c++20 -o main mains/main.cpp src/Mapper/Mapper.cpp src/Structs/Shapes/*.cpp $(NoWarn) -O3 && ./main r video def$(filename) 0$(h) 0$(w) 0$(fps)


image: mains/main.cpp src/Mapper/Mapper.cpp
	g++ -std=c++20 -o main mains/main.cpp src/Mapper/Mapper.cpp src/Structs/Shapes/*.cpp $(NoWarn) -O3 && ./main r image def$(filename) 0$(h) 0$(w)


test: unit_tests/test.cpp src/Mapper/Mapper.cpp
	g++ -std=c++20 -o test unit_tests/test.cpp src/Mapper/Mapper.cpp src/Structs/Shapes/*.cpp -Wall -Wextra && ./test
	# make image filename=test.ppm && make clean
	# make videodeb filename=test.mp4 h=100 w=100 fps=10 && make clean


clean: 
	rm main test


install:
	mkdir output; mkdir output/ppms; output/pngs;
	# brew install ImageMagick && brew install ffmpeg