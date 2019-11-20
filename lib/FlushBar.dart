import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomControls/AlertFlushBar.dart';
import 'CustomControls/RoundedButton.dart';
import 'MasterPage.dart';

class FlushBarPage extends StatefulWidget {
  static String id = 'FlushBarPage';
  @override
  _FlushBarPageState createState() => _FlushBarPageState();
}

class _FlushBarPageState extends State<FlushBarPage> {
  @override
  Widget build(BuildContext context) {
    return new MasterPage(
      appBarText: 'Flush Bar',
      scaffoldBody: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: RoundedButton(
                  color: Colors.black.withAlpha(400),
                  child: Text('Warning Flush Bar'),
                  onPressed: () {
                    AlertFlushBar alertFlushBar = AlertFlushBar(
                        title: 'Alert',
                        message: 'This is where we show warning.',
                        icon: Icon(
                          Icons.assignment_late,
                          color: Colors.white,
                        ),
                        duration: Duration(seconds: 5),
                        showProgressIndicator: true);
                    alertFlushBar.showWarningFlushBar(context);
                  },
                ),
              ),
              Container(
                child: RoundedButton(
                  color: Colors.black.withAlpha(400),
                  child: Text('Default Flush Bar'),
                  onPressed: () {
                    AlertFlushBar alertFlushBar = AlertFlushBar(
                      title: 'Alert',
                      message: 'This is where we show warning.',
                      icon: Icon(
                        Icons.assignment_late,
                        color: Colors.white,
                      ),
                      duration: Duration(seconds: 5),
                      showProgressIndicator: false,
                      mainButton: null,
                    );
                    alertFlushBar.showDefaultFlushBar(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: null,
    );
  }
}
