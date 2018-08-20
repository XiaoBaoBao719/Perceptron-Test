
Perceptron percep;
int numPoints = 100;
Point[] points = new Point[numPoints];
int trainingIndex = 0;

void setup() {

  size( 800, 800);

  for (int i = 0; i < numPoints; i++) {
    points[i] = new Point();
  }

  //perceptron takes two inputs, and returns an output
  percep = new Perceptron(3);
}

void draw() {
  background(255);
  stroke(0);

  //draws the correct line based off of the labels
  Point p1 = new Point(-1, f(-1));
  Point p2 = new Point(1, f(1));
  line(p1.pixelX(), p1.pixelY(), p2.pixelX(), p2.pixelY());

  //draws what the peceptron thinks is the correct line
  stroke(0, 0, 255);
  Point p3 = new Point(-1, percep.guessY(-1));
  Point p4 = new Point(1, percep.guessY(1));
  line(p3.pixelX(), p3.pixelY(), p4.pixelX(), p4.pixelY());

  //draw data points
  for (Point p : points) {
    p.show();
  }

  for (Point p : points) {
    float[] inputs = {p.x, p.y, p.bias};  //third input is the bias (always 1)
    int target = p.label;
    int guess = percep.guess(inputs);
    //Is the guess for the current point correctly labeled?
    if (guess == target) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    noStroke();
    ellipse(p.pixelX(), p.pixelY(), 5, 5);
  }
  //train one point at time to visualize training
  Point training = points[trainingIndex]; 
  float[] inputs = {training.x, training.y, training.bias};
  int target = training.label;
  percep.train(inputs, target);
  trainingIndex++;
  if (trainingIndex == points.length) {
    trainingIndex = 0;
  }
}

void mousePressed() {
  /*for(Point p: points){
   
   }*/
}
