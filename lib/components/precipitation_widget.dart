import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:morazan/components/satelite_info_piece.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Importa AppLocalizations

class PrecipitationWidget extends StatelessWidget {
  final double precipitation;

  const PrecipitationWidget({super.key, required this.precipitation});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!; // Obtiene la instancia de AppLocalizations

    return SateliteInfoPiece(
      title: l10n.precipitacion, // Usa la traducción para el título
      data: precipitation,
      unit: "cm³",
      icon: Icon(
        Symbols.weather_mix,
        size: 60,
        color: Colors.indigo.shade400,
        fill: 1,
      ),
    );
  }
}