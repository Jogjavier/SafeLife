import 'package:flutter/material.dart';
import 'paciente_screen.dart';
import 'perfil_screen.dart';
import 'pacimens_screen.dart';
import 'politica_screen.dart';
import 'historial_screen.dart';
import 'exportpdf_screen.dart';// Asegúrate que esté al inicio
import 'historial_screen.dart';




class BienvenidaScreen extends StatefulWidget {
  const BienvenidaScreen({super.key});

  @override
  State<BienvenidaScreen> createState() => _BienvenidaScreenState();
}

class _BienvenidaScreenState extends State<BienvenidaScreen> {
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
            // ENCABEZADO
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
                                _tieneMensajesNuevos = false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const PacimensScreen(),
                                ),
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
                              MaterialPageRoute(builder: (_) => const PerfilScreen()),
                            );
                          } else if (value == 'politica') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const PoliticaUsoScreen()),
                            );
                          } else if (value == 'exportar') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const ExportarPdfScreen()),
                            );
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(value: 'perfil', child: Text('Perfil')),
                          const PopupMenuItem(value: 'politica', child: Text('Política de uso')),
                          const PopupMenuItem(value: 'exportar', child: Text('Exportar a PDF')),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              '¡Bienvenida!',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Lezly Vanesa',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // LOGO
            Image.asset('assets/safelife_logo.jpg', height: 140),

            const SizedBox(height: 30),

            // HUELLA ICONO
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

            // BOTÓN INGRESAR DATOS
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
                  MaterialPageRoute(builder: (_) => const PacienteScreen()),
                );
              },
              child: const Text(
                'Ingresar Datos',
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 30),

            // BOTÓN VER HISTORIAL
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

            // MENSAJE ESTADO
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



