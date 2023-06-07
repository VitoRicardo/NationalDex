import 'package:nationaldex/model/pokemon.dart';

class PageResponse {
  final List<Pokemon> pageListResponse;
  final String canLoadNextPage;
  PageResponse(this.pageListResponse, this.canLoadNextPage);
  PageResponse.fromJSON(Map<String, dynamic> json)
      : canLoadNextPage = json['next'],
        pageListResponse = (json['results'] as List)
            .map((pokeJson) => Pokemon.fromJson(pokeJson))
            .toList();
}
