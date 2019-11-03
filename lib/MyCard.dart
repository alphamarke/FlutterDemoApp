import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MasterPage.dart';

class MyCard extends StatefulWidget {
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return new MasterPage(
      appBarText: 'My Card',
      scaffoldBody: Container(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage('assets/mandar.jpg'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Mandar Gawas',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cursive'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'SOFTWARE DEVELOPER',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'BreeSerif',
                      letterSpacing: 2),
                ),
                CardTile(
                  tileLeadingWidget: Icon(
                    Icons.call,
                    size: 30,
                  ),
                  tileTitleText: '9022822082',
                ),
                CardTile(
                  tileLeadingWidget: Icon(
                    Icons.email,
                    size: 30,
                  ),
                  tileTitleText: 'mandar1504@gmail.com',
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: null,
    );
  }
}

class CardTile extends StatelessWidget {
  final Widget tileLeadingWidget;
  final String tileTitleText;

  const CardTile(
      {@required this.tileLeadingWidget, @required this.tileTitleText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
          child: Center(
            child: ListTile(
              leading: tileLeadingWidget,
              title: Text(
                tileTitleText,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'BreeSerif',
                    letterSpacing: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
