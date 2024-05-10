import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:morazan/pages/charts/charts_widget.dart';
import 'package:morazan/util/app_theme.dart';
import 'package:morazan/pages/satelites/satelites_widget.dart';
import 'package:morazan/util/constants.dart';
import 'package:string_capitalize/string_capitalize.dart';

class MorazanApp extends StatefulWidget {
  const MorazanApp({super.key});

  @override
  State<MorazanApp> createState() => _MorazanAppState();
}

class _MorazanAppState extends State<MorazanApp> {
  static const _satelites = Satelites.values;
  var _actualSatelite = _satelites[0];
  var _themeMode = ThemeMode.system;
  var _actualPage = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var themeIcon =
        _themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode;

    return MaterialApp(
      title: 'Morazan',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Detalles de ${_actualSatelite.name.capitalize()}"),
              TextButton(
                onPressed: () {
                  setState(
                    () => _themeMode = _themeMode == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light,
                  );
                },
                child: Icon(themeIcon, size: 20, color: colorScheme.onPrimary),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: _actualSatelite,
                  icon: Icon(Icons.expand_more,
                      size: 24, color: colorScheme.outline),
                  onChanged: (satelite) =>
                      setState(() => _actualSatelite = satelite!),
                  items: _satelites
                      .map(
                        (satelite) => DropdownMenuItem(
                          value: satelite,
                          child: Text(satelite.name.capitalize()),
                        ),
                      )
                      .toList(),
                ),
              ),
              switch (_actualPage) {
                0 => SatelitesPage(satelite: _actualSatelite),
                1 => ChartsPage(satelite: _actualSatelite),
                _ => throw RangeError("The selected page not exists... already")
              },
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: _actualPage,
          onTap: (index) => setState(() => _actualPage = index),
          selectedItemColor: colorScheme.onPrimary,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_input_antenna), label: "Satelite"),
            BottomNavigationBarItem(
                icon: Icon(Symbols.bar_chart_4_bars), label: "Graficos"),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: "Info"),
          ],
        ),
      ),
    );
  }
}
