import samplelibrary.*;

/*************************************************************************************************************
 * Created by mikefarr on 8/25/16.
 *
 * How to compile and use your own custom library.  Create the folder "samplelibrary" inside Processing's local libraries folder
 * On the Mac this is ~/Documents/Processing/libraries/multiport  Inside here, create a new sketch called "library" 
 * On PC this is "My Documents\Processing\librairies".  I'll just call it Processing/libraries from now on.
 * 
 * Now create a new sketch, name it "library" and save it inside the "Processing/libraries/samplelibrary" folder you just made.
 * In your sketch, create a new tab and call it "SampleLibrary.java"
 * 
 * Inside "Processing/libraries/samplelibrary"/  you will now have:
 *
 *         library.pde                  //I use this as my test file
 *         SampleLibrary.java              //your library source must have the .java file extension
 *
 * From the terminal.app from within Processing/libraries/samplelibrary/library/ cut and paste this command:
 * For Mac:
 *        javac  -classpath "/Applications/Processing.app/Contents/Java/core.jar" -d . *.java
 * For Windows it's probably pretty close to this (change "YourUserName" obviously):
 *        javac  -classpath C:\Users\YourUserName\Documents\processing-3.0\core\library\core.jar -d . *.java
 *
 *    The -classpath tells where to find the core.jar file.  
 *    Your samplelibrary.java file contains a line "import processing.core.*;" and it's in core.jar
 *    This will create a new sub-folder samplelibrary/library/samplelibrary which contains .class files.
 * 
 *  Now type this command:
 *        jar cf samplelibrary.jar samplelibrary
 *
 * The jar command will zip up the class files inside the samplelibrary/library/samplelibrary into a samplelibrary.jar file
 * inside your samplelibrary/library folder.
 *
 * Back in Processing, select menu item Sketch/add file... and find samplelibrary.jar
 * Then quit Processing.
 * Open up your library.pde sketch again and select menu Sketch/Import Library...  and now samplelibrary will show up.
 * Your sketch.pde will get a new line at the top: import samplelibrary.*
 *
 * You can run your sketch and you will see "the library is printing"
 * 
 * Note: Look at your SampleLibrary.java file.  See that I passed "this" to the SimpleLibrary class's constructor and the builtin Processing function is accessed through  p.println() now.
 * Advanced Note: If you use Processing's Serial class inside your library use this javac command instead:
 *        javac  -classpath "/Applications/Processing.app/Contents/Java/core.jar:/Applications/Processing.app/Contents/Java/modes/java/libraries/serial/library/*" -d . *.java
 *
 *  This will import serial.jar and jssc.jar inside that second long path
 *************************************************************************************************************/
 
 
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
  // text(sampleObj.printsample(), 40, 200);
}