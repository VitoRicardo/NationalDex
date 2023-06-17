import 'package:flutter/material.dart';
import 'package:nationaldex/constants/app_colors.dart';
import 'package:nationaldex/core/pokemon_model.dart';

class CardPokemon extends StatelessWidget {
  final Pokemon pokemon;
  const CardPokemon({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        color: AppColor.filterButton,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // CachedNetworkImage(
          //   imageUrl: pokemon.spriteUrl,
          //   placeholder: (context, url) => const PokeLoading(),
          //   errorWidget: (context, url, error) {
          //     return Image.network('pokemon.spriteUrl');
          //   },
          // ),
          Image.network('pokemon.spriteUrl'),
          Text('${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)}'),
        ],
      ),
    );
  }
}
