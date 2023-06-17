import 'package:nationaldex/core/pokemon_model.dart';

abstract class PokemonHomeState {
  List<Pokemon> pokemonList;
  PokemonHomeState({required this.pokemonList});
}

class PokemonHomeInital extends PokemonHomeState {
  PokemonHomeInital() : super(pokemonList: []);
}

class PokemonHomeLoading extends PokemonHomeState {
  PokemonHomeLoading() : super(pokemonList: []);
}

class PokemonHomeComplete extends PokemonHomeState {
  PokemonHomeComplete({required List<Pokemon> pokemonList})
      : super(pokemonList: pokemonList);
}

class PokemonHomeError extends PokemonHomeState {
  final Exception exception;
  PokemonHomeError({required this.exception}) : super(pokemonList: []);
}
