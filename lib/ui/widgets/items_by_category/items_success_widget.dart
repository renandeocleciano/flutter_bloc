import 'package:bloc_app/repository/model/category_model.dart';
import 'package:bloc_app/ui/widgets/items_by_category/items_by_image.dart';
import 'package:flutter/material.dart';

class ItemsByCategorySuccessWidget extends StatelessWidget {
  const ItemsByCategorySuccessWidget({
    Key? key,
    required this.categoryName,
    required this.items,
  }) : super(key: key);

  final String categoryName;
  final List<CategoryModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            bottom: 16.0,
          ),
          child: Text(
            categoryName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * .2,
          child: ListView.separated(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ItemsByCategoryImage(
                name: items[index].name ?? 'No data',
                backgroundImage: items[index].image ?? '',
              );
            },
            separatorBuilder: (_, __) => const SizedBox(
              width: 25.0,
            ),
            itemCount: items.length,
          ),
        ),
      ],
    );
  }
}
