import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:light_step_app/screens/consumo.dart';
import 'package:light_step_app/screens/encendido.dart';
import 'package:light_step_app/screens/iniciar_sesion.dart';
import 'package:light_step_app/screens/inicio.dart';
import 'package:light_step_app/screens/perfil.dart';
import 'package:light_step_app/screens/personalizacion.dart';
import 'package:light_step_app/services/lightstep_service.dart';
// import 'package:light_step_app/screens/personalizacion.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  print('Firebase inicializado correctamente');

  LightstepService service = LightstepService();

  service.getConfiguracion('configuracion').listen((configuracion) {
    print('Recibidas ${configuracion.length} configuraciones');
    for (var config in configuracion) {
      print(
          'ID: ${config.id}, Nombre: ${config.nombre}, Color: ${config.color}');
    }
  });
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
