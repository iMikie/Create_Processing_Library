package samplelibrary;

import processing.core.*;

/*************************************************************************************************************
 This is the actual library
 A couple of notes:
 Both your class and its constructor must be marked public
 You can have other classes in this file but they must not be public (just delete the word public)
 
 Note that the constructor takes a parameter of PApplet parent.  When you call this constructor you pass "this".
 From your main sketch tab, "this" is actually Processing itself.  By passing "this" you can now access
 Processing's built in functions like println.
 
 * Created by mikefarr on 8/25/16.
 *************************************************************************************************************/
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