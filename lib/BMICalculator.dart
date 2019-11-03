import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'MasterPage.dart';
import 'Model/Gender.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  int heightValue = 120;

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
                      thumbColor: Colors.white.withAlpha(450),
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
                      headWidget: Icon(
                        FontAwesomeIcons.mars,
                        size: 80,
                      ),
                      contentWidget: Text(
                        'Female',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    new RoundedCards(
                      headWidget: Icon(
                        FontAwesomeIcons.venus,
                        size: 80,
                      ),
                      contentWidget: Text(
                        'Female',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
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
