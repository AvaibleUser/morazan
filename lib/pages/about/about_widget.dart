import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late Timer _timer;
  int _currIndex = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 2),
      (timer) => setState(() => _currIndex += _currIndex < 3 ? 1 : -_currIndex),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, anim) {
                      double begin = _currIndex % 2 == 0 ? 2 : 0;

                      return RotationTransition(
                        turns:
                            Tween<double>(begin: begin, end: 1).animate(anim),
                        child: ScaleTransition(scale: anim, child: child),
                      );
                    },
                    child: Icon(
                      switch (_currIndex) {
                        0 => Icons.sunny,
                        1 => Icons.water_drop,
                        2 => Symbols.cloud,
                        _ => Icons.thermostat
                      },
                      size: 50,
                      fill: 1,
                      key: ValueKey(_currIndex),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Aplicación del clima desarrollada por el Grupo 5 de prácticas intermedias del 7mo semestre usando los sensores de CyT",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Integrantes:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text("Elvis Lizandro Aguilar Tax 201930304"),
                  const Text("Rudy Adolfo Pacheco Pacheco 201930220"),
                  const Text("David Enrique Lux Barrera 201931344"),
                  const Text("Dylan Antonio Elías Vásquez 201931369"),
                  const Text("Brayan Alexander Alonzo Quijivix 201931078"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
