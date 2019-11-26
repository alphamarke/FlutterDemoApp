import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_map_location_picker/generated/i18n.dart'
    as location_picker;
import 'package:google_map_location_picker/google_map_location_picker.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MasterPage.dart';
import 'package:first_flutter_app/Utils/i18n.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  static String id = 'LocationPage';
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  LocationResult _pickedLocation;
  String _position;
  var geolocator = Geolocator();
  var locationOptions =
      LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
  StreamSubscription<Position> positionStream;

  @override
  void initState() {
    super.initState();

    positionStream = geolocator
        .getPositionStream(locationOptions)
        .listen((Position position) {
      print(position == null
          ? 'Unknown'
          : position.latitude.toString() +
              ', ' +
              position.longitude.toString());

      _position = position == null
          ? 'Unknown'
          : position.latitude.toString() + ', ' + position.longitude.toString();
    });
  }

  @override
  void dispose() {
    positionStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MasterPage(
      appBarText: 'Location Picker',
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
                  Text(_position.toString()),
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
