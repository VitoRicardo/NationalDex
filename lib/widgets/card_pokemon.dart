import 'package:flutter/material.dart';
import 'package:nationaldex/constants/app_colors.dart';

class ListViewPokemonCard extends StatelessWidget {
  const ListViewPokemonCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 20,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardPokemon(),
            CardPokemon(),
          ],
        );
      },
    );
  }
}

class CardPokemon extends StatelessWidget {
  const CardPokemon({Key? key}) : super(key: key);

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
        children: [
          Text('Pokemon Imagem'),
          Text('Pokemon Nome'),
          Text('Pokemon Tipo'),
          Text('Pokemon Número')
        ],
      ),
    );
  }
}
