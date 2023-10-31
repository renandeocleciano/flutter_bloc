part of 'items_category_bloc.dart';

class ItemsCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetItemsCategory extends ItemsCategoryEvent {
  GetItemsCategory({
    required this.idSelected,
    required this.categoryName,
  });
  final int idSelected;
  final String categoryName;

  @override
  List<Object?> get props => [idSelected, categoryName];
}
