import 'dart:async';

import 'package:nationaldex/bloc/pokemon_event.dart';
import 'package:nationaldex/bloc/pokemon_state.dart';
import 'package:nationaldex/model/pokemon.dart';
import 'package:nationaldex/core/pokemon_repository.dart';

class PokemonBloc {
  final _pokemonRepository = PokemonRepository();

  final StreamController<PokemonEvent> _inputPokemonController =
      StreamController<PokemonEvent>();
  final StreamController<PokemonHomeState> _outputPokemonController =
      StreamController<PokemonHomeState>();
  Sink<PokemonEvent> get inputPokemonController => _inputPokemonController.sink;
  Stream<PokemonHomeState> get outputPokemonController =>
      _outputPokemonController.stream;

  PokemonBloc() {
    _inputPokemonController.stream.listen(_mapEventToState);
  }

  _mapEventToState(PokemonEvent event) async {
    List<Pokemon> pokemonList = [];

    _outputPokemonController.add(PokemonHomeLoading());

    if (event is PokemonPageEvent) {
      pokemonList = await _pokemonRepository.getPokePageList(1);
    }
    _outputPokemonController.add(PokemonHomeComplete(pokemonList: pokemonList));
  }
}
