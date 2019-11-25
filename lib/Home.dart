import 'dart:math';

import 'package:background_fetch/background_fetch.dart';
import 'package:first_flutter_app/BackgroundFetch.dart';
import 'package:first_flutter_app/Camera.dart';
import 'package:first_flutter_app/Climate.dart';
import 'package:first_flutter_app/FlushBar.dart';
import 'package:first_flutter_app/LocationPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'CustomControls/RoundedButton.dart';
import 'MasterPage.dart';

Color buttonColor = Colors.black.withAlpha(400);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool load = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loader();
  }

  void loader() async {
    setState(() {
      load = true;
    });

    await Future.delayed(Duration(seconds: 4), () {
      setState(() {
        load = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: load,
      child: MasterPage(
        appBarText: 'Flutter Demo\'s',
        scaffoldBody: Container(
          child: Center(
            child: Container(
              child: SingleChildScrollView(
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
                    RoundedButton(
                      color: buttonColor,
                      child: Text('Camera'),
                      onPressed: () {
                        Navigator.pushNamed(context, CameraApp.id);
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    RoundedButton(
                      color: buttonColor,
                      child: Text('Location'),
                      onPressed: () {
                        Navigator.pushNamed(context, LocationPage.id);
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
        ),
        floatingActionButton: null,
      ),
    );
  }
}
