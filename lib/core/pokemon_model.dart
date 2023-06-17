import 'package:dio/dio.dart';
import 'package:nationaldex/constants/api_url.dart';

class Pokemon {
  final int? id;
  final String name;
  String get spriteUrl => '${ApiUrl.pokemonSprite}$id.png';

  double? _height;
  double? _weight;
  List<Map<String, dynamic>>? _abilities;
  List<String>? _type;
  Map<String, int>? _stats;
  Map<String, double>? _typeRelation;

  double? get height => _height;
  double? get weight => _weight;
  List<Map<String, dynamic>>? get abilities => _abilities;
  List<String>? get type => _type;
  Map<String, int>? get stats => _stats;
  Map<String, double>? get weakness => _typeRelation;

  Pokemon({
    required this.id,
    required this.name,
  });

  Pokemon.fromJson(Map<String, dynamic> json)
      : id =
            int.parse((json['pokemon_species']['url'] as String).split('/')[6]),
        name = json['pokemon_species']['name'];

  Future<void> fetchRemainingData() async {
    final dio = Dio();
    final Response<Map<String, dynamic>> responsePokemon;
    // final Response<Map<String, dynamic>> responsePokemonSpecies;

    String apiPokemon = '${ApiUrl.pokemon}$id';
    // String apiPokemonSpecies = '${ApiUrl.pokemonSpecies}$id';

    responsePokemon = await dio.get(apiPokemon);
    // responsePokemonSpecies = await dio.get(apiPokemonSpecies);

    _height = responsePokemon.data!['height'] / 10;
    _weight = responsePokemon.data!['weight'] / 10;

    _abilities = [
      for (Map<String, dynamic> element in responsePokemon.data!['abilities'])
        {
          'ability': element['ability']['name'],
          'is_hidden': element['is_hidden']
        }
    ];

    _type = [
      for (var element in responsePokemon.data!['types'])
        element['type']!['name']
    ];

    _stats = {
      for (Map<String, dynamic> element in responsePokemon.data!['stats'])
        element['stat']['name']: element['base_stat']
    };

    if (_type!.length == 1) {
      _typeRelation = await fetchTypeRelations(_type![0]);
    } else {
      _typeRelation = doubleTypeRelations(
        await fetchTypeRelations(_type![0]),
        await fetchTypeRelations(_type![1]),
      );
    }
  }

  Future<Map<String, double>> fetchTypeRelations(String type) async {
    final dio = Dio();
    final apiPath = 'https://pokeapi.co/api/v2/type/$type';
    final response = await dio.get(apiPath);

    final Map<String, double> dmgRelations = {
      for (final entry
          in (response.data!['damage_relations'] as Map<String, dynamic>)
              .entries)
        if (entry.key == 'double_damage_from' ||
            entry.key == 'half_damage_from' ||
            entry.key == 'no_damage_from')
          for (final item in entry.value)
            item['name']: convertEffectiveness(entry.key),
    };
    return dmgRelations;
  }

  double convertEffectiveness(String damageRelation) {
    if (damageRelation == 'double_damage_from') {
      return 2.0;
    } else if (damageRelation == 'half_damage_from') {
      return 0.5;
    } else {
      return 0.0;
    }
  }

  Map<String, double> doubleTypeRelations(
    Map<String, double> firstType,
    Map<String, double> secondType,
  ) {
    final Map<String, double> typeChart = firstType;

    secondType.forEach(
      (key, value) {
        if (firstType.containsKey(key)) {
          (firstType[key]! * secondType[key]!) != 1
              ? typeChart[key] = (firstType[key]! * secondType[key]!)
              : typeChart.remove(key);
        } else {
          typeChart[key] = secondType[key]!;
        }
      },
    );
    return typeChart;
  }

  @override
  toString() {
    return 'id: $id \n name: $name \n height: $height \n weight: $weight \n abilities: $abilities \n type: $type \n stats: $stats \n type_relation: $_typeRelation';
  }
}
