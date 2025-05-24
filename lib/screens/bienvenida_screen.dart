import 'package:flutter/material.dart';
import 'paciente_screen.dart';
import 'perfil_screen.dart';


class BienvenidaScreen extends StatefulWidget {
  const BienvenidaScreen({super.key});

  @override
  State<BienvenidaScreen> createState() => _BienvenidaScreenState();
}

class _BienvenidaScreenState extends State<BienvenidaScreen> {
  String mensaje = '';

  void _verHistorial() {
    setState(() {
      mensaje = 'Mostrando historial médico';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('¡Bienvenido al historial médico!')),
    );

    // Aquí podrías navegar a la pantalla del historial si ya la tienes creada
    // Navigator.push(context, MaterialPageRoute(builder: (_) => HistorialScreen()));
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
                IconButton(
                  icon: const Icon(Icons.message, color: Colors.white),
                  onPressed: () {
                    // Aquí podrías navegar a la pantalla de mensajes
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Abrir mensajes')),
                    );
                  },
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.settings, color: Colors.white),
                  onSelected: (value) {
                    if (value == 'perfil') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PerfilScreen(),
                        ),
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
            const Text(
              '¡Bienvenida!',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Lezly Vanesa',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Logo
            Image.asset('assets/safelife_logo.jpg', height: 160),

            const SizedBox(height: 30),

            // Contenedor con huella (solo decorativo)
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
                  MaterialPageRoute(builder: (context) => const PacienteScreen()),
                );
              },
              child: const Text(
                'Ingresar Datos',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF94B4B4),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: _verHistorial,
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


