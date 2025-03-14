import 'package:flutter/material.dart';
import 'package:light_step_app/screens/consumo.dart';
import 'package:light_step_app/screens/encendido.dart';
import 'package:light_step_app/screens/iniciar_sesion.dart';
import 'package:light_step_app/screens/inicio.dart';
import 'package:light_step_app/screens/perfil.dart';
import 'package:light_step_app/screens/personalizacion.dart';
// import 'package:light_step_app/screens/personalizacion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto Mono',
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: const Perfil(),
    );
  }
}
