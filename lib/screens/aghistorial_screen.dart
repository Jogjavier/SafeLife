import 'package:flutter/material.dart';

class AgregarHistorialScreen extends StatefulWidget {
  const AgregarHistorialScreen({super.key});

  @override
  State<AgregarHistorialScreen> createState() => _AgregarHistorialScreenState();
}

class _AgregarHistorialScreenState extends State<AgregarHistorialScreen> {
  final _formKey = GlobalKey<FormState>();

  String nombrePaciente = '';
  String diagnostico = '';
  String tratamiento = '';
  String fecha = '';
  String alergias = '';
  String vacunasAplicadas = '';

  void _guardarHistorial() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Aquí podrías guardar a una base de datos en el futuro
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Historial médico guardado')),
      );

      // Puedes limpiar el formulario si deseas
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Historial Médico'),
        backgroundColor: const Color(0xFF94B4B4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombre del paciente',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? 'Ingrese el nombre' : null,
                onSaved: (value) => nombrePaciente = value!,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Diagnóstico',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? 'Ingrese el diagnóstico' : null,
                onSaved: (value) => diagnostico = value!,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Tratamiento',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? 'Ingrese el tratamiento' : null,
                onSaved: (value) => tratamiento = value!,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Alergias',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? 'Ingrese alergias' : null,
                onSaved: (value) => alergias = value!,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Vacunas Aplicadas',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? 'Ingrese vacunas aplicadas' : null,
                onSaved: (value) => vacunasAplicadas = value!,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Fecha (ej. 2025-05-27)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? 'Ingrese la fecha' : null,
                onSaved: (value) => fecha = value!,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _guardarHistorial,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF94B4B4),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'Guardar Historial',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
