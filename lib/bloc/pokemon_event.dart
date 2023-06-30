abstract class PokemonEvent {}

class PokemonPageEvent extends PokemonEvent {}

class PokemonSearchEvent extends PokemonEvent {
  final String name;
  PokemonSearchEvent({required this.name});
}
