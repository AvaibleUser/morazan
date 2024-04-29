import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:morazan/components/satelite_info_piece.dart';

class Wind extends StatelessWidget {
  final double _velocity;
  final num _direction;

  const Wind({super.key, required double velocity, required num direction})
      : _velocity = velocity,
        _direction = direction;

  @override
  Widget build(BuildContext context) {
    String direction = switch (_direction) {
      <= 22.5 || > 337.5 => "norte",
      <= 67.5 => "noroeste",
      <= 112.5 => "oeste",
      <= 157.5 => "suroeste",
      <= 202.5 => "sur",
      <= 247.5 => "sureste",
      <= 292.5 => "este",
      _ => "noreste",
    };

    return SateliteInfoPiece(
      title: 'Velocidad del viento',
      data: _velocity,
      unit: "Km/s al $direction",
      borderColor: Colors.green.shade100,
      textColor: Colors.green.shade400,
      icon: SizedBox(
        width: 60,
        height: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "N",
              style: TextStyle(
                color: Colors.green.shade400,
                fontWeight: FontWeight.w900,
                fontSize: 10,
              ),
            ),
            Transform.rotate(
              angle: (-_direction) * math.pi / 180,
              child: Icon(Symbols.assistant_navigation,
                  size: 46, color: Colors.green.shade400),
            ),
          ],
        ),
      ),
    );
  }
}
