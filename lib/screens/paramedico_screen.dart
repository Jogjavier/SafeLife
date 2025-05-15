import 'package:flutter/material.dart';

class ParamedicoScreen extends StatelessWidget {
  const ParamedicoScreen({super.key});

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
            _buildInputField('Especialidad'),
            _buildInputField('Numero de licencia medica'),
            _buildInputField('Contacto'),
            _buildInputField('Direccion del hospital'),
            _buildInputField('Area medica'),
            _buildInputField('Doctor personal'),
            const SizedBox(height: 16),
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