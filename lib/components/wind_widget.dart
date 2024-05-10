
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:morazan/components/satelite_info_piece.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Wind extends StatelessWidget {
  final double _velocity;
  final num _direction;

  const Wind({super.key, required double velocity, required num direction})
      : _velocity = velocity,
        _direction = direction;

  @override
  Widget build(BuildContext context) {
     final l10n = AppLocalizations.of(context)!; 
    String direction = switch (_direction) {
      <= 22.5 || > 337.5 => l10n.norte,
      <= 67.5 => l10n.noreste,
      <= 112.5 => l10n.este,
      <= 157.5 => l10n.sureste,
      <= 202.5 => l10n.sur,
      <= 247.5 => l10n.suroeste,
      <= 292.5 => l10n.oeste,
      _ => l10n.noroeste,
    };

    return SateliteInfoPiece(
      title:  '${l10n.velocidad}($direction)',
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
