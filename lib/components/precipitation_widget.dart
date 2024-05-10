import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:morazan/components/satelite_info_piece.dart';

class Precipitation extends StatelessWidget {
  final double _precipitation;

  const Precipitation({super.key, required double precipitation})
      : _precipitation = precipitation;

  @override
  Widget build(BuildContext context) {
    return SateliteInfoPiece(
      title: 'Precipitacion',
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

IconData getSimbolWeather(num precipitation){

if (precipitation>=1000) {
  return Symbols.cloudy_snowing;
}else{
  return Symbols.cloud;
}
  
}


}
