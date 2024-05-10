import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:morazan/pages/satelites/satelites_model.dart';
import 'package:morazan/util/constants.dart';

class ChartsPage extends StatefulWidget {
  final Satelites _satelite;

  const ChartsPage({super.key, required Satelites satelite})
      : _satelite = satelite;

  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  static final dayFormat = DateFormat("dd-MM-yyyy");
  ChartRanges _range = ChartRanges.days;
  DateTime _actualDate = DateTime.now();
  Metrics _actualMetric = Metrics.floorHumidity;
  late Future<List<SateliteInfo>> _futureSateliteHistory;

  void updateSateliteInfo() {
    // _futureSateliteHistory = fetchSateliteHistory(widget._satelite, _range);
  }

  @override
  void initState() {
    super.initState();
    updateSateliteInfo();
  }

  @override
  void didUpdateWidget(covariant ChartsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateSateliteInfo();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _actualDate,
      firstDate: DateTime(2022, 8),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _actualDate) {
      setState(() => _actualDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: switch (_range) {
              ChartRanges.days => ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    dayFormat.format(_actualDate),
                    style: TextStyle(color: colorScheme.onPrimary),
                  ),
                ),
              ChartRanges.weeks => const Text('Last week'),
            },
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => setState(() => _range = ChartRanges.days),
                    child: Text(
                      "Dia",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: _range == ChartRanges.days
                              ? colorScheme.onPrimary
                              : colorScheme.secondary),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => setState(() => _range = ChartRanges.weeks),
                    child: Text(
                      "Semana",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: _range == ChartRanges.weeks
                              ? colorScheme.onPrimary
                              : colorScheme.secondary),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: Metrics.values
                  .map(
                    (metric) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: ElevatedButton(
                          onPressed: () =>
                              setState(() => _actualMetric = metric),
                          child: Icon(
                            switch (metric) {
                              Metrics.floorHumidity => Icons.water_drop,
                              Metrics.solarRadiation => Icons.sunny,
                              Metrics.temperature => Icons.thermostat,
                              Metrics.wind => Symbols.assistant_navigation,
                              Metrics.precipitation => Symbols.weather_mix,
                            },
                            size: 14,
                            color: _actualMetric == metric
                                ? colorScheme.onPrimary
                                : colorScheme.secondary,
                            fill: [Metrics.wind, Metrics.precipitation]
                                    .contains(metric)
                                ? 1
                                : null,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
