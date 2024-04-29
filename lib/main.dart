import 'package:flutter/material.dart';
import 'package:morazan/pages/satelites/satelites_widget.dart';

void main() => runApp(const MorazanApp());

class MorazanApp extends StatelessWidget {
  const MorazanApp({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return MaterialApp(
      title: 'Morazan',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
        scaffoldBackgroundColor: colorScheme.background,
        cardColor: colorScheme.background,
      ),
      home: const SatelitesPage(),
    );
  }
}
