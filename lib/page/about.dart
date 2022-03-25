//@dart=2.9
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grocery/commons/common.dart';
import 'package:grocery/widgets/custom_text.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: green,
          elevation: 0,
          iconTheme: const IconThemeData(color: white),
          title: CustomText(
            text: "About",
            size: 27,
            color: white,
            weight: FontWeight.w500,
          ),
          centerTitle: true,
        ),
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
                      Icon(
                        Icons.info_outline,
                        size: 30,
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
