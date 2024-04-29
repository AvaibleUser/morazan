import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:morazan/components/satelite_info_piece.dart';

class SolarRadiation extends StatelessWidget {
  final double _radiation;

  const SolarRadiation({super.key, required double radiation})
      : _radiation = radiation;

  @override
  Widget build(BuildContext context) {
    return SateliteInfoPiece(
      title: 'Radiacion solar',
      data: _radiation,
      unit: "nm",
      icon: Icon(Symbols.sunny, size: 60, color: Colors.orange.shade400),
      borderColor: Colors.yellow.shade100,
      textColor: Colors.orange.shade400,
    );
  }
}
