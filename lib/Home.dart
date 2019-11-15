import 'dart:math';

import 'package:background_fetch/background_fetch.dart';
import 'package:first_flutter_app/Climate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MasterPage.dart';

Color buttonColor = Colors.black.withAlpha(400);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new MasterPage(
      appBarText: 'Flutter Demo\'s',
      scaffoldBody: Container(
        child: Center(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundedButton(
                  color: buttonColor,
                  child: Text('I Am Rich'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Rich');
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                RoundedButton(
                  color: buttonColor,
                  child: Text('My Card'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Card');
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                RoundedButton(
                  color: buttonColor,
                  child: Text('Roll the Dice'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Dice');
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                RoundedButton(
                  color: buttonColor,
                  child: Text('Xylophone'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Xylophone');
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                RoundedButton(
                  color: buttonColor,
                  child: Text('Quiz'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Quiz');
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                RoundedButton(
                  color: buttonColor,
                  child: Text('BMI Calculator'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/BMI');
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                RoundedButton(
                  color: buttonColor,
                  child: Text('Animation'),
                  onPressed: () {
                    Navigator.pushNamed(context, Climate.id);
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                RoundedButton(
                  color: buttonColor,
                  child: Text('Background Fetch'),
                  onPressed: () {
                    Navigator.pushNamed(context, BackgroundFetch.);
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: null,
    );
  }
}

class RoundedButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  final Color color;

  RoundedButton({this.onPressed, this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.all(10),
      fillColor: color,
      child: child,
      onPressed: onPressed,
      elevation: 20.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    );
  }
}
