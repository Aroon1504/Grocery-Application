//@dart=2.9
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grocery/commons/common.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () => print("Splash Done"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(color: green),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: white,
                  radius: 50.0,
                  child: Image.asset(
                      "assets/images/grocery-logos_transparent.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Text(
                  "Grocery",
                  style: TextStyle(
                      color: white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            )),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: white,
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text(
                    "Online Grocery \n For Everyone",
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  )
                ],
              ),
            )
          ],
        )
      ],
    ));
  }
}
