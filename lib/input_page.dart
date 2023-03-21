import 'package:bmicalculator/bmi_brain.dart';
import 'package:bmicalculator/button_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constant.dart';
import 'icon_iconcontent.dart';
import 'result_page.dart';
import 'reusablecard.dart';

Gender selectedGender = Gender.male;
int height = 180;
int weight = 60;
int age = 20;
String bmiResult = 'Normal';
String resultText = '';
String interpretation = '';

enum Gender {
  male,
  female,
}

class BmiInput extends StatefulWidget {
  @override
  State<BmiInput> createState() => _BmiInputState();
}

class _BmiInputState extends State<BmiInput> {
  Color maleActiveContainerColor = kInactiveContainerColor;
  Color femaleActiveContainerColor = kInactiveContainerColor;
  //
  // void updateColor(Gender selectedGender) {
  //   if (selectedGender == Gender.male) {
  //     if (maleActiveContainerColor == inactiveContainerColor) {
  //       maleActiveContainerColor = activeContainerColor;
  //       femaleActiveContainerColor = inactiveContainerColor;
  //     } else
  //       () {
  //         maleActiveContainerColor = inactiveContainerColor;
  //       };
  //   }
  //   if (selectedGender == Gender.female &&
  //       femaleActiveContainerColor == inactiveContainerColor) {
  //     femaleActiveContainerColor = activeContainerColor;
  //     maleActiveContainerColor = inactiveContainerColor;
  //   } else
  //     () {
  //       femaleActiveContainerColor = inactiveContainerColor;
  //     };
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0A0E21),
        title: Text(
          ' BMI CALCULATOR',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      selectedGender == Gender.male
                          ? kActiveContainerColor
                          : kInactiveContainerColor,
                      IconContent(
                        FontAwesomeIcons.mars,
                        'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = (Gender.female);
                      });
                    },
                    child: ReusableCard(
                      selectedGender == Gender.female
                          ? kInactiveContainerColor
                          : kActiveContainerColor,
                      IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              kActiveContainerColor,
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kAbdulStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15.0,
                            disabledThumbRadius: 1.0,
                            pressedElevation: 6.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    kActiveContainerColor,
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kAbdulStyle,
                          ),
                          SingleChildScrollView(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton.small(
                                  backgroundColor: Color(0xFF4C4F5E),
                                  child: FaIcon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(
                                      () {
                                        weight--;
                                      },
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                FloatingActionButton.small(
                                  backgroundColor: Color(0xFF4C4F5E),
                                  child: FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(
                                      () {
                                        weight++;
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    kActiveContainerColor,
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'AGE',
                            style: kLabelStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kAbdulStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton.small(
                                backgroundColor: Color(0xFF4C4F5E),
                                child: FaIcon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      age--;
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              FloatingActionButton.small(
                                backgroundColor: Color(0xFF4C4F5E),
                                child: FaIcon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      age++;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BmiBrain calc = BmiBrain(
                height,
                weight,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult = calc.calculateBmi(),
                    resultText = calc.bmiResult(),
                    interpretation = calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: BottomButton('calculate', () {}),
          ),
        ],
      ),
    );
  }
}

class AbdulIconButton extends StatelessWidget {
  AbdulIconButton(this.icon, this.onPassed);
  final IconData icon;
  final Function onPassed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: () {},
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
