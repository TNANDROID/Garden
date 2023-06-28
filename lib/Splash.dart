import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:garden_app/Resources/ImagePath.dart' as imagePath;
import 'package:garden_app/Resources/ColorsValue.dart' as c;

import 'Login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    initialize();
    // utils.gotoLoginPageFromSplash(context);
  }

  Future<void> initialize() async {
    Timer(
        const Duration(seconds: 2),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login())));
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [c.colorAccentverylight, c.colorAccentverylight]),
          ),
          // color: c.ca,
          child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Neumorphic(
                            style: NeumorphicStyle(
                                shape: NeumorphicShape.convex,
                                boxShape: NeumorphicBoxShape.circle(),
                                depth: 5,
                                color: Colors.white),
                            child: Container(
                              margin: EdgeInsets.all(20),
                              child: Image.asset(
                                imagePath.plant_logo,
                                height: 100,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Text(
                            textAlign: TextAlign.center,
                            "Garden",
                            style: TextStyle(
                                color: c.grey_9,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  )),
                  Container(
                      alignment: AlignmentDirectional.bottomEnd,
                      height: 400,
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: Image.asset(
                            imagePath.bg,
                          ),
                        ),
                      ))
                ],
              )),
        ),
      ),
    );
  }

}
