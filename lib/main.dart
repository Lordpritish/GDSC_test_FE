import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/home', routes: {
      // '/': (context) => Loading(),
      '/home': (context) => HomePage(),
      // '/location': (context) => ChooseLocation(),
    });
  }
}
