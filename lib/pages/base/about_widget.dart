import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acerca de"),
      ),
      body: Center(
        child: Text("Aplicacion del clima desarrollada por el Grupo 5 de practicas intermedias del 7mo semestre usando los sensores de CyT "),
      ),
    );
  }
}