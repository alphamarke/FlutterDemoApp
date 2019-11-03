//import 'package:first_flutter_app/MyCard.dart';
import 'package:flutter/material.dart';
//import 'Dice.dart';
import 'BMICalculator.dart';
//import 'QuizPage.dart';
//import 'Xylophone.dart';
//import 'FirstFlutter.dart';

//void main() => runApp((new FirstFlutter()));
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp((MaterialApp(
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
      home: BMICalculator(),
    )));
