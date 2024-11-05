import 'package:flutter/material.dart';
import 'package:pixelplaymobile/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PixelPlayMobile',
      theme: ThemeData(
        // Set teal as the primary color and orange as the accent color
        primarySwatch: Colors.teal,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
        ).copyWith(
          secondary: Colors.orange,  // Sets the accent color to orange
        ),
        scaffoldBackgroundColor: Colors.teal[50], // Light teal background for screens
        useMaterial3: true, // Optionally, use Material 3 design system
      ),
      home: MyHomePage(),
    );
  }
}
