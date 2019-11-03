import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MasterPage extends StatelessWidget {
  final String appBarText;
  final Widget scaffoldBody;
  final Widget floatingActionButton;

  const MasterPage(
      {@required this.appBarText,
      @required this.scaffoldBody,
      this.floatingActionButton,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          appBarText,
          style: TextStyle(fontSize: 24),
        )),
      ),
      body: scaffoldBody,
      floatingActionButton: floatingActionButton,
    );
  }
}
