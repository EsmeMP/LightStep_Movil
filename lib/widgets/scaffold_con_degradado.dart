import 'package:flutter/material.dart';

class ScaffoldConDegradado extends StatefulWidget {
  final Widget body;

  const ScaffoldConDegradado({super.key, required this.body});

  @override
  State<ScaffoldConDegradado> createState() => _ScaffoldConDegradadoState();
}

class _ScaffoldConDegradadoState extends State<ScaffoldConDegradado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 32, 12, 30),
              Colors.purple,
            ],
          ),
        ),
        child: widget.body,
      ),
    );
  }
}
