import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Pokémon Search')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0), // Ajusta según sea necesario
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Search for a Pokémon'),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Search...'),
                  ),
                ),
                const Expanded(child: Center(child: Text('Hello World!'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
