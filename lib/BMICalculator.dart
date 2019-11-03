import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'MasterPage.dart';
import 'Model/Gender.dart';

Color buttonColor = Colors.white.withAlpha(450);

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  int heightValue = 120;
  int weightValue = 70;
  int ageValue = 25;

  Color maleColor = Colors.deepOrangeAccent;
  Color femaleColor = Colors.deepOrangeAccent;
  Color defaultCardColor = Colors.deepOrangeAccent;
  Color activeCardColor = Colors.deepOrangeAccent.shade700;

  TextStyle pageMediumFontStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  TextStyle pageLargeFontStyle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );

  TextStyle pageSmallFontStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  makeCardActive(Gender cardGender) {
    setState(() {
      if (cardGender == Gender.Male) {
        maleColor = activeCardColor;
        femaleColor = defaultCardColor;
      }
      if (cardGender == Gender.Female) {
        maleColor = defaultCardColor;
        femaleColor = activeCardColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MasterPage(
      appBarText: 'BMI Calculator',
      scaffoldBody: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new RoundedCards(
                      cardColor: maleColor,
                      headWidget: Icon(
                        FontAwesomeIcons.mars,
                        size: 80,
                      ),
                      contentWidget: Text(
                        'Male',
                        style: pageMediumFontStyle,
                      ),
                      onTap: () {
                        makeCardActive(Gender.Male);
                      },
                    ),
                    new RoundedCards(
                      cardColor: femaleColor,
                      headWidget: Icon(
                        FontAwesomeIcons.venus,
                        size: 80,
                      ),
                      contentWidget: Text(
                        'Female',
                        style: pageMediumFontStyle,
                      ),
                      onTap: () {
                        makeCardActive(Gender.Female);
                      },
                    ),
                  ],
                ),
              ),
              RoundedCards(
                  headWidget: Column(
                    children: <Widget>[
                      Text(
                        'Height',
                        style: pageMediumFontStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            heightValue.toString(),
                            style: pageLargeFontStyle,
                          ),
                          Text(
                            'CM',
                            style: pageSmallFontStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  contentWidget: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 16.0),
                      thumbColor: buttonColor,
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 26.0),
                      overlayColor: Color(0x29000000),
                      activeTrackColor: Colors.black54,
                    ),
                    child: Slider(
                        value: heightValue.toDouble(),
                        min: 100,
                        max: 250,
                        onChanged: (double) {
                          setState(() {
                            heightValue = double.round();
                          });
                        }),
                  )),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new RoundedCards(
                      headWidget: Column(
                        children: <Widget>[
                          Text(
                            'Weight',
                            style: pageMediumFontStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                weightValue.toString(),
                                style: pageLargeFontStyle,
                              ),
                              Text(
                                'KG',
                                style: pageSmallFontStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      contentWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weightValue++;
                                });
                              },
                              buttonIcon: FontAwesomeIcons.plus),
                          RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weightValue--;
                                });
                              },
                              buttonIcon: FontAwesomeIcons.minus),
                        ],
                      ),
                    ),
                    new RoundedCards(
                      headWidget: Column(
                        children: <Widget>[
                          Text(
                            'Age',
                            style: pageMediumFontStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                ageValue.toString(),
                                style: pageLargeFontStyle,
                              ),
                              Text(
                                ' ',
                                style: pageSmallFontStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      contentWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  ageValue++;
                                });
                              },
                              buttonIcon: FontAwesomeIcons.plus),
                          RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  ageValue--;
                                });
                              },
                              buttonIcon: FontAwesomeIcons.minus),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: null,
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData buttonIcon;

  RoundIconButton({@required this.onPressed, @required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: RawMaterialButton(
        child: Icon(buttonIcon),
        shape: CircleBorder(),
        fillColor: buttonColor,
        constraints: BoxConstraints.tightFor(height: 56, width: 56),
        elevation: 6.0,
        onPressed: onPressed,
      ),
    );
  }
}

class RoundedCards extends StatelessWidget {
  final Widget headWidget;
  final Widget contentWidget;
  final Color cardColor;
  final Function onTap;

  RoundedCards(
      {@required this.headWidget,
      @required this.contentWidget,
      this.cardColor = Colors.deepOrangeAccent,
      this.onTap});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: cardColor, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              headWidget,
              SizedBox(
                height: 15,
              ),
              contentWidget
            ],
          ),
        ),
      ),
    );
  }
}
