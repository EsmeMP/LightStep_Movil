import 'package:flutter/material.dart';
// import 'package:flutter_application_1/appbar.dart';
// import 'package:flutter_application_1/scaffold_con_degradado.dart';
// import 'package:flutter_application_1/screens/inicio.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:light_step_app/screens/inicio.dart';
import 'package:light_step_app/widgets/app&tab.dart';
import 'package:light_step_app/widgets/scaffold_con_degradado.dart'; // Importa la librería para animación

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<LoginScreen> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldConDegradado(
      appBar: const AppbarStyle(title: "Iniciar Sesión"),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Ícono de usuario
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFFFF0080), Color(0xFF8000FF)],
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black,
                      child: Icon(Icons.person, size: 60, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Texto animado "Iniciar Sesión"
                  _animatedTitle(),
                  const SizedBox(height: 40),

                  // Campos de texto (Usuario y Contraseña)
                  _buildTextField(
                      Icons.person, "Usuario", false, _usuarioController),
                  const SizedBox(height: 20),
                  _buildTextField(
                      Icons.lock, "Contraseña", true, _passwordController),
                  const SizedBox(height: 20),

                  // Botón de Iniciar Sesión
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFFFF0080), Color(0xFF8000FF)],
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          _validarYContinuar();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text("Iniciar Sesión",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
    );
  }

  /// Animación de título "Iniciar Sesión"
  Widget _animatedTitle() {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          TyperAnimatedText(
            "Iniciar Sesión",
            speed: const Duration(milliseconds: 200),
          ),
        ],
        isRepeatingAnimation: true, // Hace que la animación se repita
        repeatForever: true, // Se repite indefinidamente
      ),
    );
  }

  /// Campo de texto con borde y color personalizado
  Widget _buildTextField(IconData icon, String hintText, bool obscureText,
      TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFFFF0080), Color(0xFF8000FF)],
          ),
        ),
        padding: const EdgeInsets.all(2),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: Colors.purple.shade900,
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.white),
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.white70),
              filled: true,
              fillColor: Colors.purple.shade900,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
          ),
        ),
      ),
    );
  }

  /// Valida los campos y navega a la pantalla de inicio
  void _validarYContinuar() {
    String usuario = _usuarioController.text.trim();
    String password = _passwordController.text.trim();

    if (usuario.isEmpty || password.isEmpty) {
      _mostrarMensaje("Por favor, ingresa usuario y contraseña.");
    } else {
      // Cerrar el teclado
      FocusScope.of(context).unfocus();

      // Navegar a la pantalla de inicio
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Inicio()),
      );
    }
  }

  /// Muestra un mensaje de error si los campos están vacíos
  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
