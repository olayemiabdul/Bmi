import 'package:bmicalculator/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      BmiCalculator(),
    );

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0A0E21),
        scaffoldBackgroundColor: Color(0xff0A0E21),
      ),
      home: BmiInput(),
    );
  }
}
