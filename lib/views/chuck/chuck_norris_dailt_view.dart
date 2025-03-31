import 'package:flutter/material.dart';
import 'package:taller_nav/views/custom_drawer.dart';
import '../../models/chuck_norris_joke.dart';

class ChuckNorrisDetailView extends StatelessWidget {
  final ChuckNorrisJoke joke;

  const ChuckNorrisDetailView({super.key, required this.joke});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del Chiste')),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(joke.iconUrl, width: 100, height: 100),
            const SizedBox(height: 20),
            Text(
              joke.joke,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
