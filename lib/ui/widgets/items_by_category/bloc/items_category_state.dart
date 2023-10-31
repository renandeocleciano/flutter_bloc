part of 'items_category_bloc.dart';

enum ItemsCategoryStatus { initial, success, error, loading, selected }

extension ItemsCategoryStatusX on ItemsCategoryStatus {
  bool get isInitial => this == ItemsCategoryStatus.initial;
  bool get isSuccess => this == ItemsCategoryStatus.success;
  bool get isError => this == ItemsCategoryStatus.error;
  bool get isLoading => this == ItemsCategoryStatus.loading;
  bool get isSelected => this == ItemsCategoryStatus.selected;
}

class ItemsByCategoryState extends Equatable {
  const ItemsByCategoryState({
    this.status = ItemsCategoryStatus.initial,
    List<CategoryModel>? items,
    String? categoryName,
  })  : items = items ?? const [],
        categoryName = categoryName ?? '';

  final List<CategoryModel> items;
  final ItemsCategoryStatus status;
  final String categoryName;

  @override
  List<Object?> get props => [status, items, categoryName];

  ItemsByCategoryState copyWith({
    List<CategoryModel>? items,
    ItemsCategoryStatus? status,
    String? categoryName,
  }) {
    return ItemsByCategoryState(
      items: items ?? this.items,
      status: status ?? this.status,
      categoryName: categoryName ?? this.categoryName,
    );
  }
}
