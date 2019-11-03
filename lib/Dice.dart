import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MasterPage.dart';

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  @override
  Widget build(BuildContext context) {
    return new MasterPage(
      appBarText: 'Roll The Dice',
      scaffoldBody: Container(
        child: Center(
          child: new RollingDice(),
        ),
      ),
      floatingActionButton: null,
    );
  }
}

class RollingDice extends StatefulWidget {
  @override
  _RollingDiceState createState() => _RollingDiceState();
}

class _RollingDiceState extends State<RollingDice> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void diceChange() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: FlatButton(
            onPressed: () {
              diceChange();
            },
            child: Image(
              image: AssetImage('assets/dice$leftDiceNumber.png'),
            ),
          ),
        ),
        Expanded(
          child: FlatButton(
            onPressed: () {
              diceChange();
            },
            child: Image(
              image: AssetImage('assets/dice$rightDiceNumber.png'),
            ),
          ),
        )
      ],
    );
  }
}
