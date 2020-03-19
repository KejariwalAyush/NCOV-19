
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      title: 'NCOV-19', 
    );
  }
}
