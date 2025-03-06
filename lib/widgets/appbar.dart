import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucide_icons/lucide_icons.dart'; // Usa íconos modernos

class AppbarStyle extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onPowerPressed; // Agregar función para el botón

  const AppbarStyle({super.key, required this.title, this.onPowerPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'LightStep',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 200, // Tamaño personalizado
          width: 200,
          child: SvgPicture.asset(
            'assets/logo.svg',
            fit: BoxFit.contain,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Hace que el botón sea circular
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 252, 60, 210),
                  Color.fromARGB(168, 112, 36, 242),
                  //   Color.fromARGB(255, 213, 167, 251),
                  Color.fromARGB(255, 226, 31, 86),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(3), // Espacio para el borde
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(
                    114, 250, 250, 250), // Fondo interno del botón
              ),
              child: IconButton(
                icon: const Icon(LucideIcons.power, color: Colors.white),
                onPressed: onPowerPressed ?? () {},
              ),
            ),
          ),
        ),
      ],
      backgroundColor: Colors.black.withOpacity(0.0),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
