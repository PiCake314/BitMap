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