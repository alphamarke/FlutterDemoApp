import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertFlushBar {
  String title;
  String message;
  Icon icon;
  Duration duration;
  bool showProgressIndicator;
  FlatButton mainButton;

  AlertFlushBar({
    @required this.title,
    @required this.message,
    @required this.icon,
    @required this.duration,
    this.showProgressIndicator = false,
    this.mainButton = null,
  });

  void showWarningFlushBar(BuildContext context) {
    Flushbar(
      title: this.title,
      message: this.message,
      icon: this.icon,
      isDismissible: false,
      duration: this.duration,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.red,
      boxShadows: [
        BoxShadow(
            color: Colors.red[800], offset: Offset(0.0, 2.0), blurRadius: 3.0)
      ],
      backgroundGradient: LinearGradient(colors: [Colors.red, Colors.red[200]]),
      mainButton: this.mainButton,
      showProgressIndicator: this.showProgressIndicator,
      progressIndicatorBackgroundColor: Colors.blueGrey,
    )..show(context);
  }

  void showDefaultFlushBar(BuildContext context) {
    Flushbar(
      title: this.title,
      message: this.message,
      icon: this.icon,
      isDismissible: false,
      duration: this.duration,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.grey[300],
      boxShadows: [
        BoxShadow(
            color: Colors.grey[800], offset: Offset(0.0, 2.0), blurRadius: 3.0)
      ],
      backgroundGradient:
          LinearGradient(colors: [Colors.black, Colors.grey[600]]),
      mainButton: this.mainButton,
      showProgressIndicator: this.showProgressIndicator,
      progressIndicatorBackgroundColor: Colors.grey[800],
    )..show(context);
  }
}
