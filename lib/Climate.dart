import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MasterPage.dart';
//import 'package:geolocator/geolocator.dart';

class Climate extends StatefulWidget {
  static String id = 'Climate';

  @override
  _ClimateState createState() => _ClimateState();
}

class _ClimateState extends State<Climate> with TickerProviderStateMixin {
  AnimationController animationController;
  AnimationController weightAnimationController;
  AnimationController textAnimationController;

  Animation curveAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    animationController.forward();

    animationController.addListener(() {
      setState(() {});
    });

    textAnimationController = AnimationController(
        duration: Duration(seconds: 2), vsync: this, upperBound: 100);

    textAnimationController.forward();

    textAnimationController.addListener(() {
      setState(() {});
    });

    weightAnimationController = AnimationController(
        duration: Duration(seconds: 1), vsync: this, upperBound: 1);

    weightAnimationController.forward();

    weightAnimationController.addListener(() {
      setState(() {});
    });

    curveAnimation = CurvedAnimation(
        parent: weightAnimationController, curve: Curves.bounceInOut);

    weightAnimationController.forward();

    curveAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        weightAnimationController.reverse(from: 1);
      } else if (status == AnimationStatus.dismissed) {
        weightAnimationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MasterPage(
      appBarText: 'Climate',
      scaffoldBody: Container(
        width: double.maxFinite,
        color: Colors.white.withOpacity(animationController.value),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              /*RaisedButton(
                child: Text(
                  '${textAnimationController.value.toInt()}%',
                  style:
                      TextStyle(fontSize: weightAnimationController.value * 60),
                ),
                onPressed: () {
                  checkLocation();
                },
              ),*/
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Material(
                  elevation: weightAnimationController.value * 20,
                  shadowColor: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red
                              .withOpacity(weightAnimationController.value),
                          width: 4.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red.withOpacity(
                              (weightAnimationController.value + 0.5) < 1
                                  ? (weightAnimationController.value + 0.5)
                                  : 1),
                          width: 4.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: null,
    );
  }
}
