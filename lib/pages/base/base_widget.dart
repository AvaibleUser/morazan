import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morazan/util/app_theme.dart';
import 'package:morazan/pages/satelites/satelites_widget.dart';
import 'package:morazan/util/constants.dart';
import 'package:morazan/util/language.dart';

import 'package:string_capitalize/string_capitalize.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:morazan/locale_bloc/locale_bloc.dart';


class BaseWidget extends StatefulWidget {
  const BaseWidget({Key? key}) : super(key: key);

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  static const _satelites = Satelites.values;
  var _actualSatelite = _satelites[0];
  var _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
//  String welcomeMessage = l10n.temperatura;
    var colorScheme = Theme.of(context).colorScheme;
    var themeIcon = Theme.of(context).brightness == Brightness.light
        ? Icons.dark_mode
        : Icons.light_mode;

    return MaterialApp(
      locale: const Locale("en"), // Establece el idioma predeterminado a inglés
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      //Fin de local language
      title: 'Morazan',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(" ${l10n.testMedium} ${_actualSatelite.name.capitalize()}"),
             BlocBuilder<LocaleBloc, LocaleState>(
              builder: (context, state) {
                return _buildLanguageSwitch(
                  context,
                  Theme.of(context),
                  state,
                );
              },
            ),
              TextButton(
                onPressed: () => setState(() {
                  _themeMode = Theme.of(context).brightness == Brightness.light
                      ? ThemeMode.dark
                      : ThemeMode.light;
                }),
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
                  onChanged: (satelite) => setState(() {
                    _actualSatelite = satelite!;
                  }),
                  items: _satelites
                      .map((satelite) => DropdownMenuItem(
                            value: satelite,
                            child: Text(satelite.name.capitalize()),
                          ))
                      .toList(),
                ),
              ),
             SatelitesPage(satelite: _actualSatelite, key: UniqueKey()), // Use UniqueKey to force rebuild
            ],
          ),
        ),
      ),
    );
  }

 Widget _buildLanguageSwitch(
    BuildContext context,
    ThemeData theme,
    LocaleState state,
  ) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                context.read<LocaleBloc>().add(
                      ChangeLanguage(
                        state.selectedLanguage == Language.english
                            ? Language.spanish
                            : Language.english,
                      ),
                    );
              },
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "EN",
                    style: TextStyle(
                      fontSize: 18,
                      color: state.selectedLanguage == Language.english
                          ? Colors.blue
                          : const Color.fromARGB(255, 251, 250, 250),
                    ),
                  ),
                  const TextSpan(
                    text: " | ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "ES",
                    style: TextStyle(
                      fontSize: 18,
                      color: state.selectedLanguage == Language.spanish
                          ? Colors.blue
                          : const Color.fromARGB(255, 245, 245, 245),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
