class ModelPokemons {
  final int? count;
  final String? next;
  final Null previous;
  final List<Results>? results;

  const ModelPokemons({this.count, this.next, this.previous, this.results});

  factory ModelPokemons.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'count': int count,
        'next': String next,
        'previous': Null previous,
        'results': List<Results> results,
      } =>
        ModelPokemons(
          count: count,
          next: next,
          previous: previous,
          results:
              results
                  .map((e) => Results.fromJson(e as Map<String, dynamic>))
                  .toList(),
        ),
      _ => throw const FormatException('Failed to load ModelPokemons'),
    };
  }
}

class Results {
  // Define the properties and methods for the Results class
  Results.fromJson(Map<String, dynamic> json) {
    // Parse the JSON to initialize the Results object
  }
}
