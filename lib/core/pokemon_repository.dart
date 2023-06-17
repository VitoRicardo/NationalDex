import 'package:nationaldex/core/pokemon_model.dart';
import 'package:dio/dio.dart';
import 'package:nationaldex/constants/api_url.dart';

class PokemonRepository {
  List<Pokemon> _pokemonList = [];
  final _dio = Dio();

  Future<List<Pokemon>> getPokePageList() async {
    final Response<Map<String, dynamic>> response;
    response = await _dio.get(ApiUrl.nationalDex);

    _pokemonList = (response.data!['pokemon_entries'] as List)
        .map(
          (pokeJson) => Pokemon.fromJson(pokeJson),
        )
        .toList();

    return _pokemonList;
  }

  Future<List<Pokemon>> getPokemonsFromFilter(String type) async {
    //TODO: Implementar busca por filtro [Tipagem]
    return _pokemonList;
  }
}
