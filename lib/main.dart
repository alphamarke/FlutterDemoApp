import 'package:first_flutter_app/BMICalculator.dart';
import 'package:first_flutter_app/BackgroundFetch.dart';
import 'package:first_flutter_app/Camera.dart';
import 'package:first_flutter_app/Climate.dart';
import 'package:first_flutter_app/FlushBar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:first_flutter_app/Dice.dart';
import 'package:first_flutter_app/FirstFlutter.dart';
import 'package:first_flutter_app/Home.dart';
import 'package:first_flutter_app/MyCard.dart';
import 'package:first_flutter_app/QuizPage.dart';
import 'package:first_flutter_app/Xylophone.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';

void main() {
  runApp(FirstFlutterApp());
}

class FirstFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: const Locale('en'),
      supportedLocales: const <Locale>[const Locale('en')],
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.grey[800],
        scaffoldBackgroundColor: Colors.grey[700],
        accentColor: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        '/Rich': (context) => FirstFlutter(),
        '/Card': (context) => MyCard(),
        '/Dice': (context) => DicePage(),
        '/Xylophone': (context) => Xylophone(),
        '/Quiz': (context) => QuizPage(),
        '/BMI': (context) => BMICalculator(),
        Climate.id: (context) => Climate(),
        BackgroundFetchPage.id: (context) => BackgroundFetchPage(),
        FlushBarPage.id: (context) => FlushBarPage(),
        CameraApp.id: (context) => CameraApp(),
      },
    ));
  }
}
