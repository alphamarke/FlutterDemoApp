import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MasterPage.dart';

class FirstFlutter extends StatefulWidget {
  @override
  _FirstFlutterState createState() => _FirstFlutterState();
}

class _FirstFlutterState extends State<FirstFlutter> {
  @override
  Widget build(BuildContext context) {
    return new MasterPage(
      appBarText: 'I am Rich',
      scaffoldBody: Container(
        child: Center(
          child: Image(image: AssetImage('assets/money.png')),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
