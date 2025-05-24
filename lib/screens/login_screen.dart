import 'package:flutter/material.dart';
import 'package:safelife/screens/paramedico_screen.dart';
import 'paciente_screen.dart';
import 'bienvenida_screen.dart';
import 'bienpara_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.jpg', // asegúrate que exista en pubspec.yaml
                height: 250,
              ),
              const SizedBox(height: 40),
              const Text(
                'Iniciar sesión',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BienvenidaScreen(),
                    ),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_outline),
                    SizedBox(width: 8),
                    Text('Paciente'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BienvparaScreen(),
                    ),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.medical_services_outlined),
                    SizedBox(width: 8),
                    Text('Paramédico / médico'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

