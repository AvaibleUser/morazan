import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:morazan/api_requests/api_calls.dart';
import 'package:morazan/pages/satelites/satelites_model.dart';
import 'package:morazan/util/constants.dart';
import 'package:string_capitalize/string_capitalize.dart';

class ChartsPage extends StatefulWidget {
  final Satelites _satelite;
  final Metrics _metric;

  const ChartsPage({
    super.key,
    required Satelites satelite,
    required Metrics metric,
  })  : _satelite = satelite,
        _metric = metric;

  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  static final dayFormat = DateFormat("dd-MM-yyyy");
  ChartRanges _range = ChartRanges.days;
  DateTime _actualDate = DateTime.now();
  late Future<List<SateliteInfo>> _futureSateliteHistory;

  void updateSateliteInfo() {
    _futureSateliteHistory = fetchSateliteHistory(widget._satelite, _range);
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

    return Scaffold(
      appBar: AppBar(title: Text(widget._metric.name.capitalize())),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            switch (_range) {
              ChartRanges.days => ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text(dayFormat.format(_actualDate)),
                ),
              ChartRanges.weeks => const Text('Last week'),
            },
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _range = ChartRanges.days,
                  child: const Text("Dia", textAlign: TextAlign.center),
                ),
                ElevatedButton(
                  onPressed: () => _range = ChartRanges.weeks,
                  child: const Text("Semana", textAlign: TextAlign.center),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _range = ChartRanges.days,
                  child: const Text("Dia", textAlign: TextAlign.center),
                ),
                ElevatedButton(
                  onPressed: () => _range = ChartRanges.weeks,
                  child: const Text("Semana", textAlign: TextAlign.center),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
