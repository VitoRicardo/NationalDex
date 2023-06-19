import 'package:flutter/material.dart';
import 'package:nationaldex/core/pokemon_model.dart';
import 'widgets/poke_loading.dart';
import 'widgets/detail_page/poke_characteristic.dart';
import 'widgets/detail_page/row_type.dart';
import 'widgets/detail_page/row_ability.dart';
import 'widgets/detail_page/stats_bar.dart';

class DetailPage extends StatefulWidget {
  final Pokemon pokemon;

  const DetailPage({super.key, required this.pokemon});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLoading = true;
  late Image pokemonImage;

  @override
  void initState() {
    super.initState();
    fetchPokemonData();
  }

  Future<void> fetchPokemonData() async {
    pokemonImage = Image.network(
      widget.pokemon.spriteUrlArtWork,
      loadingBuilder: (context, child, loadingProgress) =>
          loadingProgress == null ? child : const PokeLoading(),
    );

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
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: pokemonImage,
                  ),
                  Text(
                    '${widget.pokemon.name[0].toUpperCase()}'
                    '${widget.pokemon.name.substring(1)}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RowType(types: widget.pokemon.type!),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PokeCharacteristic(
                          value: '${widget.pokemon.id} \n',
                          characteristic: 'National N°'),
                      PokeCharacteristic(
                          value: '${widget.pokemon.height} M \n',
                          characteristic: 'Height'),
                      PokeCharacteristic(
                          value: '${widget.pokemon.weight} KG \n',
                          characteristic: 'Weight'),
                    ],
                  ),
                  RowAbility(abilities: widget.pokemon.abilities!),
                  Column(
                    children: [
                      for (String key in widget.pokemon.stats!.keys)
                        StatusBar(
                          stat: '${key[0].toUpperCase()}${key.substring(1)}',
                          currentValue: widget.pokemon.stats![key]!,
                        ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  // Text('${widget.pokemon.stats}'),
                  // Text('${widget.pokemon.weakness}'),
                ],
              ),
            ),
    );
  }
}
