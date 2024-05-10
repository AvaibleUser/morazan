import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:morazan/api_requests/api_calls.dart';
import 'package:morazan/components/humidity_widget.dart';
import 'package:morazan/components/precipitation_widget.dart';
import 'package:morazan/components/radiation_widget.dart';
import 'package:morazan/components/temperature_widget.dart';
import 'package:morazan/components/wind_widget.dart';
import 'package:morazan/pages/satelites/satelites_model.dart';
import 'package:morazan/util/constants.dart';

class SatelitesPage extends StatefulWidget {
  final Satelites _satelite;

  const SatelitesPage({super.key, required Satelites satelite})
      : _satelite = satelite;

  @override
  State<SatelitesPage> createState() => _SatelitesPageState();
}

class _SatelitesPageState extends State<SatelitesPage> {
  static final dateFormat = DateFormat("dd-MM-yyyy HH:mm");
  late Future<SateliteInfo> _futureSateliteInfo;
  late Timer _timer;

  void updateSateliteInfo() {
    _futureSateliteInfo = fetchSateliteInfo(widget._satelite);
    _timer = Timer.periodic(
        const Duration(minutes: 5), (timer) => updateSateliteInfo());
  }

  @override
  void initState() {
    super.initState();
    updateSateliteInfo();
  }

  @override
  void didUpdateWidget(covariant SatelitesPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _timer.cancel();
    updateSateliteInfo();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureSateliteInfo,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Expanded(child: CircularProgressIndicator());
        }

        var SateliteInfo(
          :dateTime,
          :floorHumidity,
          :radiation,
          :temperature,
          :windVelocity,
          :windDirection,
          :rainPrecipitation
        ) = snapshot.data!;

        return Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text("Ultima Actualizacion ${dateFormat.format(dateTime)}"),
              ),
              Expanded(
                child: GridView.extent(
                  childAspectRatio: 0.61803,
                  maxCrossAxisExtent: 200.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  children: [
                    FloorHumidity(humidity: floorHumidity),
                    SolarRadiation(radiation: radiation),
                    Temperature(temperature: temperature),
                    Wind(velocity: windVelocity, direction: windDirection),
                    PrecipitationWidget(precipitation: rainPrecipitation),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
