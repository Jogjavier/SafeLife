import 'package:flutter/material.dart';

class ExportarPdfScreen extends StatelessWidget {
  const ExportarPdfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial médico y datos'),
        backgroundColor: const Color(0xFF94B4B4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Datos del paciente',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Nombre: Lezly Vanesa'),
            const Text('Edad: 20'),
            const Text('Sexo: Femenino'),
            const Text('Teléfono: 4921234567'),
            const Text('Dirección: Calle Falsa 123'),
            const SizedBox(height: 20),

            const Text(
              'Historial médico',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text('Consulta - 15/05/2025'),
                    subtitle: Text('Síntomas de gripe. Se recetó paracetamol.'),
                  ),
                  ListTile(
                    title: Text('Consulta - 01/04/2025'),
                    subtitle: Text('Revisión general. Todo en orden.'),
                  ),
                  // Agrega más entradas simuladas aquí
                ],
              ),
            ),

            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Aquí se colocaría la lógica para generar el PDF
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('PDF generado exitosamente.')),
                  );
                },
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text('Generar PDF'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF94B4B4),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
