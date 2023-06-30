import 'dart:async';
import 'package:nationaldex/bloc/pokemon_event.dart';
import 'package:nationaldex/bloc/pokemon_state.dart';
import 'package:nationaldex/core/pokemon_model.dart';
import 'package:nationaldex/core/pokemon_repository.dart';

class PokemonBloc {
  final _pokemonRepository = PokemonRepository();
  final List<Pokemon> pokemonList = [];
  final StreamController<PokemonEvent> _inputPokemonController =
      StreamController<PokemonEvent>();
  final StreamController<PokemonState> _outputPokemonController =
      StreamController<PokemonState>();

  Sink<PokemonEvent> get inputPokemonController => _inputPokemonController.sink;
  Stream<PokemonState> get outputPokemonController =>
      _outputPokemonController.stream;

  PokemonBloc() {
    _inputPokemonController.stream.listen(_mapEventToState);
  }

  _mapEventToState(PokemonEvent event) async {
    if (pokemonList.isEmpty) _outputPokemonController.add(PokemonHomeLoading());

    if (event is PokemonPageEvent) {
      pokemonList.addAll(
        await _pokemonRepository.getPokePageList(),
      );
      _outputPokemonController
          .add(PokemonHomeComplete(pokemonList: pokemonList));
    } else if (event is PokemonSearchEvent) {
      pokemonList
        ..clear()
        ..addAll(
          _pokemonRepository.getPokemonByName(event.name),
        );
      _outputPokemonController.add(PokemonFilter(pokemonList: pokemonList));
    }
  }
}
