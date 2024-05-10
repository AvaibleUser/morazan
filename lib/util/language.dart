import 'dart:ui';

enum Language { english, spanish }

extension LanguageExtension on Language {
  String get locale {
    switch (this) {
      case Language.english:
        return 'en';
      case Language.spanish:
        return 'es';
      default:
        return 'en';
    }
  }

  String get name {
    switch (this) {
      case Language.english:
        return 'English';
      case Language.spanish:
        return 'Español';
      default:
        return 'English';
    }
  }

  String get flag {
    switch (this) {
      case Language.english:
        return '🇺🇸';
      case Language.spanish:
        return '🇪🇸';
      default:
        return '🇺🇸';
    }
  }

  Locale get localeValue {
    switch (this) {
      case Language.english:
        return const Locale('en', "US");
      case Language.spanish:
        return const Locale('es', "ES");
      default:
        return const Locale('en', "US");
    }
  }
}