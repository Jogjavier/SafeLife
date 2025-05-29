import 'package:flutter/material.dart';

class PoliticaUsoScreen extends StatelessWidget {
  const PoliticaUsoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Política de uso'),
        backgroundColor: const Color(0xFF94B4B4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: const Text(
            '''
Política de uso de SafeLife:

1. La aplicación está destinada únicamente para uso médico y de gestión de datos clínicos.
2. Toda la información almacenada debe manejarse con responsabilidad, privacidad y ética profesional.
3. No está permitido compartir datos personales o médicos sin consentimiento del paciente.
4. El uso indebido de esta aplicación puede estar sujeto a sanciones legales o administrativas.
5. SafeLife no se hace responsable por el uso inapropiado de los datos ingresados por los usuarios.
6. El paciente esta de aucerdo que al momento de una emergencia el medico/paramedico tiene la autorizacion para tomar la huella dactilar del paciente.

Al continuar usando esta app, aceptas estas condiciones de uso.
''',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
