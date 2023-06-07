abstract class PokemonEvent {}

class PokemonPageRequest extends PokemonEvent {
  final int page;
  PokemonPageRequest({required this.page});
}

class PokemonFilter extends PokemonEvent {
  final String filter;
  PokemonFilter({required this.filter});
}
