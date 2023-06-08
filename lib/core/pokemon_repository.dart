import 'package:nationaldex/model/pokemon.dart';
import 'package:dio/dio.dart';
import 'package:nationaldex/constants/api_url.dart';

class PokemonRepository {
  final List<Pokemon> _pokemonList = [];
  final _dio = Dio();
  final Map<String, int> queryParameters = {
    'limit': 200,
    'offset': 0,
  };
  Future<List<Pokemon>> getPokePageList(int page) async {
    final Response<Map<String, dynamic>> response;
    String apiPath =
        '${ApiUrl.pokemon}?limit=${queryParameters['limit']! * page}&offset=${queryParameters['offset']}';
    response = await _dio.get(apiPath);
    _pokemonList.addAll(
      (response.data?['results'] as List).map(
        (pokeJson) => Pokemon.fromJson(pokeJson),
      ),
    );
    return _pokemonList;
  }

  Future<List<Pokemon>> getPokemonsFromFilter(int page) async {
    //TODO: Implementar busca por filtro [Tipagem]
    return _pokemonList;
  }
}
