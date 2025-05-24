import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos simulados por defecto
    const nombre = 'Lezly Vanesa';
    const edad = '20';
    const sexo = 'Femenino';
    const tipoSangre = 'O+';
    const alergias = 'Ninguna';
    const emergencia = '4921234567';
    const doctor = 'Dr. Ramírez';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil del Paciente'),
        backgroundColor: Color(0xFF94B4B4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: $nombre', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Edad: $edad', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Sexo: $sexo', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Tipo de Sangre: $tipoSangre', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Alergias: $alergias', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Número de emergencia: $emergencia', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Doctor personal: $doctor', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
