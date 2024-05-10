import 'package:flutter/material.dart';
import 'package:morazan/pages/satelites/satelites_model.dart';
import 'package:morazan/util/app_theme.dart';
import 'package:morazan/pages/satelites/satelites_widget.dart';
import 'package:morazan/util/constants.dart';
import 'package:string_capitalize/string_capitalize.dart';
import 'package:morazan/pages/base/about_widget.dart';

class MorazanApp extends StatefulWidget {
  const MorazanApp({Key? key}) : super(key: key);

  @override
  State<MorazanApp> createState() => _MorazanAppState();
}

class _MorazanAppState extends State<MorazanApp> {
  static const _satelites = Satelites.values;
  var _actualSatelite = _satelites[0];
  var _themeMode = ThemeMode.system;
  DateTime? _lastUpdate;

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
      routes: {
        '/AboutPage': (context) => AboutPage(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Builder(builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Detalles de ${_actualSatelite.name.capitalize()}"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/AboutPage");
                  },
                  child:
                      Icon(Icons.info, size: 20, color: colorScheme.onPrimary),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _themeMode = _themeMode == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                    });
                  },
                  child:
                      Icon(themeIcon, size: 20, color: colorScheme.onPrimary),
                ),
              ],
            );
          }),
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
                  onChanged: (satelite) {
                    setState(() {
                      _actualSatelite = satelite!;
                    });
                  },
                  items: _satelites
                      .map((satelite) => DropdownMenuItem(
                            value: satelite,
                            child: Text(satelite.name.capitalize()),
                          ))
                      .toList(),
                ),
              ),
              Text("Ultima Actualizacion ${_lastUpdate ?? '...'}"),
              SatelitesPage(
                satelite: _actualSatelite,
                setLastUpdate: (lu) => _lastUpdate = lu,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
