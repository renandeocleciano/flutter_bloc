part of 'pokemons_bloc.dart';

enum PokemonsStatus { initial, success, error, loading }

extension PokemonssStatusX on PokemonsStatus {
  bool get isInitial => this == PokemonsStatus.initial;
  bool get isSuccess => this == PokemonsStatus.success;
  bool get isError => this == PokemonsStatus.error;
  bool get isLoading => this == PokemonsStatus.loading;
}

class PokemonsState extends Equatable {
  const PokemonsState({
    this.status = PokemonsStatus.initial,
    PokeListModel? pokes,
  }) : pokes = pokes ?? PokeListModel.empty;

  final PokeListModel pokes;
  final PokemonsStatus status;

  @override
  List<Object?> get props => [status, pokes];

  PokemonsState copyWith({
    PokeListModel? pokes,
    PokemonsStatus? status,
  }) {
    return PokemonsState(
      pokes: pokes,
      status: status ?? this.status,
    );
  }
}
