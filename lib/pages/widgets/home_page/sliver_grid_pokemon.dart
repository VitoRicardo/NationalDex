import 'package:flutter/material.dart';
import 'package:nationaldex/core/pokemon_model.dart';
import 'package:nationaldex/constants/app_colors.dart';
import 'package:nationaldex/pages/widgets/poke_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:nationaldex/pages/detail_page.dart';

class SliverGridPokemon extends StatefulWidget {
  final List<Pokemon> pokeList;
  const SliverGridPokemon({Key? key, required this.pokeList}) : super(key: key);

  @override
  State<SliverGridPokemon> createState() => _SliverGridPokemonState();
}

class _SliverGridPokemonState extends State<SliverGridPokemon> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: widget.pokeList.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return Card(
          color: AppColor.redBackground,
          child: TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    pokemon: widget.pokeList[index],
                  ),
                ),
              );
            },
            child: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: GridTile(
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: widget.pokeList[index].spriteUrlGBA,
                        errorWidget: (context, url, error) {
                          return Image.network(
                              widget.pokeList[index].spriteUrlGBA);
                        },
                        placeholder: (context, url) => PokeLoading(
                          color: AppColor.whiteBackground,
                        ),
                      ),
                      Text(
                        '${widget.pokeList[index].name[0].toUpperCase()}'
                        '${widget.pokeList[index].name.substring(1)}',
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
