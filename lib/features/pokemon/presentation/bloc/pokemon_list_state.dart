sealed class PokemonListState {
  const PokemonListState();
}

class PokemonListInitial extends PokemonListState {
  const PokemonListInitial();
}

class PokemonListLoading extends PokemonListState {
  const PokemonListLoading();
}

class PokemonListSuccess extends PokemonListState {
  final List<({int id, String name})> pokemons;
  const PokemonListSuccess(this.pokemons);
}

class PokemonListFailure extends PokemonListState {
  final String message;
  const PokemonListFailure(this.message);
}
