import 'package:flutter/material.dart';
import 'package:light_step_app/widgets/appbar.dart';
import 'package:light_step_app/widgets/scaffold_con_degradado.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});
  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldConDegradado(
      appBar: AppbarStyle(
        title: "Iniciar Sesión",
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.translate(
              offset: const Offset(0, 0), // Primer botón sin desplazamiento
              child: _buildGradientButton(
                context,
                "Personaliza",
                [
                  const Color.fromARGB(255, 168, 240, 73),
                  const Color.fromARGB(255, 47, 177, 228)
                ], // Degradado azul a morado
                () {
                  Navigator.pushNamed(context, '/seccion1');
                },
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -40), // Segundo botón sube 20px
              child: _buildGradientButton(
                context,
                "Mira tu consumo",
                // Icons.settings,
                [
                  const Color.fromARGB(255, 158, 181, 251),
                  const Color.fromARGB(255, 240, 84, 157)
                ], // Degradado naranja a rojo
                () {
                  Navigator.pushNamed(context, '/seccion2');
                },
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -80), // Tercer botón sube 40px
              child: _buildGradientButton(
                context,
                "Perfil",
                // Icons.person,
                [
                  const Color.fromARGB(255, 240, 87, 41),
                  const Color.fromARGB(255, 249, 201, 43)
                ], // Degradado verde a turquesa
                () {
                  Navigator.pushNamed(context, '/seccion3');
                },
              ),
            ),
          ],
        ),
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
    );
  }

  Widget _buildGradientButton(
    BuildContext context,
    String text,
    // IconData icon,
    List<Color> gradientColors,
    VoidCallback onPressed,
  ) {
    return Align(
      alignment: Alignment.centerLeft, // Alinea el botón a la izquierda
      child: Transform.translate(
        offset: const Offset(-40, 0), // Mueve el botón -40 en X
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: 240,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(120),
              bottomRight: Radius.circular(120),
            ), // Solo redondeamos el lado derecho
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: InkWell(
            onTap: onPressed,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(120),
              bottomRight: Radius.circular(120),
            ), // Coincide con el `borderRadius` del Container
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(icon, size: 40, color: Colors.white),
                // const SizedBox(width: 10),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
