
import 'package:flutter/material.dart';
import 'package:flutter_app/splash.dart';
import 'package:overlay_support/overlay_support.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void initState() {
    Splash();
  }
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
        child: MaterialApp(
          color: Colors.amber,
          home: Splash(),
          debugShowCheckedModeBanner: false,
          title: 'NCOV-19',
        )
    );
  }
}
