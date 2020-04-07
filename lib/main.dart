
import 'package:flutter/material.dart';
import 'package:flutter_app/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.amber,
      home: Splash(),
      debugShowCheckedModeBanner: false,
      title: 'NCOV-19', 
    );
  }
}
