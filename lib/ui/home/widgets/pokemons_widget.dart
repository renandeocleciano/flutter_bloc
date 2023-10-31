import 'package:bloc_app/ui/home/widgets/bloc/pokemons_bloc.dart';
import 'package:bloc_app/ui/home/widgets/pokemon_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonsWidget extends StatelessWidget {
  const PokemonsWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonsBloc, PokemonsState>(
      builder: (context, state) {
        return state.status.isSuccess
            ? PokemonListWidget(
                title: title,
                pokes: state.pokes.results,
              )
            : state.status.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.status.isError
                    ? const Text('Erro ao carregar os pokemons')
                    : const SizedBox();
      },
    );
  }
}
