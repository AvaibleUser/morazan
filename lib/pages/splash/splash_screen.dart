import 'package:flutter/material.dart';
import 'package:morazan/pages/base/base_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2)), // simulate loading
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return BaseWidget();
        } else {
          return Scaffold(
            body: Center(
              child: Image.asset('assets/splash.png'),
            ),
          );
        }
      },
    );
  }
}