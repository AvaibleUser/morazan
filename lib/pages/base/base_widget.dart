import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:morazan/pages/charts/charts_widget.dart';
import 'package:morazan/util/app_theme.dart';
import 'package:morazan/pages/satelites/satelites_widget.dart';
import 'package:morazan/util/constants.dart';
import 'package:morazan/util/language.dart';
import 'package:string_capitalize/string_capitalize.dart';
import 'package:morazan/pages/about/about_widget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:morazan/locale_bloc/locale_bloc.dart';

class BaseWidget extends StatefulWidget {
  const BaseWidget({super.key});

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  static const _satelites = Satelites.values;
  var _actualSatelite = _satelites[0];
  var _themeMode = ThemeMode.system;
  var _actualPage = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
//  String welcomeMessage = l10n.temperatura;
    var colorScheme = Theme.of(context).colorScheme;
    var themeIcon =
        _themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode;

    return MaterialApp(
      locale: context
          .watch<LocaleBloc>()
          .state
          .selectedLanguage
          .localeValue, // idioma predeterminado a inglés
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      //Fin de local language
      title: 'Morazan',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: Builder(builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${l10n.testMedium} ${_actualSatelite.name.capitalize()}",
                  style: const TextStyle(fontSize: 20),
                ),
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
                  onPressed: () {
                    setState(() {
                      _themeMode = _themeMode == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                    });
                  },
                  child:
                      Icon(themeIcon, size: 15, color: colorScheme.onPrimary),
                ),
              ],
            );
          }),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                2 => const AboutPage(),
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
          unselectedItemColor: colorScheme.tertiary,
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

  Widget _buildLanguageSwitch(
    BuildContext context,
    ThemeData theme,
    LocaleState state,
  ) {
    var colorScheme = Theme.of(context).colorScheme;

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
                  state.selectedLanguage == Language.english
                      ? TextSpan(
                          text: "en",
                          style: TextStyle(
                            fontSize: 15,
                            color: colorScheme.onPrimary,
                          ),
                        )
                      : TextSpan(
                          text: "es",
                          style: TextStyle(
                            fontSize: 15,
                            color: colorScheme.onPrimary,
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
