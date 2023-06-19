import 'package:flutter/material.dart';
import 'package:nationaldex/bloc/pokemon_bloc.dart';
import 'package:nationaldex/bloc/pokemon_event.dart';
import 'package:nationaldex/bloc/pokemon_state.dart';
import 'package:nationaldex/constants/app_colors.dart';
import 'widgets/home_page/sliver_bar_search.dart';
import 'widgets/poke_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:nationaldex/core/pokemon_model.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PokemonBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = PokemonBloc()..inputPokemonController.add(PokemonPageEvent());
  }

  @override
  void dispose() {
    super.dispose();
    bloc.inputPokemonController.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteBackground,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: CustomScrollView(
            slivers: [
              const SliverBarSearch(),
              StreamBuilder<PokemonHomeState>(
                stream: bloc.outputPokemonController,
                builder: (context, state) {
                  if (state.data is PokemonHomeLoading) {
                    return const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state.data is PokemonHomeComplete) {
                    return SliverGrid.builder(
                      itemCount: state.data!.pokemonList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        List<Pokemon> pokeList = state.data!.pokemonList;

                        return Card(
                          color: AppColor.filterButton,
                          child: TextButton(
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    pokemon: pokeList[index],
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
                                        imageUrl: pokeList[index].spriteUrlGBA,
                                        errorWidget: (context, url, error) {
                                          return Image.network(
                                              pokeList[index].spriteUrlGBA);
                                        },
                                        placeholder: (context, url) =>
                                            const PokeLoading(),
                                      ),
                                      Text(
                                        '${pokeList[index].name[0].toUpperCase()}'
                                        '${pokeList[index].name.substring(1)}',
                                        style: const TextStyle(
                                            color: Colors.white),
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
                  } else {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: 1,
                        (context, index) {
                          return const Center(
                            child: Text('Erro'),
                          );
                        },
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
