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
          return await fromUrl(json['name'], json['url']);
        }).toList(),
      );
    } else {
      throw Exception('Failed to load Pokemons');
    }
  }

  static Future<Results> fromUrl(String name, String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final details = jsonDecode(response.body);
      return Results(
        name: name,
        url: url,
        imageUrl:
            details['sprites']['other']['official-artwork']['front_default']
                as String,
        id: details['id'] as int,
        weight: details['weight'] as int,
        height: details['height'] as int,
        types:
            (details['types'] as List?)
                ?.map((type) => type['type']['name'] as String)
                .toList() ??
            [],
        moves:
            (details['moves'] as List?)
                ?.take(2)
                .map((move) => move['move']['name'] as String)
                .toList() ??
            [],
        stats:
            (details['stats'] as List?)
                ?.map((stat) => Stat.fromJson(stat as Map<String, dynamic>))
                .toList() ??
            [],
      );
    } else {
      throw Exception('Failed to load Pokemon details');
    }
  }
}
