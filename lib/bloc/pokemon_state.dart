import 'package:nationaldex/core/pokemon_model.dart';

abstract class PokemonState {
  List<Pokemon> pokemonList;
  PokemonState({required this.pokemonList});
}

class PokemonHomeInital extends PokemonState {
  PokemonHomeInital() : super(pokemonList: []);
}

class PokemonHomeLoading extends PokemonState {
  PokemonHomeLoading() : super(pokemonList: []);
}

class PokemonHomeComplete extends PokemonState {
  PokemonHomeComplete({required List<Pokemon> pokemonList})
      : super(pokemonList: pokemonList);
}

class PokemonHomeError extends PokemonState {
  final Exception exception;
  PokemonHomeError({required this.exception}) : super(pokemonList: []);
}

class PokemonFilter extends PokemonState {
  PokemonFilter({required List<Pokemon> pokemonList})
      : super(pokemonList: pokemonList);
}
