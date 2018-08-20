
float f(float x) {
  // y = m x + b
  return 0.3 * x + 0.2;
}

class Point {

  float x, y;
  float bias;
  int label;

  Point() {
    x = random(-1, 1);
    y = random(-1, 1);
    bias = 1;

    float lineY = f(x);
    if (y > lineY) {
      label = 1;
    } else {
      label = -1;
    }
  }
  //Overloading Constructor
  Point(float x_, float y_) {
    x = x_;
    y = y_;
    bias = 1;
  }

  float pixelX()
  {
    return map(x, -1, 1, 0, width);
  }

  float pixelY()
  {
    return map(y, -1, 1, height, 0);
  }

  void show() {
    stroke(0);
    if (label == 1) {
      fill(255);
      //draws the data point
      ellipse(pixelX(), pixelY(), 8, 8);
    } else {
      fill(0);
      //draws the data point
      rect(pixelX(), pixelY(), 8, 8);
    }
  }
}
