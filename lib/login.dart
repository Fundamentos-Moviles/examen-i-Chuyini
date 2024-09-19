import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = '';

  void _login() {
    setState(() {
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        _errorMessage = 'Datos incompletos';
      } else if (_emailController.text != 'test@correo.mx') {
        _errorMessage = 'Usuario incorrecto';
      } else if (_passwordController.text != 'FDM2') {
        _errorMessage = 'Contraseña incorrecta';
      } else {
        _errorMessage = '';
        Navigator.pushNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(color: Color(0xff015236)),
          FondoCuadrados(), // Manteniendo el patrón específico
          Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Text(
                    'Bienvenido a tu primer EXAMEN',
                    style: TextStyle(color:  Color(0xff96b602), fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Correo electrónico',
                      labelStyle: TextStyle(color:  Color(0xff96b602)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff919b02)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff919b02)),
                      ),
                    ),
                    style: TextStyle( color: Color(0xff96b602)),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: TextStyle(color: Color(0xff96b602)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff919b02)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff919b02)),
                      ),
                    ),
                    obscureText: true,
                    style: TextStyle(color:  Color(0xff96b602)),
                  ),
                  if (_errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        _errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _login,
                    child: Text('Iniciar Sesión'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffdca900), // Color del botón
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Mi primer examen, ¿estará sencillo?',
                    style: TextStyle(color:  Color(0xff96b602)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FondoCuadrados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el ancho total de la pantalla y dividirlo entre 4
    double screenWidth = MediaQuery.of(context).size.width;
    double squareWidth = screenWidth / 4; // 4 cuadrados por fila

    return Container(
      color: Color(0xff015236),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Aquí mantenemos el patrón específico de los cuadrados
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Cuadrado3(width: squareWidth),
              CuadradoInvisible(width: squareWidth),
              Cuadrado3(width: squareWidth),
              Cuadrado4(width: squareWidth),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Cuadrado4(width: squareWidth),
              Cuadrado2(width: squareWidth),
              Cuadrado3(width: squareWidth),
              CuadradoInvisible(width: squareWidth),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Cuadrado3(width: squareWidth),
              Cuadrado4(width: squareWidth),
              CuadradoInvisible(width: squareWidth),
              Cuadrado2(width: squareWidth),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CuadradoInvisible(width: squareWidth),
              Cuadrado2(width: squareWidth),
              Cuadrado4(width: squareWidth),
              Cuadrado3(width: squareWidth),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Cuadrado2(width: squareWidth),
              CuadradoInvisible(width: squareWidth),
              Cuadrado3(width: squareWidth),
              Cuadrado4(width: squareWidth),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Cuadrado4(width: squareWidth),
              Cuadrado3(width: squareWidth),
              Cuadrado2(width: squareWidth),
              CuadradoInvisible(width: squareWidth),
            ],
          ),
        ],
      ),
    );
  }
}

// Definición de cada cuadrado con el tamaño adaptable
class Cuadrado4 extends StatelessWidget {
  final double width;
  Cuadrado4({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: width ,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xff02b274),

        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}

class Cuadrado2 extends StatelessWidget {
  final double width;
  Cuadrado2({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: width,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xff01644a),
        borderRadius: BorderRadius.circular(12.0),

      ),
    );
  }
}

class Cuadrado3 extends StatelessWidget {
  final double width;
  Cuadrado3({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: width ,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xff01412e),
        borderRadius: BorderRadius.circular(12.0),


      ),
    );
  }
}

class CuadradoInvisible extends StatelessWidget {
  final double width;
  CuadradoInvisible({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: width - 8,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.transparent, // Color transparente

        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
