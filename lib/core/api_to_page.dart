import 'package:dio/dio.dart';
import 'package:nationaldex/constants/api_url.dart';
import 'page_response.dart';

//TODO: Criar uma classe chamada PageFilter, que irá aplicar os filtros de Tipo e GEN

class PokeApiV2 {
  final dio = Dio();
  Map<String, int> queryParameters = {
    'limit': 200,
    'offset': 0,
  };
  Future<PageResponse> getAPI() async {
    final Response<Map<String, dynamic>> response;
    String apiPath =
        '${ApiUrl.pokemon}?limit=${queryParameters['limit']}&offset=${queryParameters['offset']}';
    response = await dio.get(apiPath);
    return PageResponse.fromJSON(response.data!);
  }
}

// class PageResponse {
//   List<Pokemon> get pageListResponse => _pageListResponse;
//   String get canLoadNextPage => _canLoadNextPage;
//   List<Pokemon> _pageListResponse;
//   String _canLoadNextPage;
//
//   PageResponse.fromJSON(Map<String, dynamic> json)
//       : _canLoadNextPage = json['next'],
//         _pageListResponse = (json['results'] as List)
//             .map((pokeJson) => Pokemon.fromJson(pokeJson))
//             .toList();
//
//   void getPokemonList() async {
//     final dio = Dio();
//     Map<String, int> queryParameters = {
//       'limit': 200,
//       'offset': 0,
//     };
//     final Response<Map<String, dynamic>> response;
//     String apiPath =
//         '${ApiUrl.pokemon}?limit=${queryParameters['limit']}&offset=${queryParameters['offset']}';
//     response = await dio.get(apiPath);
//     _canLoadNextPage =response.data!['next'];
//
//     print(response);
//     PageResponse.fromJSON(response.data!);
//   }
// }
