import 'package:flutter/material.dart';
import 'package:poke_api/models/model_pokemons.dart';

class PokemonDetail extends StatelessWidget {
  final Results pokemon;

  const PokemonDetail({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedId = pokemon.id.toString().padLeft(3, '0');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(pokemon.name[0].toUpperCase() + pokemon.name.substring(1)),
            Text('#$formattedId'),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(flex: 4, child: Container(color: Colors.red)),
              Expanded(
                flex: 6,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              pokemon.types.map((type) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                  ),
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    type,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'About',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/ic_weight.png',
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              children: [
                                Text(
                                  '${pokemon.weight}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                const Text(
                                  'Weight',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16),
                            Image.asset(
                              'assets/images/ic_height.png',
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              children: [
                                Text(
                                  '${pokemon.height}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                const Text(
                                  'Height',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  pokemon.moves
                                      .take(2)
                                      .map(
                                        (move) => Text(
                                          move,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                      .toList(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Base Stats',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          children:
                              pokemon.stats.map((stat) {
                                String statName = stat.name;
                                switch (statName) {
                                  case 'hp':
                                    statName = 'HP';
                                    break;
                                  case 'attack':
                                    statName = 'ATK';
                                    break;
                                  case 'defense':
                                    statName = 'DEF';
                                    break;
                                  case 'special-attack':
                                    statName = 'SATK';
                                    break;
                                  case 'special-defense':
                                    statName = 'SDEF';
                                    break;
                                  case 'speed':
                                    statName = 'SPD';
                                    break;
                                }
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 60,
                                        child: Text(
                                          statName,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        width: 1,
                                        height: 20,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(width: 8),
                                      SizedBox(
                                        width: 40,
                                        child: Text(
                                          '${stat.baseStat}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: LinearProgressIndicator(
                                          value: stat.baseStat / 100,
                                          backgroundColor: Colors.grey[300],
                                          color: Colors.red,
                                          minHeight: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            child: Container(
              width: MediaQuery.of(context).size.height * 0.35,
              height: MediaQuery.of(context).size.height * 0.35,
              child: Image.network(pokemon.imageUrl, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
