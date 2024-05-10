import 'package:flutter/material.dart';
import 'package:morazan/components/satelite_info_piece.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SolarRadiation extends StatelessWidget {
  final double _radiation;

  const SolarRadiation({super.key, required double radiation})
      : _radiation = radiation;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!; 
    return SateliteInfoPiece(
      title: l10n.radiacion,
      data: _radiation,
      unit: "nm",
      icon: Icon(Icons.sunny, size: 60, color: Colors.orange.shade400),
      textColor: Colors.orange.shade400,
    );
  }
}
