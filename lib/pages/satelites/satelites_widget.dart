import 'package:flutter/material.dart';
import 'package:morazan/components/humidity_widget.dart';
import 'package:morazan/components/precipitation_widget.dart';
import 'package:morazan/components/radiation_widget.dart';
import 'package:morazan/components/temperature_widget.dart';
import 'package:morazan/components/wind_widget.dart';
import 'package:string_capitalize/string_capitalize.dart';

class SatelitesPage extends StatefulWidget {
  const SatelitesPage({super.key});

  @override
  State<SatelitesPage> createState() => _SatelitesPageState();
}

class _SatelitesPageState extends State<SatelitesPage> {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var satelites = ["satélite 1", "satélite 2", "satélite 3"];
    List<double> humidity = [3.5, 40.1, 10.00];
    double radiation = 420;
    num temperature = 36.5;
    double velocity = 5.7;
    num direction = 45;
    double precipitation = 20.5;
    var actualSatelite = satelites[0];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Morazan"),
            DropdownButtonHideUnderline(
              child: DropdownButton(
                value: actualSatelite,
                icon: Icon(Icons.expand_more,
                    size: 24, color: colorScheme.outline),
                onChanged: (satelite) => actualSatelite = satelite!,
                items: satelites
                    .map((satelite) => DropdownMenuItem(
                          value: satelite,
                          child: Text(satelite.capitalize()),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FloorHumidity(humidity: humidity),
            SolarRadiation(radiation: radiation),
            Temperature(temperature: temperature),
            Wind(velocity: velocity, direction: direction),
            Precipitation(precipitation: precipitation),
          ],
        ),
      ),
    );
  }
}
