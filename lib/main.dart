import 'package:batik_app/view/Home.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            splashIconSize: 170.0,
            splash: new SingleChildScrollView(
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    new Image.asset(
                      "img/logo.png",
                      width: 100.0,
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    new Text(
                      "siBatik Yogyakarta",
                      style: new TextStyle(
                          fontFamily: "DancingScript",
                          fontSize: 30.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ]),
            ),
            backgroundColor: HexColor("#e9c46a"),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.fade,
            nextScreen: Home()));
  }
}
