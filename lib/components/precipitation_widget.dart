import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:morazan/components/satelite_info_piece.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Importa AppLocalizations

class PrecipitationWidget extends StatelessWidget {
  final double _precipitation;

  const PrecipitationWidget({super.key, required double precipitation})
      : _precipitation = precipitation;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(
        context)!; // Obtiene la instancia de AppLocalizations

    return SateliteInfoPiece(
      title: l10n.precipitacion, // Usa la traducción para el título
      data: _precipitation,
      unit: "cm³",
      icon: Icon(
        getSimbolWeather(_precipitation),
        size: 60,
        color: Colors.indigo.shade400,
        fill: 1,
      ),
    );
  }

  IconData getSimbolWeather(num precipitation) {
    if (precipitation >= 1000) {
      return Symbols.cloudy_snowing;
    } else {
      return Symbols.cloud;
    }
  }
}
