import 'package:flutter/material.dart';

class FormaPagoScreen extends StatefulWidget {
  const FormaPagoScreen({super.key});

  @override
  State<FormaPagoScreen> createState() => _FormaPagoScreenState();
}

class _FormaPagoScreenState extends State<FormaPagoScreen> {
  String _metodoSeleccionado = 'Tarjeta de crédito';
  final _formKey = GlobalKey<FormState>();

  String numeroTarjeta = '';
  String titular = '';
  String fechaExpiracion = '';
  String cvv = '';

  void _confirmarPago() {
    if (_metodoSeleccionado == 'Tarjeta de crédito' &&
        !_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState?.save();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pago procesado exitosamente')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forma de Pago'),
        backgroundColor: const Color(0xFF94B4B4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Seleccione el método de pago:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: _metodoSeleccionado,
              items: <String>[
                'Tarjeta de crédito',
                'Efectivo',
                'Transferencia bancaria'
              ].map((String metodo) {
                return DropdownMenuItem<String>(
                  value: metodo,
                  child: Text(metodo),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _metodoSeleccionado = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            if (_metodoSeleccionado == 'Tarjeta de crédito')
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Número de tarjeta',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
                      onSaved: (value) => numeroTarjeta = value!,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Titular de la tarjeta',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
                      onSaved: (value) => titular = value!,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Fecha de expiración (MM/AA)',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
                      onSaved: (value) => fechaExpiracion = value!,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'CVV',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
                      onSaved: (value) => cvv = value!,
                    ),
                  ],
                ),
              ),
            if (_metodoSeleccionado != 'Tarjeta de crédito')
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'No se requiere información adicional para este método.',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            const Spacer(),
            ElevatedButton(
              onPressed: _confirmarPago,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF94B4B4),
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text(
                'Confirmar Pago',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
