import 'package:flutter/material.dart';
import 'package:movie_app/screens/splash_screen.dart';
import 'package:movie_app/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EL-salam for film production',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(
        navigateAfterSeconds: 5,
        nextScreen: HomeScreen(),
      ),
    );
  }
}
