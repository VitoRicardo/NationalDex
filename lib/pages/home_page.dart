import 'package:flutter/material.dart';
import 'package:nationaldex/bloc/pokemon_bloc.dart';
import 'package:nationaldex/bloc/pokemon_event.dart';
import 'package:nationaldex/bloc/pokemon_state.dart';
import 'package:nationaldex/constants/app_colors.dart';
import 'package:nationaldex/widgets/sliver_bar_search.dart';
import 'package:nationaldex/widgets/card_pokemon.dart';

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
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                          (context, index) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      );
                    } else if (state.data is PokemonHomeComplete) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount:
                              (state.data!.pokemonList.length / 2).ceil(),
                          (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CardPokemon(
                                        pokemon:
                                            state.data!.pokemonList[index * 2]),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: index * 2 + 1 <
                                            state.data!.pokemonList.length
                                                .ceil()
                                        ? CardPokemon(
                                            pokemon: state.data!
                                                .pokemonList[index * 2 + 1])
                                        : const SizedBox(),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    } else {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                          (context, index) {
                            return const Center(
                              child: Text('DEU RUIM'),
                            );
                          },
                        ),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
