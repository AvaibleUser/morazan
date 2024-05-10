
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
      <= 67.5 => "noreste",
      <= 112.5 => "este",
      <= 157.5 => "sureste",
      <= 202.5 => "sur",
      <= 247.5 => "suroeste",
      <= 292.5 => "oeste",
      _ => "noroeste",
    };

    return SateliteInfoPiece(
      title: 'Velocidad del viento ($direction)',
      data: _velocity,
      unit: "Km/s",
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
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: _direction + 0.0),
              duration:
                  const Duration(milliseconds: 500), // Duración de la animación
              builder: (context, double angle, child) {
                return Transform.rotate(
                  angle: angle * math.pi / 180,
                  child: Icon(
                    Symbols.assistant_navigation,
                    size: 45,
                    color: Colors.green.shade400,
                    fill: 1,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
