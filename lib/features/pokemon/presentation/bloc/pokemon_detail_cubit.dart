import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_pokemon_detail.dart';
import 'pokemon_detail_state.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  final GetPokemonDetail _getPokemonDetail;

  PokemonDetailCubit(this._getPokemonDetail) : super(const PokemonDetailInitial());

  Future<void> load(int id) async {
    emit(const PokemonDetailLoading());
    try {
      final pokemon = await _getPokemonDetail(id);
      emit(PokemonDetailLoaded(pokemon));
    } catch (e) {
      emit(PokemonDetailError(e.toString()));
    }
  }
}
