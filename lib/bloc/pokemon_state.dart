import 'package:nationaldex/model/pokemon.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonPageLoading extends PokemonState {}

class PokemonPageComplete extends PokemonState {
  final List<Pokemon> pageListResponse;
  final String canLoadNextPage;

  PokemonPageComplete(
      {required this.pageListResponse, required this.canLoadNextPage});
}

class PokemonPageFail extends PokemonState {
  final Exception exception;
  PokemonPageFail({required this.exception});
}
