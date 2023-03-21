import 'dart:math';

class BmiBrain {
  final int height;

  final int weight;
  BmiBrain(this.height, this.weight);
  double _bmi = 0.0;

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  getInterpretation() {
    if (_bmi >= 25) {
      return 'you have higher than normal body weight. Try to exercise more';
    } else if (_bmi >= 18.5) {
      return 'you have normal body weight. Good job';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}
