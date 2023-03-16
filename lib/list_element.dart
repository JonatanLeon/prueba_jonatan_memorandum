import 'package:flutter/material.dart';
import 'package:prueba_jonatan/main_screen.dart';

class ListElement extends StatelessWidget {
  final String name;
  final String description;

  const ListElement({super.key, required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: Image.asset("assets/images/beer_test_pic.jpg")),
            Expanded(child: Text(name)),
            Expanded(child: Text(description)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
          );
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
