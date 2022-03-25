//@dart=2.9
import 'package:flutter/material.dart';

const Color green = Colors.green;
const Color white = Colors.white;
const Color black = Colors.black;
const Color lightgreen = Colors.lightGreen;
const Color grey = Colors.grey;
const Color red = Colors.red;
const Color transparent = Colors.transparent;
const Color indigo = Colors.indigo;
const Color redAccent = Colors.redAccent;
const Color greenAccent = Colors.greenAccent;

//Methods

void changeScreen(BuildContext context,Widget widget){
  Navigator.push(context,MaterialPageRoute(builder:  (context)=>widget));
}
void changeScreenReplacement(BuildContext context,Widget widget){
  Navigator.pushReplacement(context,MaterialPageRoute(builder:  (context)=>widget));
}