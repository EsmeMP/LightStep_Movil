import 'package:flutter/material.dart';
import 'package:light_step_app/widgets/appbar.dart';
import 'package:light_step_app/widgets/scaffold_con_degradado.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConsumoScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ConsumoScreen extends StatefulWidget {
  const ConsumoScreen({super.key});

  @override
  State<ConsumoScreen> createState() => _ConsumoScreenState();
}

class _ConsumoScreenState extends State<ConsumoScreen> {
  // Variables para almacenar la información dinámica
  String todayUsageTime = "03h : 30m : 50s";
  String deviceOnCount = "5 veces";
  double bar1Height = 150;
  double bar2Height = 120;

  // Variables de estadísticas dinámicas (de hoy y semana anterior)
  String todayStats = "21h 00m";
  String weekStats = "03h 00m";

  // Función para cambiar las estadísticas (simula una actualización)
  void updateStats() {
    setState(() {
      todayStats = "21h 00m"; // Nuevo valor para hoy
      weekStats = "03h 00m"; // Nuevo valor para la semana anterior
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldConDegradado(
      appBar: AppbarStyle(title: 'Personalización'),
      // backgroundColor: Colors.purple.shade800, // Fondo morado más oscuro
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            _buildSectionTitle("Consumo"),
            const SizedBox(height: 10),
            _buildInfoBox("Hoy has utilizado el dispositivo:", todayUsageTime),
            const SizedBox(height: 10),
            _buildInfoBox("El dispositivo ha sido encendido:", deviceOnCount),
            const SizedBox(height: 20),
            _buildSectionTitle("Estadísticas"),
            const SizedBox(height: 10),
            Expanded(child: _buildBarChart()),
            const SizedBox(height: 20),
            _buildBottomButtons(),
            const SizedBox(height: 20),
            // Botón centrado para actualizar estadísticas con un degradado morado y rosa
            Center(
              child: _buildButton("Actualizar Estadísticas",
                  Colors.purple.shade600, Colors.pink.shade400),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.purple, // Fondo para que se vea mejor
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.white,
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.pushNamed(context, '/seccion1');
                },
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [Colors.pink, Colors.purple],
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildInfoBox(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.purple.shade700,
          ),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildBarChart() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple.shade700,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildBar(Colors.greenAccent, bar1Height, todayStats),
          _buildBar(Colors.orangeAccent, bar2Height, weekStats),
        ],
      ),
    );
  }

  Widget _buildBar(Color color, double height, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 40,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color, Colors.deepOrange],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton("Hoy", Colors.yellow.shade600,
            Colors.orange.shade700), // Degradado amarillo a naranja
        _buildButton("Semana Anterior", Colors.blue.shade400,
            Colors.green.shade400), // Degradado azul claro a verde
      ],
    );
  }

  Widget _buildButton(String text, Color startColor, Color endColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [startColor, endColor],
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
