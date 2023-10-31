import 'package:bloc_app/ui/widgets/items_by_category/bloc/items_category_bloc.dart';
import 'package:bloc_app/ui/widgets/items_by_category/items_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsByCategoryWidget extends StatelessWidget {
  const ItemsByCategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemsByCategoryBloc, ItemsByCategoryState>(
      builder: (context, state) {
        return state.status.isSuccess
            ? ItemsByCategorySuccessWidget(
                categoryName: state.categoryName,
                items: state.items,
              )
            : state.status.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.status.isError
                    ? const Text("Erro")
                    : const SizedBox();
      },
    );
  }
}
