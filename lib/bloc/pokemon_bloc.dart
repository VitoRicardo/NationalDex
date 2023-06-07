import 'package:bloc/bloc.dart';
import 'package:nationaldex/core/api_to_page.dart';
import 'pokemon_event.dart';
import 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokeApiV2 _pokeApiV2 = PokeApiV2();
  PokemonBloc() : super(PokemonInitial());

  Stream<PokemonState> mapEventState(PokemonEvent event) async* {
    if (event is PokemonPageRequest) {
      yield PokemonPageLoading();

      try {
        final pokemonPageResponse = await _pokeApiV2.getAPI();
        yield PokemonPageComplete(
            pageListResponse: pokemonPageResponse.pageListResponse,
            canLoadNextPage: pokemonPageResponse.canLoadNextPage);
      } catch (e) {
        yield PokemonPageFail(exception: e);
      }
    }
  }
}
