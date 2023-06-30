import 'package:flutter/material.dart';
import 'package:nationaldex/bloc/pokemon_bloc.dart';
import 'package:nationaldex/bloc/pokemon_event.dart';
import 'package:nationaldex/bloc/pokemon_state.dart';
import 'package:nationaldex/constants/app_colors.dart';
import 'widgets/home_page/sliver_bar_search.dart';
import 'widgets/home_page/sliver_grid_pokemon.dart';

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
              SliverBarSearch(
                bloc: bloc,
              ),
              StreamBuilder<PokemonState>(
                stream: bloc.outputPokemonController,
                builder: (context, state) {
                  if (state.data is PokemonHomeLoading) {
                    return const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state.data is PokemonHomeComplete ||
                      state.data is PokemonFilter) {
                    return SliverGridPokemon(
                      pokeList: state.data!.pokemonList,
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
