import 'dart:convert';

import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Carga la página principal
      home: const MyHomePage(title: 'Prueba Memorandum'),
    );
  }
}
