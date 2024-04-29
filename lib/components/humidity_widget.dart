import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:morazan/components/satelite_info_piece.dart';

class FloorHumidity extends StatelessWidget {
  final List<double> _humidity;

  const FloorHumidity({super.key, required List<double> humidity})
      : _humidity = humidity;

  @override
  Widget build(BuildContext context) {
    return SateliteInfoPiece(
      title: 'Humedad del suelo',
      data: _humidity,
      unit: "%",
      icon: Icon(Symbols.humidity_percentage,
          size: 60, color: Colors.blueAccent.shade700),
      borderColor: Colors.blue.shade100,
      textColor: Colors.blueAccent.shade700,
    );
  }
}
