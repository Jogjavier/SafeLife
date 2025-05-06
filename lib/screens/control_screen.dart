import 'package:flutter/material.dart';

class ControlScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla de Control')),
      body: Center(
        child: Text('Bienvenido al sistema de control'),
      ),
    );
  }
}
