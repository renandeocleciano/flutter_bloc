import 'package:bloc_app/repository/model/category_model.dart';
import 'package:bloc_app/repository/pokemon_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'items_category_event.dart';
part 'items_category_state.dart';

class ItemsByCategoryBloc
    extends Bloc<ItemsCategoryEvent, ItemsByCategoryState> {
  ItemsByCategoryBloc({
    required this.pokemonRepository,
  }) : super(const ItemsByCategoryState()) {
    on<GetItemsCategory>(_mapGetItemsByCategoryEventToState);
  }
  final PokemonRepository pokemonRepository;

  void _mapGetItemsByCategoryEventToState(
      GetItemsCategory event, Emitter<ItemsByCategoryState> emit) async {
    try {
      emit(state.copyWith(status: ItemsCategoryStatus.loading));

      final itemsByCategory =
          await pokemonRepository.getItemsByCategory(event.idSelected);
      emit(
        state.copyWith(
          status: ItemsCategoryStatus.success,
          items: itemsByCategory,
          categoryName: event.categoryName,
        ),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: ItemsCategoryStatus.error));
    }
  }
}
