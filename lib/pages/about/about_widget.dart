import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Text(
            "Aplicacion del clima desarrollada por el Grupo 5 de practicas intermedias del 7mo semestre usando los sensores de CyT "),
      ),
    );
  }
}
