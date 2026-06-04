import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/pokemon/presentation/bloc/pokemon_detail_cubit.dart';
import '../../features/pokemon/presentation/screens/detail_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../di/service_locator.dart' as di;
import '../presentation/root_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const RootScreen(),
        routes: [
          GoRoute(
            path: 'pokemon/:id',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              final name = state.uri.queryParameters['name'] ?? '';
              return BlocProvider(
                create: (_) => di.sl<PokemonDetailCubit>()..load(id),
                child: DetailScreen(id: id, name: name),
              );
            },
          ),
        ],
      ),
    ],
  );
}
