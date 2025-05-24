import 'package:flutter/material.dart';

class PerfilParScreen extends StatelessWidget {
  const PerfilParScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil del Paramédico'),
        backgroundColor: const Color(0xFF94B4B4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Nombre: Dr. Juan Pérez', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Especialidad: Cardiología', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Número de licencia médica: 1234567890', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Contacto: 4491234567', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Dirección del hospital: Av. Salud #123', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Área médica: Cuidados intensivos', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
