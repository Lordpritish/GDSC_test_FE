import 'package:flutter/material.dart';
import 'auth/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/home', routes: {
      // '/': (context) => Loading(),
      '/home': (context) => LoginPage(),
      // '/location': (context) => ChooseLocation(),
    });
  }
}
