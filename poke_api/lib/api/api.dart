import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:poke_api/models/model_pokemons.dart';

class PokemonApi {
  static const String baseUrl = 'https://pokeapi.co/api/v2';
  static const String count = '?limit=100&offset=0';

  static Future<List<Results>> fetchPokemons() async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon/$count'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];
      return Future.wait(
        data.map((json) async {
          return await Results.fromUrl(json['name'], json['url']);
        }).toList(),
      );
    } else {
      throw Exception('Failed to load Pokemons');
    }
  }
}
