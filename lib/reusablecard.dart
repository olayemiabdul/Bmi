import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  //

  final Color colour;
  final Widget cardChild;

  ReusableCard(
    this.colour,
    this.cardChild,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: colour,
      ),
    );
  }
}
