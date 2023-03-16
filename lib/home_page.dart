import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:prueba_jonatan/list_element.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> beers = [];

  // Petición a la API
  void fetchBeers() async {
    const url =
        "https://api.punkapi.com/v2/beers?brewed_before=11-2012&abv_gt=6";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      beers = json;
    });
  }

  // Genera la lista con los elementos de la API, solo con nombre y descripción
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: beers.length,
        itemBuilder: (context, index) {
          final beer = beers[index];
          final name = beer['name'];
          final description = beer['description'];
          // Lleva a la página de la cerveza pulsada
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      ListElement(name: name, description: description),
                ),
              );
            },
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Image.asset("assets/images/beer_test_pic.jpg")),
                  Expanded(child: Text(name)),
                  Expanded(child: Text(description))
                ],
              ),
            ),
          );
        },
      ),

      // La lista se inicializa al pulsar este botón
      floatingActionButton: FloatingActionButton.extended(
        onPressed: fetchBeers,
        label: const Text("Obtener cervezas"),
      ),
    );
  }
}
