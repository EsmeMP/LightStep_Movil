import 'package:flutter/material.dart';

class IniciarSesion extends StatefulWidget {
  const IniciarSesion({super.key});

  @override
  State<IniciarSesion> createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Iniciar Sesión"),
      ),
      body: Center(
        child: Text(
          "Pantalla de inicio de sesión",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
