import 'package:flutter/material.dart';
import 'package:simple_clean_fetching_data/homepage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        child: Homepage(),
      )),
    );
  }
}
