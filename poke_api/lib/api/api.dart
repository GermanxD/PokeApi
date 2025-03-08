import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:poke_api/models/model_pokemons.dart';

class PokemonApi {
  static const String baseUrl = 'https://pokeapi.co/api/v2';

  static Future<http.Response> fetchPokemons() {
    return http.get(Uri.parse('$baseUrl/pokemon'));
  }
}

Future<ModelPokemons> fetchModelPokemons() async {
  final response = await PokemonApi.fetchPokemons();
  if (response.statusCode == 200) {
    return ModelPokemons.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  } else {
    throw Exception('Failed to load ModelPokemons');
  }
}
