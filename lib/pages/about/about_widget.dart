import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wb_sunny, // Icono del clima
                    size: 50,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Aplicación del clima desarrollada por el Grupo 5 de prácticas intermedias del 7mo semestre usando los sensores de CyT",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Integrantes:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Elvis Lizandro Aguilar Tax 201930304"),
                  Text("Rudy Adolfo Pacheco Pacheco 201930220"),
                  Text("David Enrique Lux Barrera 201931344"),
                  Text("Dylan Antonio Elías Vásquez 201931369"),
                  Text("Brayan Alexander Alonzo Quijivix 201931078"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
