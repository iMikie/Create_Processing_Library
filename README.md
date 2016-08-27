# Create_Processing_Library
##How to create a library for Processing 3.0 (no need for an IDE)


To get the sources for this repository, just click on the green **Clone or Download** button and download a zip file of this repository.
You don’t need an IDE. Other than a new version of java, you probably don't need anything new at all. You do need to know how
to enter commands via commandline.  If you don’t know how to use the command line, then google "Just enough command line" and read that book,  you'll need it.

-

###Updating Java
You may need to download an up-to-date java.  The version of java (that came with my Mac) was 1.6 and Processing 3 appears to need 1.8. Do PC's come with a java SKD?  No matter, Here's the link: 

[Get an up-to-date Java SDK here](http://www.oracle.com/technetwork/java/javase/downloads/index.html)

When you get there, click on the large **Java DOWNLOAD** icon and select the download for your platform, and install.

###Create A folder for your library
Create the folder "samplelibrary" inside Processing's local libraries folder;

On the Mac this is in your Documents folder:
```
Documents/Processing/libraries/multiport
```
On PC this is: 
```
My Documents\Processing\librairies
```
I'll just call it *Processing/libraries* from now on.
Now open Processing and create a new sketch, name it *library* and save it inside the *Processing/libraries/samplelibrary* folder you just made.  In your sketch, create a new tab and call it *SampleLibrary.java*

Inside *Processing/libraries/samplelibrary/*  you will now have:
```
library.pde                     //I use this as the test file
SampleLibrary.java              //Your library source must have the .java file extension
```
###Simpliest Library 
Now cut and paste the following into the **SampleLibrary.java** tab:

```java
package samplelibrary;
import processing.core.*;

public class SampleLibrary {
  PApplet parent;

  public SampleLibrary(PApplet parent) {              //note passing the parent routines
    this.parent = parent;                           //the parent is actually Processing itself!
    parent.registerMethod("dispose", this);
  }

  public void printsample() {                         //just a sample method you can call
    parent.println("the library is printing.");
  }

  public void dispose() {
    // Anything in here will be called automatically when
    // the parent sketch shuts down. For instance, this might
    // shut down a thread used by this library.
  }
}
```
 Note that the constructor takes a parameter of **PApplet parent**.  When you call this constructor you pass **this**.
 From your main sketch tab, *this* is actually Processing itself.  By passing *this* you can now access
 Processing's built in functions like we do with println.
 
###Compile
Now you compile it:  On Mac we use the **terminal.app**.  It’s inside  **/Applications/Utilities/**.  On Windows use whatever you use for the command line.   

From the terminal.app or its Windows equivalent, navigate to your library folder, *Processing/libraries/samplelibrary/library/* and cut and paste this command:
For Mac:
```
 javac  -classpath "/Applications/Processing.app/Contents/Java/core.jar" -d . *.java
 ```
For Windows it's probably pretty close to this (change "YourUserName" obviously):
```
javac  -classpath C:\Users\YourUserName\Documents\processing-3.0\core\library\core.jar -d . *.java
```
The -classpath tells the java compiler *javac* where to find the **core.jar** file.  That file is necessary because your **samplelibrary.java** file contains a line 
```
import processing.core.*;
```
and **processing.core** is in **core.jar**. The -d followed by a period and \*.java says to compile all files ending in .java within the current folder and create folders for each java package. So in our case, this will create a file **SampleLibrary.class**.

Now type in this command:
```
jar cf samplelibrary.jar samplelibrary
```
This will create your **samplelibrary.jar** file.   *Processing/libraries/sample/library/samplelibrary.jar*

###Now let's test the library 
Now open up processing and create a sketch with this in it:

```java
import samplelibrary.*;

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
}
```
This simply calls the samplelibrary's **printsample()** function during loop.

###Load your new library into your processing sketch.
Back in Processing, select menu item **Sketch/add file...** and find your file **samplelibrary.jar**
Then quit Processing so it can reload it's libraries. Open up your library.pde sketch again and select menu **Sketch/Import Library...**  and now **samplelibrary** will show up. Go ahead and select it
Your **sketch.pde** will get a new line at the top: 
```
import samplelibrary.*
```
You can run your sketch and you will see "the library is printing" in the console window.


###Note: 
 Note that SampleLibrary's  constructor takes a parameter of **PApplet parent**.  When you call this constructor you pass *this*.
 From your main sketch tab, *this* is actually Processing itself.  By passing *this* you can now access
 Processing's built in functions and we do this with *println*.
 
###Advanced Note: 
If you use Processing's Serial class inside your library use this javac command instead:
```
javac  -classpath "/Applications/Processing.app/Contents/Java/core.jar:/Applications/Processing.app/Contents/Java/modes/java/libraries/serial/library/*" -d . *.java
```

To use Serial you need 
```
import processing.serial.*;
```
The processing.serial library relies on *serial.jar* and *jssc.jar* which are found at that second really long path in the -classpath arguement.  

You can define more than one class in a library but only one can be public, the one whose name is on the .java file.  You can have multiple packages (each defined in its own .java file inside the library folder) in a Processing library.  If you want to do more, look at 
    https://github.com/processing/processing/wiki/Library-Basics

There’s lots more info there.



