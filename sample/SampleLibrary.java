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
