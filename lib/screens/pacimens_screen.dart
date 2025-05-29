import 'package:flutter/material.dart';
import 'chat_screen.dart';

class PacimensScreen extends StatefulWidget {
  const PacimensScreen({super.key});

  @override
  State<PacimensScreen> createState() => _PacimensScreenState();
}

class _PacimensScreenState extends State<PacimensScreen> {
  List<String> pacientes = [
    'Juan Pérez',
    'Ana García',
    'Carlos López',
    'María Torres',
    'Dr. Mario Martinez',
    'Dr. Javier Ortiz',
  ];

  String _busqueda = '';

  void _abrirChat(String nombre) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatScreen(pacienteNombre: nombre)),
    );
  }

  void _eliminarPaciente(String nombre) {
    setState(() {
      pacientes.remove(nombre);
    });
  }

  void _agregarPaciente() {
    TextEditingController controlador = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Agregar contacto"),
        content: TextField(
          controller: controlador,
          decoration: const InputDecoration(hintText: "Nombre del nuevo contacto"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () {
              if (controlador.text.trim().isNotEmpty) {
                setState(() {
                  pacientes.add(controlador.text.trim());
                });
              }
              Navigator.pop(context);
            },
            child: const Text("Agregar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pacientesFiltrados = pacientes
        .where((p) => p.toLowerCase().contains(_busqueda.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactos'),
        backgroundColor: const Color(0xFF94B4B4),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _agregarPaciente,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              onChanged: (valor) {
                setState(() {
                  _busqueda = valor;
                });
              },
              decoration: InputDecoration(
                hintText: "Buscar contacto...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: pacientesFiltrados.length,
                itemBuilder: (context, index) {
                  final paciente = pacientesFiltrados[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE1EAEA),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 6,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => _abrirChat(paciente),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Color(0xFF94B4B4),
                                child: Icon(Icons.person, color: Colors.white),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                paciente,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () => _eliminarPaciente(paciente),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
