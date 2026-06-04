import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/config/app_config.dart';
import 'core/di/service_locator.dart' as di;
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/pokemon/presentation/bloc/pokemon_list_bloc.dart';
import 'features/pokemon/presentation/bloc/pokemon_list_event.dart';

void main() async {
  AppConfig.instance = const AppConfig(
    flavor: Flavor.prod,
    appName: 'Pokédex',
    apiBaseUrl: 'https://pokeapi.co/api/v2',
  );
  await bootstrap();
}

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const PokemonApp());
}

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokemonListBloc>(
      create: (_) => di.sl<PokemonListBloc>()..add(const LoadPokemonList()),
      child: MaterialApp.router(
        title: AppConfig.instance.appName,
        debugShowCheckedModeBanner: AppConfig.instance.isDev,
        theme: AppTheme.light,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
