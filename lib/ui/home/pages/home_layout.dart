import 'package:bloc_app/ui/home/widgets/pokemons_widget.dart';
import 'package:bloc_app/ui/home/widgets/title_widget.dart';
import 'package:bloc_app/ui/widgets/category/category_widget.dart';
import 'package:bloc_app/ui/widgets/container_body.dart';
import 'package:bloc_app/ui/widgets/items_by_category/items_by_category_widget.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(),
          SizedBox(height: 40.0),
          ContainerBody(
            children: [
              CategoriesWidget(),
              ItemsByCategoryWidget(),
              PokemonsWidget(title: 'Pokemons'),
            ],
          )
        ],
      ),
    );
  }
}
