DEP = mains/main.cpp src/Structs/Shapes/*.cpp src/Mapper/Mapper.cpp

CC = g++

CVER = -std=c++20
FLAGS = -pthread
NoWarn = -Wno-attributes -Wno-unused-result -Wno-attributes -Wno-sign-compare
OPT = -O0


compile: $(DEP)
	$(CC) $(CVER) -o main $(DEP) $(FLAGS) -Wall -Wno-attributes $(NoWarn)
	# -Wextra -Weverything -Wno-c++98-compat


video: $(DEP)
	$(CC) $(CVER) -o main $(DEP) $(NoWarn) $(OPT) && ./main r video def$(filename) 0$(h) 0$(w) 0$(fps)


image: $(DEP)
	$(CC) $(CVER) -o main $(DEP) $(FLAGS) $(NoWarn) $(OPT) && ./main r image def$(filename) 0$(h) 0$(w)


run_image: $(DEP)
	./main r image def$(filename) 0$(h) 0$(w)


test: unit_tests/test.cpp src/Mapper/Mapper.cpp
	$(CC) $(CVER) -o test unit_tests/test.cpp src/Mapper/Mapper.cpp src/Structs/Shapes/*.cpp \
	-Wall -Weverything \
	-Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-documentation \
	-Wno-padded -Wno-double-promotion \
	-Wno-poison-system-directories -Wno-undefined-func-template
	# make image filename=test.ppm && make clean
	# make videodeb filename=test.mp4 h=100 w=100 fps=10 && make clean

clean: 
	rm main test

dir:
	mkdir output; mkdir output/ppms; mkdir output/pngs; mkdir output/vids; mkdir output/vids/.temp; mkdir sounds

install:
	# brew install ImageMagick && brew install ffmpeg


count:
	find . -name '*.s' | xargs wc -l


wc: $(DEP)
	$(CC) $(CVER) $(OPT) -S $(DEP) -Wall -Wno-attributes; make count; rm *.s


png:
	convert output/ppms/$(filename).ppm output/pngs/$(filename).png