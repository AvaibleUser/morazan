import 'package:flutter/material.dart';
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
  final void Function(DateTime) _setLastUpdate;

  const SatelitesPage(
      {super.key,
      required Satelites satelite,
      required void Function(DateTime) setLastUpdate})
      : _satelite = satelite,
        _setLastUpdate = setLastUpdate;

  @override
  State<SatelitesPage> createState() => _SatelitesPageState();
}

class _SatelitesPageState extends State<SatelitesPage> {
  late Future<SateliteInfo> _futureSateliteInfo;

  @override
  void initState() {
    super.initState();
    _futureSateliteInfo = fetchSateliteInfo(widget._satelite);
  }

  @override
  void didUpdateWidget(covariant SatelitesPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _futureSateliteInfo = fetchSateliteInfo(widget._satelite);
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

        widget._setLastUpdate(dateTime);

        return Expanded(
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
        );
      },
    );
  }
}