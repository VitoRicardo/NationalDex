import 'package:dio/dio.dart';

class Pokemon {
  final int? id;
  final String name;
  String get spriteUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  final String? pokeUrl;

  double? _height;
  double? _weight;
  List<Map<String, dynamic>>? _abilities; // Dividir em Passiva, escondida
  List<String>? _type;
  Map<String, int>? _stats; //Dividir entre hp, att, def, sp.att, etc
  Map<String, int>? _weakness;
  Map? _evolutionTree; // Conter Imagem das evoluções e triggers

  double? get height => _height;
  double? get weight => _weight;
  List<Map<String, dynamic>>? get abilities => _abilities;
  List<String>? get type => _type;
  Map<String, int>? get stats => _stats;
  Map<String, int>? get weakness => _weakness;
  Map? get evolutionTree => _evolutionTree;

  Pokemon({
    required this.id,
    required this.name,
    required this.pokeUrl,
  });

  Pokemon.fromJson(Map<String, dynamic> json)
      : id = int.parse((json['url'] as String).split('/')[6]),
        name = json['name'],
        pokeUrl = json['url'];

  Future<void> fetchRemainingData() async {
    //TODO: Adicionar Weakness e Evolution Tree, com os triggers
    final dio = Dio();
    final Response<Map<String, dynamic>> response;
    String apiPath = pokeUrl!;
    response = await dio.get(apiPath);

    _height = response.data!['height'] / 10;
    _weight = response.data!['weight'] / 10;

    _abilities = [
      for (Map<String, dynamic> element in response.data!['abilities'])
        {
          'ability': element['ability']['name'],
          'is_hidden': element['is_hidden']
        }
    ];

    _type = [
      for (var element in response.data!['types']) element['type']!['name']
    ];

    _stats = {
      for (Map<String, dynamic> element in response.data!['stats'])
        element['stat']['name']: element['base_stat']
    };
  }

  @override
  toString() {
    return 'id: $id \n name: $name \n height: $height \n weight: $weight \n abilities: $abilities \n type: $type \n stats: $stats';
  }
}
