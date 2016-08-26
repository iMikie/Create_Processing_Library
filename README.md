# Create_Processing_Library
##How to create a library for Processing 3.0 (no need for an IDE)


To get the sources, just click on the green **Clone or Download** button and download a zip file of this repository.
Here’s how you do it the simplest way. You don’t need an IDE. Other than a new version of java, you probably don't need anything new at all.

-
First, you may need to download an up-to-date java.  The version of java (that came with my Mac) was 1.6 and Processing 3 appears to need 1.8. Here's the link: 
       http://www.oracle.com/technetwork/java/javase/downloads/index.html
when you get there, click on the large Java DOWNLOAD icon and select the download for your platform, and install.


Create a folder wherever you want, call it sample.  If you don’t know how to use the command line, then go to your home folder.  For example, mine is Mikie.  You can create sample there. Since I know how to use the command line I went to my Documents/Processing folder and created the sample folder there.

Inside sample create a file called SampleLibrary.java.  You can use Processing to create the file with the name SampleLibrary.  It will be actually be called SampleLibrary.pde so go into your Finder or Explorer and change the name to SampleLibrary.java.  

This is the contents of SampleLibrary.java, it’s the simplest Library I could make:

```java
package sample;						//that’s what java calls a library
import processing.core.*;				//so you can call processing built in routines 

public class SampleLibrary {
    PApplet parent;

    public SampleLibrary(PApplet parent) {              //note: the parent is actually your sketch, Processing itself!
        this.parent = parent;                           
        parent.registerMethod("dispose", this);
    }

    public void printsample() {                         //just a sample method you can call
        parent.println("the library is printing.");
    }

    public void dispose() {
        // Probably won’t need this unless you create threads or allocated memory
    }
}
```

Now you compile it:  On Mac we use the terminal.app.  It’s inside  /Applications/Utilities/.  On Windows use whatever you use for the command line.   

Change directory into sample.  If you created sample in your main folder type this command: 
```
cd ~/sample
```
Execute the following command:
```
javac  -classpath /Applications/Processing.app/Contents/Java/core.jar -d . *.java
```
for windows it should be something like: 
```
javac  -classpath C:\Users\Mikie\Documents\processing-3.0\core\library\core.jar -d . *.java
```
Briefly, the -classpath option tells it where to find Processing’s code while the -d followed by a period and *.java says to compile all files ending in .java within the current folder. This will create a file SampleLibrary.class

Now wrap it up in a jar file, type this into your terminal.app’s window:
```
jar cf sample.jar SampleLibrary.class
```
Now inside your Documents/Processing/libraries folder create a sample folder.
Inside sample create a folder called library.  Drag your jar file there.

So on Mac I have:  /Users/Mikie/Documents/Processing/libraries/sample/library/sample.jar

Now open up processing and create a sketch with this in it:

```java
import sample.*;

SampleLibrary sampleObj;

void setup() {
  size(400, 400);
  smooth();

  sampleObj = new SampleLibrary(this);

  PFont font = createFont("", 40);
  textFont(font);
}

void draw() {
  background(0);
  fill(255);
  sampleObj.printsample();
  // text(sampleObj.printsample(), 40, 200);
}
```
This is your test sketch.

Now in processing, under the menu Sketch, select add file and find your sample.jar file.

Your sketch will now run.

If you want to do more, look at 
    https://github.com/processing/processing/wiki/Library-Basics

There’s lots more info there.



