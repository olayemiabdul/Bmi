import 'package:bmicalculator/constant.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton(this.buttonTitle, this.onTap);
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEB1555),
      margin: EdgeInsets.only(top: 10.0),

      width: double.infinity,
      height: kBottomContainerHeight,
      child: Center(
        child: Text(
          buttonTitle,
          style: kLargeButtonStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
