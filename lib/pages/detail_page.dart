import 'package:flutter/material.dart';
import 'package:nationaldex/constants/app_colors.dart';
import 'package:nationaldex/core/pokemon_model.dart';
import 'widgets/poke_loading.dart';
import 'widgets/detail_page/poke_characteristic.dart';
import 'widgets/detail_page/row_type.dart';
import 'widgets/detail_page/nested_tab_bar.dart';

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

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> fetchPokemonData() async {
    pokemonImage = Image.network(
      widget.pokemon.spriteUrlArtWork,
      loadingBuilder: (context, child, loadingProgress) =>
          loadingProgress == null
              ? child
              : PokeLoading(
                  color: AppColor.redBackground,
                ),
    );

    await widget.pokemon.fetchRemainingData();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    List nationalId = widget.pokemon.id.toString().split('');
    while (nationalId.length < 3) {
      nationalId.insert(0, '0');
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.redBackground,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios_rounded),
          onTap: () => Navigator.pop(context),
        ),
        title: const Text('Pokedex'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: pokemonImage,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PokeCharacteristic(
                              value: '${nationalId.join()} ',
                              characteristic: 'National N° \n'),
                          PokeCharacteristic(
                              value: '${widget.pokemon.height} m ',
                              characteristic: 'Height \n '),
                          PokeCharacteristic(
                              value: '${widget.pokemon.weight} Kg ',
                              characteristic: 'Weight \n'),
                        ],
                      )
                    ],
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
                  Expanded(
                    child: NestedTabBar(
                      statsPokemon: widget.pokemon.stats!,
                      defenseVulnerability: widget.pokemon.weakness!,
                      id: widget.pokemon.id!,
                      height: widget.pokemon.height!,
                      weight: widget.pokemon.weight!,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
