import 'package:flutter/material.dart';
import 'package:light_step_app/screens/iniciar_sesion.dart';
import 'package:light_step_app/widgets/scaffold_con_degradado.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ScaffoldConDegradado(
        body: IniciarSesion(),
      ),
    );
  }
}
