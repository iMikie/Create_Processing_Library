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
