import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/chuck_norris_joke.dart';

class ChuckNorrisService {
  final String apiUrl = dotenv.env['CHUCK_NORRIS_API_URL']!;

  // Obtener una lista de chistes aleatorios
  Future<List<ChuckNorrisJoke>> getJokes({int count = 10}) async {
    try {
      List<Future<ChuckNorrisJoke>> futures = List.generate(
        count,
        (_) => getRandomJoke(),
      );
      return Future.wait(futures);
    } catch (e) {
      throw Exception('Error al obtener los chistes: $e');
    }
  }

  // Obtener un chiste aleatorio
  Future<ChuckNorrisJoke> getRandomJoke() async {
    final response = await http.get(Uri.parse('$apiUrl/random'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ChuckNorrisJoke.fromJson(data);
    } else {
      throw Exception('Error al obtener un chiste.');
    }
  }
}
