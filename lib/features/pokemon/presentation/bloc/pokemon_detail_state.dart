import '../../domain/entities/pokemon.dart';

sealed class PokemonDetailState {
  const PokemonDetailState();
}

class PokemonDetailInitial extends PokemonDetailState {
  const PokemonDetailInitial();
}

class PokemonDetailLoading extends PokemonDetailState {
  const PokemonDetailLoading();
}

class PokemonDetailLoaded extends PokemonDetailState {
  final Pokemon pokemon;
  const PokemonDetailLoaded(this.pokemon);
}

class PokemonDetailError extends PokemonDetailState {
  final String message;
  const PokemonDetailError(this.message);
}
