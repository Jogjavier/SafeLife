import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/control_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeLife',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        '/control': (context) => ControlScreen(),
      },
    );
  }
}


