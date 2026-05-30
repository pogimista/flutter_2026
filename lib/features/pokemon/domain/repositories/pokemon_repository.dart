import '../entities/pokemon.dart';

abstract class PokemonRepository {
  Future<List<({int id, String name})>> getPokemonList({int limit, int offset});
  Future<Pokemon> getPokemonDetail(int id);
}
