import 'package:flutter/material.dart';

class PacienteScreen extends StatelessWidget {
  const PacienteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingresar datos'),
        backgroundColor: const Color(0xFF94B4B4),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildInputField('Nombre'),
            _buildInputField('Edad'),
            _buildInputField('Sexo'),
            _buildInputField('Tipo de sangre'),
            _buildInputField('Alergias'),
            _buildInputField('Número de emergencia'),
            _buildInputField('Doctor personal'),
            const SizedBox(height: 16),

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Guardar historial médico
              },
              child: const Text('Ingresar historial médico'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Acción forma de pago
              },
              child: const Text('Forma de pago'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Color(0xFF4A4A4A)),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF4A4A4A)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF94B4B4)),
          ),
        ),
      ),
    );
  }
}
