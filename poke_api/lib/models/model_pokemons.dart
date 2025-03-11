import 'dart:convert';
import 'package:http/http.dart' as http;

class Results {
  final String name;
  final String url;
  final String imageUrl;
  final int id;
  final int weight;
  final int height;
  final List<String> types;
  final List<String> moves;
  final List<Stat> stats;

  Results({
    required this.name,
    required this.url,
    required this.imageUrl,
    required this.id,
    required this.weight,
    required this.height,
    required this.types,
    required this.moves,
    required this.stats,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      name: json['name'] as String,
      url: json['url'] as String,
      imageUrl:
          json['sprites']['other']['official-artwork']['front_default']
              as String,
      id: json['id'] as int,
      weight: json['weight'] as int,
      height: json['height'] as int,
      types:
          (json['types'] as List?)
              ?.map((type) => type['type']['name'] as String)
              .toList() ??
          [],
      moves:
          (json['moves'] as List?)
              ?.take(2)
              .map((move) => move['move']['name'] as String)
              .toList() ??
          [],
      stats:
          (json['stats'] as List?)
              ?.map((stat) => Stat.fromJson(stat as Map<String, dynamic>))
              .toList() ??
          [],
    );
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

class Stat {
  final String name;
  final int baseStat;

  Stat({required this.name, required this.baseStat});

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      name: json['stat']['name'] as String,
      baseStat: json['base_stat'] as int,
    );
  }
}
