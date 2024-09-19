import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? errorMessage;

  void login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        errorMessage = "Datos incompletos";
      });
    } else if (email != "test@correo.mx") {
      setState(() {
        errorMessage = "Correo incorrecto";
      });
    } else if (password != "FDM2") {
      setState(() {
        errorMessage = "Contraseña incorrecta";
      });
    } else {
      setState(() {
        errorMessage = null;
      });
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(errorMessage!, style: TextStyle(color: Colors.red)),
              ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
