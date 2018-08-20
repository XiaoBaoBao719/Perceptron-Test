int sign(float n) {
  if (n >= 0)
    return 1;
  else
    return -1;
}

class Perceptron {
  float[] weights;
  float learningRate = 0.009;

  //Constructor
  //@parameter n - represents the number of inputs & weights
  Perceptron(int n) {
    weights = new float[n];
    //initialize weights randomly
    for (int i = 0; i < weights.length; i++) {
      weights[i] = random(-1, 1);
    }
  }

  //iterate through all of the inputs in this
  //perceptron and return a guess reagrding what
  //the output might be
  int guess(float[] inputs) {
    float sum = 0;
    for (int i = 0; i <weights.length; i++) {
      sum += inputs[i] * weights[i];
    }

    int output = sign(sum);
    return output;
  }

  //adjust the weights in the perceptron based off of the target
  //or the 'correct' label
  void train(float[] inputs, int target) {
    int guess = guess(inputs);
    int error = target - guess;

    //adjust all weights based off of error and input
    for (int i = 0; i < weights.length; i++) {
      weights[i] += error * inputs[i] * learningRate;
    }
  }

  float guessY(float x) {
    //float m = weights[0] / weights [1];
    //float b = weights[2];
    //return m * x + b;
    float w0 = weights[0];
    float w1 = weights[1];
    float w2 = weights[2];
    //visualize the changes in the weights as an equation for y
    return -(w2/w1) - (w0/w1) * x;
  }
}
