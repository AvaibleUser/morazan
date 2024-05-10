import 'package:flutter/material.dart';
import 'package:morazan/components/satelite_info_piece.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FloorHumidity extends StatelessWidget {
  final List<double> _humidity;

  const FloorHumidity({super.key, required List<double> humidity})
      : _humidity = humidity;

  @override
  Widget build(BuildContext context) {
     final l10n = AppLocalizations.of(context)!; 
    return SateliteInfoPiece(
      title: l10n.humedad,
      data: _humidity,
      unit: "%",
      icon: Icon(Icons.water_drop, size: 60, color: Colors.blueAccent.shade700),
    );
  }
}
