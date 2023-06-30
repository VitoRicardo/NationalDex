import 'package:nationaldex/core/pokemon_model.dart';
import 'package:dio/dio.dart';
import 'package:nationaldex/constants/api_url.dart';

class PokemonRepository {
  List<Pokemon> _pokemonList = [];
  Future<List<Pokemon>> getPokePageList() async {
    if (_pokemonList.isNotEmpty) {
      return _pokemonList;
    } else {
      final dio = Dio();
      final Response<Map<String, dynamic>> response;
      response = await dio.get(ApiUrl.nationalDex);

      _pokemonList = (response.data!['pokemon_entries'] as List)
          .map(
            (pokeJson) => Pokemon.fromJson(pokeJson),
          )
          .toList();

      return _pokemonList;
    }
  }

  List<Pokemon> getPokemonByName(String filter) {
    List<Pokemon> pokemonFilter = _pokemonList
        .where((pokemon) =>
            pokemon.name.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    return pokemonFilter;
  }
}
