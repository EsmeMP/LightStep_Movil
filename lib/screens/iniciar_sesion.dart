import 'package:flutter/material.dart';
import 'package:light_step_app/widgets/app&tab.dart';
import 'package:light_step_app/widgets/scaffold_con_degradado.dart';

class IniciarSesion extends StatefulWidget {
  const IniciarSesion({super.key});

  @override
  State<IniciarSesion> createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Aseguramos que 4 pestañas sean gestionadas correctamente
      child: ScaffoldConDegradado(
        appBar: AppbarStyle(
          title: "Iniciar Sesión",
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("Página de Inicio")),
            Center(child: Text("Opciones de Personalización")),
            Center(child: Text("Datos de Consumo")),
            Center(child: Text("Perfil del Usuario")),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.purple, // Fondo para que se vea mejor
          child: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Inicio"),
              Tab(icon: Icon(Icons.settings), text: "Personalización"),
              Tab(icon: Icon(Icons.battery_charging_full), text: "Consumo"),
              Tab(icon: Icon(Icons.person), text: "Perfil"),
            ],
          ),
        ),
      ),
    );
  }
}
