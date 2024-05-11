import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:morazan/pages/splash/splash_screen.dart';
import 'package:morazan/util/language.dart';
import 'locale_bloc/locale_bloc.dart';

void main() => runApp(const MorazanApp());

class MorazanApp extends StatelessWidget {
  const MorazanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocaleBloc>(create: (_) => LocaleBloc()),
      ],
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: state.selectedLanguage.localeValue,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}