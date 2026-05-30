import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/error/failures.dart';
import '../models/pokemon_model.dart';

abstract class PokemonRemoteDatasource {
  Future<List<({int id, String name})>> getPokemonList({int limit, int offset});
  Future<PokemonModel> getPokemonDetail(int id);
}

class PokemonRemoteDatasourceImpl implements PokemonRemoteDatasource {
  static const _base = 'https://pokeapi.co/api/v2';

  final http.Client client;
  PokemonRemoteDatasourceImpl({http.Client? client})
      : client = client ?? http.Client();

  @override
  Future<List<({int id, String name})>> getPokemonList({
    int limit = 151,
    int offset = 0,
  }) async {
    final res = await client
        .get(Uri.parse('$_base/pokemon?limit=$limit&offset=$offset'));
    if (res.statusCode != 200) {
      throw const ServerException('Failed to load Pokémon list');
    }
    final results = jsonDecode(res.body)['results'] as List;
    return results.map((r) {
      final url = r['url'] as String;
      final id = int.parse(url.split('/').where((s) => s.isNotEmpty).last);
      return (id: id, name: r['name'] as String);
    }).toList();
  }

  @override
  Future<PokemonModel> getPokemonDetail(int id) async {
    final res = await client.get(Uri.parse('$_base/pokemon/$id'));
    if (res.statusCode != 200) {
      throw ServerException('Failed to load Pokémon #$id');
    }
    return PokemonModel.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
  }
}
