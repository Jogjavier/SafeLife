import 'package:flutter/material.dart';
import 'paramedico_screen.dart';
import 'perfilpar_screen.dart';
import 'chat_screen.dart';
import 'mensajeria_screen.dart';
import 'historial_screen.dart';

class BienvparaScreen extends StatefulWidget {
  const BienvparaScreen({super.key});

  @override
  State<BienvparaScreen> createState() => _BienvparaScreenState();
}

class _BienvparaScreenState extends State<BienvparaScreen> {
  String mensaje = '';
  bool _tieneMensajesNuevos = true;

  void _verHistorial() {
    setState(() {
      mensaje = 'Mostrando historial médico';
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const HistorialMedicoScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBF1F1),
      body: SafeArea(
        child: Column(
          children: [
            // Encabezado con menú
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: const Color(0xFF94B4B4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'SafeLife',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Stack(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.message, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                _tieneMensajesNuevos = false; // ocultar notificación
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const MensajeriaScreen()),
                              );
                            },
                          ),
                          if (_tieneMensajesNuevos)
                            const Positioned(
                              right: 8,
                              top: 8,
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.red,
                              ),
                            ),
                        ],
                      ),
                      PopupMenuButton<String>(
                        icon: const Icon(Icons.settings, color: Colors.white),
                        onSelected: (value) {
                          if (value == 'perfil') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const PerfilParScreen()),
                            );
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(value: 'perfil', child: Text('Perfil')),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),


            const SizedBox(height: 30),

            // Logo
            Image.asset('assets/safelife_logo.jpg', height: 160),

            const SizedBox(height: 30),

            // Contenedor con huella
            GestureDetector(
              onTap: _verHistorial,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE1EAEA),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 10,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: Image.asset('assets/huella_icon.jpg', height: 100),
              ),
            ),

            const SizedBox(height: 30),

            // Botón "Ingresar Datos"
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF94B4B4),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ParamedicoScreen()),
                );
              },
              child: const Text(
                'Ingresar Datos',
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 30),

            // Botón "Ver historial médico"
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF94B4B4),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HistorialMedicoScreen()),
                );
              },
              child: const Text(
                'Ver historial médico',
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 20),

            // Mensaje de estado
            Text(
              mensaje,
              style: TextStyle(
                color: mensaje.contains('Mostrando') ? Colors.green : Colors.red,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
