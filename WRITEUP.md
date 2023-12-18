# BitMap: The Battle against threads

## Experimental Results:
    - Changes in speeds of rendering can be seen immediately with drawing as low as 4 shapes and as low a resolution as 500x500 with no slowdowns on lower resolutions.
    - We can see speedups of up to 2x with 4 threads and 4 shapes, and up to 3x with 4 threads and 8 shapes.

## Basic Testing:
    Here is a table the summerizes the perofrmance of the program with different numbers of shapes and canvas sizes with 1 thread:
| Shape                       | Amount | Size      | Threads | Time    |
|-----------------------------|--------|-----------|---------|---------|
| Circle (r < 100 & unfilled) | 10,000 | 250x250   | 1       | 2.110s  |
| Circle (r < 100 & filled)   | 10,000 | 250x250   | 1       | 0.758s  |
| Circle (r < 500 & unfilled) | 10,000 | 1000x1000 | 1       | 43.843s |
| Circle (r < 500 & filled)   | 10,000 | 1000x1000 | 1       | 14.696s |
| Rect (w,h < 100 & unfilled) | 10,000 | 250x250   | 1       | 0.573s  |
| Rect (w,h < 100 & filled)   | 10,000 | 250x250   | 1       | 0.383s  |
| Rect (w,h < 500 & unfilled) | 10,000 | 1000x1000 | 1       | 20.971s |
| Rect (w,h < 500 & filled)   | 10,000 | 1000x1000 | 1       | 5.607s  |

    Here is the same table but with 4 threads:
| Shape                       | Amount | Size      | Threads | Time    |
|-----------------------------|--------|-----------|---------|---------|
| Circle (r < 100 & unfilled) | 10,000 | 250x250   | 5       | 0.918s  |
| Circle (r < 100 & filled)   | 10,000 | 250x250   | 5       | 0.704s  |
| Circle (r < 500 & unfilled) | 10,000 | 1000x1000 | 5       | 16.540s |
| Circle (r < 500 & filled)   | 10,000 | 1000x1000 | 5       | 13373ms |
| Rect (w,h < 100 & unfilled) | 10,000 | 250x250   | 5       | 0.174s  |
| Rect (w,h < 100 & filled)   | 10,000 | 250x250   | 5       | 0.177s  |
| Rect (w,h < 500 & unfilled) | 10,000 | 1000x1000 | 5       | 4.917s  |
| Rect (w,h < 500 & filled)   | 10,000 | 1000x1000 | 5       | 2.373s  |



## Perf:
    - CSEL didn't have C++20 installed, only C++2a which didn't have the <concepts> header. Couldn't use perf.

## Code Organization:
    - This is a huge library (for me at least) which means there are a lot of files for all sorts of things. The main files, however, are "Sketch.hpp", "Shape.hpp", "Mapper.cpp", and "ThreadSafeQueue.hpp" since these are the ones that I modified the most.

    Sketch.hpp:
        - This file has the `void canvas(Mapper&)`` function that is called by the main function. This function is the one that creates the shapes and calls the draw function on them.
    
    Shape.hpp:
        - This file has the Shape class which is the base class for all shapes. It has the main functionality that all shapes have. I had to add a couple of extra helper functions to the base class to make it easier to draw the shapes parallelly.
    
    Mapper.cpp:
        - This is the heart of this library. This class does all the manipulation of the pixels and the shapes. It has the draw function which is called by the canvas function in Sketch.hpp. I added another variation of the draw function that takes-in a `std::vector` of shapes and then creates the threads that will draw the shapes in parallel.
    
    ThreadSafeQueue.hpp:
        - This is used to create the task queue for all the threads. It is, simply, a wrapper around a `std::queue` that has a `std::mutex`` and a `std::condition_variable` to make it thread-safe.


# Description of every file submitted:
    - Well that's just the whole library.

# Compilation Instructions:
    - I created the Makefile manually, but it is fairly easy to use. Here is a list of the `make` commands that you can run along with a description:
    - `make`: This will compile the library and create the executable `main` file. // Don't use on its own!
    - `make image filename=<filename> w=<width> h=<height>`: This will compile & run the library and create an image with the given filename, width, and height.
    - `make video filename=<filename> w=<width> h=<height> fps=<fps>`: This will compile & run the library and create a video with the given filename, width, height, and fps.
    - `make clean`: This will remove all the object files and the executable file.
    - `make wc`: This will compile, generate the assembly files, and count the number of lines in all the assembly files.


# Execution Instructions:
    - See  "Compilation Instructions".

# Extant Bugs:
    - Other than the fact that the filled shapes render faster than the unfilled ones, I don't think there are any...