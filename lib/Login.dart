import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../Resources/ColorsValue.dart' as c;
import '../Resources/ImagePath.dart' as imagePath;
import 'Home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user_name = TextEditingController();
  TextEditingController user_password = TextEditingController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: c.colorAccentverylight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                          alignment: Alignment.center,
                          child: Neumorphic(
                            style: NeumorphicStyle(
                                shape: NeumorphicShape.convex,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(0)),
                                depth: 3,
                                color: c.colorPrimary),
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.fromLTRB(30, 40, 30, 30),
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                'login',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: c.white,
                                    fontSize: 18),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ),
                        Neumorphic(
                          style: NeumorphicStyle(
                              shape: NeumorphicShape.convex,
                              boxShape: NeumorphicBoxShape.circle(),
                              depth: 5,
                              color: Colors.white),
                          child: Container(
                            margin: EdgeInsets.all(20),
                            child: Image.asset(
                              imagePath.plant_logo,
                              height: 50,
                            ),
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                  child: Text(
                                    'User Name',
                                    style: TextStyle(
                                        color: c.grey_8, fontSize: 15),
                                    textAlign: TextAlign.left,
                                  )),
                              Container(
                                height: 80,
                                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                alignment: AlignmentDirectional.centerStart,
                                child: Neumorphic(
                                  style: NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      surfaceIntensity: 5,
                                      intensity: 5,
                                      boxShape: NeumorphicBoxShape.roundRect(
                                          BorderRadius.circular(12)),
                                      depth: -3,
                                      color: Colors.white),
                                  child: Container(
                                    margin: EdgeInsets.all(20),
                                    child: TextField(
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      maxLength: 6,
                                      controller: user_name,
                                      style: TextStyle(fontSize: 17),
                                      decoration: InputDecoration(
                                        counterText: "",
                                        contentPadding: EdgeInsets.zero,
                                        isDense: true,
                                        hintText: 'User Name',
                                        hintStyle: TextStyle(
                                            fontSize: 17.0, color: c.grey_6),
                                        border: InputBorder.none,
                                        prefixIcon: Image.asset(
                                          imagePath.user,
                                          color: c.colorPrimary,
                                          height: 20,
                                          width: 20,
                                        ),
                                        prefixIconConstraints: BoxConstraints(
                                          minHeight: 20,
                                          minWidth: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 0),
                                  child: Text(
                                    'Password',
                                    style: TextStyle(
                                        color: c.grey_8, fontSize: 15),
                                    textAlign: TextAlign.left,
                                  )),
                              Container(
                                height: 60,
                                alignment: AlignmentDirectional.center,
                                margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                                child: Neumorphic(
                                  style: NeumorphicStyle(
                                      shape: NeumorphicShape.concave,
                                      surfaceIntensity: 5,
                                      intensity: 5,
                                      boxShape: NeumorphicBoxShape.roundRect(
                                          BorderRadius.circular(12)),
                                      depth: -3,
                                      color: Colors.white),
                                  child: Container(
                                    margin: EdgeInsets.all(20),
                                    child: TextField(
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      controller: user_password,
                                      maxLength: 6,
                                      obscureText: !_passwordVisible,
                                      style: TextStyle(fontSize: 17),
                                      decoration: InputDecoration(
                                        counterText: "",
                                        contentPadding: EdgeInsets.zero,
                                        isDense: true,
                                        hintText: 'Password',
                                        hintStyle: TextStyle(
                                            fontSize: 17.0, color: c.grey_6),
                                        border: InputBorder.none,
                                        prefixIcon: Image.asset(
                                          imagePath.lock,
                                          color: c.colorPrimary,
                                          height: 20,
                                          width: 20,
                                        ),
                                        prefixIconConstraints: BoxConstraints(
                                          minHeight: 20,
                                          minWidth: 30,
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            // Based on passwordVisible state choose the icon
                                            _passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: c.grey_8,
                                          ),
                                          onPressed: () {
                                            // Update the state i.e. toogle the state of passwordVisible variable
                                            setState(() {
                                              _passwordVisible =
                                                  !_passwordVisible;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(20),
                                alignment: Alignment.center,
                                child: NeumorphicButton(
                                    onPressed: () async {

                                      user_name.text = "95995";
                                      user_password.text = "crd44#";
                                      if (user_name.text.isNotEmpty) {
                                        if (user_password.text.isNotEmpty) {
                                          // Go to home
                                           Timer(
        const Duration(seconds: 2),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home())));
                                        } else {
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Password Empty!'),
      duration: const Duration(seconds: 1),
      action: SnackBarAction(
        label: 'ACTION',
        onPressed: () {},
      ),
    ));
                                        }
                                      } else {
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('User Name Empty!'),
      duration: const Duration(seconds: 1),
      action: SnackBarAction(
        label: 'ACTION',
        onPressed: () {},
      ),
    ));
                                      }
                                    },
                                    style: NeumorphicStyle(
                                        shape: NeumorphicShape.concave,
                                        boxShape: NeumorphicBoxShape.roundRect(
                                            BorderRadius.circular(12)),
                                        depth: 30,
                                        lightSource: LightSource.topLeft,
                                        color: c.colorPrimary),
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: c.white,
                                          fontSize: 18),
                                      textAlign: TextAlign.left,
                                    )),
                              )
                            ]),
                      ])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}