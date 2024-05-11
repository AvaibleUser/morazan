import 'package:flutter/material.dart';
import 'package:morazan/pages/base/base_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2)), // simulate loading
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const BaseWidget();
        } else {
          return Scaffold(
            body: Center(
              child: Image.asset('splash.png'),
            ),
          );
        }
      },
    );
  }
}
