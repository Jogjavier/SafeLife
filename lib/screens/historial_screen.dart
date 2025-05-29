import 'package:flutter/material.dart';

class HistorialMedicoScreen extends StatelessWidget {
  const HistorialMedicoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial Médico'),
        backgroundColor: const Color(0xFF94B4B4),
      ),
      backgroundColor: const Color(0xFFEBF1F1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _seccionTitulo('Datos del Paciente'),
            _dato('Nombre:', 'Lezly Vanesa'),
            _dato('Edad:', '28 años'),
            _dato('Sexo:', 'Femenino'),
            _dato('Tipo de Sangre:', 'O+'),

            const SizedBox(height: 20),
            _seccionTitulo('Antecedentes Médicos'),
            _itemLista('Asma desde la infancia'),
            _itemLista('Cirugía de apéndice (2019)'),
            _itemLista('Hipertensión controlada'),

            const SizedBox(height: 20),
            _seccionTitulo('Medicamentos Actuales'),
            _itemLista('Losartán 50mg - 1 vez al día'),
            _itemLista('Inhalador Salbutamol - según necesidad'),

            const SizedBox(height: 20),
            _seccionTitulo('Alergias'),
            _itemLista('Penicilina'),
            _itemLista('Polvo'),

            const SizedBox(height: 20),
            _seccionTitulo('Resultados Recientes'),
            _dato('Análisis de sangre (Mayo 2025)', 'Todo en rangos normales'),
            _dato('Radiografía de tórax', 'Sin hallazgos patológicos'),

            const SizedBox(height: 20),
            _seccionTitulo('Notas Médicas'),
            _notaMedica(
              'Consulta del 10 de mayo 2025',
              'Paciente estable. Se recomienda continuar tratamiento y hacer seguimiento en 3 meses.',
            ),
            _notaMedica(
              'Consulta del 20 de febrero 2025',
              'Se detectó leve aumento de presión arterial. Se ajusta medicación.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _seccionTitulo(String texto) {
    return Text(
      texto,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF375B5B),
      ),
    );
  }

  Widget _dato(String campo, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            campo,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(valor)),
        ],
      ),
    );
  }

  Widget _itemLista(String texto) {
    return ListTile(
      leading: const Icon(Icons.medical_services, color: Color(0xFF94B4B4)),
      title: Text(texto),
      contentPadding: const EdgeInsets.only(left: 0),
    );
  }

  Widget _notaMedica(String titulo, String contenido) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF94B4B4)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(contenido),
        ],
      ),
    );
  }
}
