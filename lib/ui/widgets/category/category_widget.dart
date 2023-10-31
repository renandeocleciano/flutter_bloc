import 'package:bloc_app/ui/widgets/category/bloc/category_bloc.dart';
import 'package:bloc_app/ui/widgets/category/categories_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      buildWhen: (previous, current) => current.status.isSuccess,
      builder: (context, state) {
        return CategoriesSuccessWidget();
      },
    );
  }
}
