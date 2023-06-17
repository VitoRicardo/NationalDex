import 'package:flutter/material.dart';
import 'package:nationaldex/core/pokemon_model.dart';

class DetailPage extends StatefulWidget {
  final Pokemon pokemon;

  const DetailPage({super.key, required this.pokemon});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPokemonData();
  }

  Future<void> fetchPokemonData() async {
    await widget.pokemon.fetchRemainingData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Pokémon'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ID: ${widget.pokemon.id}'),
                  Text('Nome: ${widget.pokemon.name}'),
                  Text('Altura: ${widget.pokemon.height}'),
                  Text('Peso: ${widget.pokemon.weight}'),
                  Text('Habilidade: ${widget.pokemon.abilities}'),
                  Text('Tipo: ${widget.pokemon.type}'),
                  Text('Stats: ${widget.pokemon.stats}'),
                  Text('Fraqueza: ${widget.pokemon.weakness}'),

                  // Exiba outros detalhes do Pokémon aqui...
                ],
              ),
            ),
    );
  }
}
