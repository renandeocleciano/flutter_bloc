import 'package:bloc_app/repository/model/poke_list_model.dart';
import 'package:bloc_app/repository/pokemon_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  PokemonsBloc({required this.pokeRepository}) : super(const PokemonsState()) {
    on<GetPokemons>(_mapGetPokemonsEventToState);
  }

  final PokemonRepository pokeRepository;

  void _mapGetPokemonsEventToState(
      GetPokemons event, Emitter<PokemonsState> emit) async {
    try {
      emit(state.copyWith(status: PokemonsStatus.loading));
      final pokes = await pokeRepository.getPokemons();
      emit(
        state.copyWith(
          status: PokemonsStatus.success,
          pokes: pokes,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: PokemonsStatus.error));
    }
  }
}
