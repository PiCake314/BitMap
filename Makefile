DEP = mains/main.cpp  src/Structs/Renderables/Shapes/*.cpp src/Mapper/Mapper.cpp src/Config/Config.cpp

CC = g++

CVER = -std=c++20
FLAGS = -pthread -c
NoWarn = -Wno-c++98-compat -Wno-switch 
OPT = -O0

EXEC_NAME = mapper_exec

compile: $(DEP)
	find src -name "*.cpp" | xargs $(CC) $(CVER) $(OPT) mains/main.cpp $(FLAGS) -Wall $(NoWarn)


move: $(DEP)
	make compile && mv *.o $(to)


test: unit_tests/test.cpp src/Mapper/Mapper.cpp src/Config/Config.cpp
	$(CC) $(CVER) -o test unit_tests/test.cpp src/Mapper/Mapper.cpp src/Structs/Shapes/*.cpp src/Config/Config.cpp \
	-Wall -Weverything \
	-Wno-switch \
	-Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-documentation \
	-Wno-padded -Wno-double-promotion \
	-Wno-poison-system-directories -Wno-undefined-func-template
	# make image filename=test.ppm && make clean
	# make videodeb filename=test.mp4 h=100 w=100 fps=10 && make clean

clean: 
	rm mapper_exec test

dir:
	mkdir output/pngs; mkdir output/vids; mkdir output/vids/.temp; mkdir sounds

install:
	# brew install ImageMagick && brew install ffmpeg


count:
	find . -name '*.s' | xargs wc -l


wc: $(DEP)
	$(CC) $(CVER) $(OPT) -S $(DEP) -Wall -Wno-attributes; make count; rm *.s


png:
	convert output/ppms/$(filename).ppm output/pngs/$(filename).png