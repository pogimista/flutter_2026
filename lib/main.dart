import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'features/pokemon/data/datasources/pokemon_remote_datasource.dart';
import 'features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'features/pokemon/domain/usecases/get_pokemon_detail.dart';
import 'features/pokemon/domain/usecases/get_pokemon_list.dart';
import 'features/pokemon/presentation/bloc/pokemon_list_bloc.dart';
import 'features/pokemon/presentation/bloc/pokemon_list_event.dart';
import 'features/pokemon/presentation/screens/home_screen.dart';

void main() {
  final datasource = PokemonRemoteDatasourceImpl();
  final repository = PokemonRepositoryImpl(datasource);

  runApp(PokemonApp(
    getPokemonList: GetPokemonList(repository),
    getPokemonDetail: GetPokemonDetail(repository),
  ));
}

class PokemonApp extends StatelessWidget {
  final GetPokemonList getPokemonList;
  final GetPokemonDetail getPokemonDetail;

  const PokemonApp({
    super.key,
    required this.getPokemonList,
    required this.getPokemonDetail,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GetPokemonDetail>.value(value: getPokemonDetail),
      ],
      child: BlocProvider<PokemonListBloc>(
        create: (_) =>
            PokemonListBloc(getPokemonList)..add(const LoadPokemonList()),
        child: MaterialApp(
          title: 'Pokédex',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
