import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/pokemon_remote_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDatasource remoteDatasource;
  const PokemonRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<({int id, String name})>> getPokemonList({
    int limit = 151,
    int offset = 0,
  }) =>
      remoteDatasource.getPokemonList(limit: limit, offset: offset);

  @override
  Future<Pokemon> getPokemonDetail(int id) =>
      remoteDatasource.getPokemonDetail(id);
}
