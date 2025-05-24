import 'package:flutter/material.dart';
import 'chat_screen.dart';

class MensajeriaScreen extends StatefulWidget {
  const MensajeriaScreen({super.key});

  @override
  State<MensajeriaScreen> createState() => _ListaPacientesScreenState();
}

class _ListaPacientesScreenState extends State<MensajeriaScreen> {
  List<String> pacientes = [
    'Juan Pérez',
    'Ana García',
    'Carlos López',
    'María Torres',
  ];

  void _eliminarPaciente(String nombre) {
    setState(() {
      pacientes.remove(nombre);
    });
  }

  void _abrirChat(String nombre) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatScreen(pacienteNombre: nombre)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacientes'),
        backgroundColor: const Color(0xFF94B4B4),
      ),
      body: ListView.builder(
        itemCount: pacientes.length,
        itemBuilder: (context, index) {
          final paciente = pacientes[index];
          return ListTile(
            title: Text(paciente),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.chat, color: Color(0xFF94B4B4)),
                  onPressed: () => _abrirChat(paciente),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _eliminarPaciente(paciente),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
