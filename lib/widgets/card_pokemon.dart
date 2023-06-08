import 'package:flutter/material.dart';
import 'package:nationaldex/constants/app_colors.dart';
import 'package:nationaldex/model/pokemon.dart';

class CardPokemon extends StatelessWidget {
  final Pokemon pokemon;
  const CardPokemon({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        color: AppColor.filterButton,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(pokemon.name), Text('${pokemon.id}')],
      ),
    );
  }
}
