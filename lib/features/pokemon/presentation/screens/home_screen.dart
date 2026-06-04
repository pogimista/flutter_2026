import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/pokemon_list_bloc.dart';
import '../bloc/pokemon_list_state.dart';
import '../widgets/pokemon_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex'),
      ),
      body: BlocBuilder<PokemonListBloc, PokemonListState>(
        builder: (context, state) => switch (state) {
          PokemonListInitial() => const SizedBox.shrink(),
          PokemonListLoading() =>
            const Center(child: CircularProgressIndicator()),
          PokemonListSuccess(:final pokemons) => GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.85,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: pokemons.length,
            itemBuilder: (context, index) {
              final p = pokemons[index];
              return PokemonCard(
                id: p.id,
                name: p.name,
                onTap: () => context.push('/pokemon/${p.id}?name=${p.name}'),
              );
            },
          ),
          PokemonListFailure(:final message) =>
            Center(child: Text('Error: $message')),
        },
      ),
    );
  }
}
