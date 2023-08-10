# THIS READ ME IS OUTDATED.

# BitMap - Mapper Class
```
map::Mapper mapper;
mapper.drawCircle();
```

## Table of content:
1. Structs
    1. Point
    2. RGB
    3. Fold
2. Namespcaes
    1. map
    2. clr
3. Library Functions

# Structs
Before we dive into the actual code in the library, I must first introduce some helper structs that will make writing code in this library a bit easier.

## Point
The Point struct is very simple. It only consists of an (x) and a (y). This structs is used to make passing points to a function more readable.

## RGB
This struct represents three values (r), (g), and (b). It makes passing colors to a certain function easier and more readable as well.

## Fold
This struct has one specific use, to fold the canvas in some way. You'd only use it when calling the function ```fold(Fold f)``` where the parameter is a Fold object. You're not going to make a new object with this struct, rather, you are going to use one of the constant values provided by the library.

The Values are the following:

To copy the right side to left side:
```
const Fold r2l;
```

To copy the left side to right side:
```
const Fold l2r;
```

To copy the top side to bottom side:
```
const Fold t2b;
```

To copy the bottom side to top side:
```
const Fold b2t;
```


# Namespaces
There are two namespaces in this library. These namespaces are used to make it obvious that you're using code from this library.

## map

The main namespace is "map". This namespace is used for the Mapper class. To make an object of the mapper class, you do the following:
```
map::Mapper m;
```

## clr
This namespace stands for "color". It's used to access anything in the ```RGB``` struct. To make an object of the RGB struct, you do the following:
```
clr::RGB c;
```

# Library Functions

## Constructor

```
Mapper(string filename= "output.ppm", int height = 100, int width = 100, string type = "reset");
```
As it should be obvious, the first parameter is the file name. Followed by the height and width of the canvas. Lastly, is the load type. Pass "reset" to reset the file, and pass "load" to load in a file that already exsists.

## Set
The following functions:
```
void doSet();
void noSet();
```
Modify whether the changes of any function should apply to the file immediately or not. For example, say I want to draw ten circles at differing heights using the following code:
```
for(int i = 0; i < 100; i+=10){
    m.drawCricle(Point(i, 50));
}
```
This code is going to apply the changes to the file 10 times in a row, which takes a lot of time. The better way of doing this would be like this:
```
m.noSet(); // This prevents applying the changes 10 times
for(int i = 0; i < 100; i+=10){
    m.drawCricle(Point(i, 50));
}
m.setState(); // This will apply the changes
m.doSet();
```
## Fillings
### ``` fillWhite() ```
This function fills the canvas white.

### ``` fillColor(clr::RGB)```
This function fills the canvas with any color passed.

### ``` randomize() ```
This function will set each pixel on the canvas with a random color.

### ``` randomizeGrey() ```
This function will set each pixel on the canvas with a random gradiant of gray.


