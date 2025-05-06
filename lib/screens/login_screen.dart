import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login() {
    final user = _userController.text.trim();
    final pass = _passController.text.trim();

    if (_formKey.currentState!.validate()) {
      if (user == 'admin' && pass == '1234') {
        Navigator.pushNamed(context, '/control');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Usuario o contraseña incorrectos')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/Logo.png',
                    height: 200,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: _userController,
                    validator: (value) =>
                        value!.isEmpty ? 'Ingresa tu usuario' : null,
                    decoration: InputDecoration(
                      labelText: 'Usuario',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passController,
                    obscureText: true,
                    validator: (value) =>
                        value!.isEmpty ? 'Ingresa tu contraseña' : null,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _login,
                    child:
                        Text('Iniciar sesión', style: TextStyle(fontSize: 20)),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // lógica para crear cuenta futura
                    },
                    child:
                        Text('Crear sesión', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
