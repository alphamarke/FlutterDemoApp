import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
