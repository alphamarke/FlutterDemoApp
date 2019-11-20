import 'dart:math';

import 'package:background_fetch/background_fetch.dart';
import 'package:first_flutter_app/BackgroundFetch.dart';
import 'package:first_flutter_app/Climate.dart';
import 'package:first_flutter_app/FlushBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomControls/RoundedButton.dart';
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
                    Navigator.pushNamed(context, BackgroundFetchPage.id);
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                RoundedButton(
                  color: buttonColor,
                  child: Text('Flush Bar'),
                  onPressed: () {
                    Navigator.pushNamed(context, FlushBarPage.id);
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
