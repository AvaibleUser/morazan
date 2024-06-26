import 'package:flutter/material.dart';
import 'package:morazan/components/satelite_info_piece.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Temperature extends StatelessWidget {
  final num _temperature;

  const Temperature({super.key, required num temperature})
      : _temperature = temperature;

  @override
  Widget build(BuildContext context) {
        final l10n = AppLocalizations.of(context)!; 
    return SateliteInfoPiece(
      title: l10n.temperatura,
      data: _temperature.round(),
      unit: "°C",
      icon: Icon(Icons.thermostat, size: 60, color: getColorIcon(_temperature)),
    );
  }

  //funcion para elegir el color
  Color getColorIcon(num temperature){
    if (temperature>=15) {
      return Colors.red.shade400;
    } else {
      return  Colors.lightBlue.shade300;
    }
  }


}
