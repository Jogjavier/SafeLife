import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/control_screen.dart';

void main() {
  runApp(const SafeLifeApp());
}

class SafeLifeApp extends StatelessWidget {
  const SafeLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safe Life',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEFEFEF), // fondo gris claro
        primaryColor: const Color(0xFF94B4B4), // verde azulado
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFF4A4A4A), fontSize: 16),
          titleLarge: TextStyle(color: Color(0xFF4A4A4A), fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF94B4B4),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ),
      home: const LoginScreen(), // 👈 aquí conectas tu pantalla
    );
  }
}