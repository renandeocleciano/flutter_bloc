import 'package:bloc_app/repository/model/result_model.dart';
import 'package:bloc_app/ui/home/widgets/pokemon_item_widget.dart';
import 'package:flutter/material.dart';

class PokemonListWidget extends StatelessWidget {
  const PokemonListWidget({
    Key? key,
    required this.pokes,
    required this.title,
  }) : super(key: key);

  final List<ResultModel> pokes;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        SizedBox(
          height:
              ((100 * pokes.length) + MediaQuery.of(context).size.width) + 24.0,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 24.0,
            ),
            itemBuilder: (context, index) {
              return PokeListItem(poke: pokes[index]);
            },
            separatorBuilder: (_, __) => const SizedBox(
              height: 20.0,
            ),
            itemCount: pokes.length,
          ),
        ),
      ],
    );
  }
}
