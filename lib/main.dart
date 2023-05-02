import 'package:flutter/material.dart';
import 'package:flutter_api/pages/extra.dart';
import 'package:flutter_api/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter Project",
      home: ExtraPage(),
    );
  }
}
