import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String pacienteNombre;

  const ChatScreen({super.key, required this.pacienteNombre});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _mensajeController = TextEditingController();

  // Simulación de mensajes entre médico y paciente
  List<Map<String, String>> mensajes = [
    {'remitente': 'paciente', 'texto': 'Hola doctor, tengo una duda sobre mi tratamiento.'},
    {'remitente': 'medico', 'texto': '¡Hola! Claro, dime qué duda tienes.'},
    {'remitente': 'paciente', 'texto': '¿Puedo tomar el medicamento con el estómago vacío?'},
    {'remitente': 'medico', 'texto': 'Preferiblemente después de comer. Gracias por preguntar.'},
  ];

  void _enviarMensaje() {
    final texto = _mensajeController.text.trim();
    if (texto.isEmpty) return;

    setState(() {
      mensajes.add({'remitente': 'medico', 'texto': texto});
      _mensajeController.clear();
    });
  }

  Widget _mensajeBurbuja(String texto, bool esMedico) {
    return Align(
      alignment: esMedico ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: const BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: esMedico ? const Color(0xFF94B4B4) : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          texto,
          style: TextStyle(
            color: esMedico ? Colors.white : Colors.black,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat con ${widget.pacienteNombre}'),
        backgroundColor: const Color(0xFF94B4B4),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: mensajes.length,
              itemBuilder: (context, index) {
                final mensaje = mensajes[index];
                final esMedico = mensaje['remitente'] == 'medico';
                return _mensajeBurbuja(mensaje['texto']!, esMedico);
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _mensajeController,
                    decoration: const InputDecoration(
                      hintText: 'Escribe un mensaje...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF94B4B4)),
                  onPressed: _enviarMensaje,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

