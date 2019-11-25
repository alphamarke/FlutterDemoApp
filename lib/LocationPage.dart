import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_map_location_picker/generated/i18n.dart'
    as location_picker;
import 'package:google_map_location_picker/google_map_location_picker.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MasterPage.dart';
import 'package:first_flutter_app/Utils/i18n.dart';

class LocationPage extends StatefulWidget {
  static String id = 'LocationPage';
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  LocationResult _pickedLocation;
  @override
  Widget build(BuildContext context) {
    return new MasterPage(
      appBarText: 'Roll The Dice',
      scaffoldBody: Container(
        child: Center(
          child: Builder(builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () async {
                      LocationResult result = await LocationPicker.pickLocation(
                        context,
                        'AIzaSyBwyTuwxlWOA1N5WL8gUqICcMOWItAbrK8',
                      );
                      print("result = $result");
                      setState(() => _pickedLocation = result);
                    },
                    child: Text('Pick location'),
                  ),
                  Text(_pickedLocation.toString()),
                ],
              ),
            );
          }),
        ),
      ),
      floatingActionButton: null,
    );
  }
}
