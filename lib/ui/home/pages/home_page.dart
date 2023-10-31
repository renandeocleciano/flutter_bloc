import 'package:bloc_app/repository/pokemon_repository.dart';
import 'package:bloc_app/repository/service/pokemon_service.dart';
import 'package:bloc_app/ui/home/pages/home_layout.dart';
import 'package:bloc_app/ui/home/widgets/bloc/pokemons_bloc.dart';
import 'package:bloc_app/ui/widgets/category/bloc/category_bloc.dart';
import 'package:bloc_app/ui/widgets/items_by_category/bloc/items_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent.shade400,
      body: RepositoryProvider(
        create: (context) => PokemonRepository(service: PokemonService()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<PokemonsBloc>(
                create: (context) => PokemonsBloc(
                    pokeRepository: context.read<PokemonRepository>())
                  ..add(GetPokemons())),
            BlocProvider<CategoryBloc>(
                create: (context) => CategoryBloc(
                    pokemonRepository: context.read<PokemonRepository>())
                  ..add(GetCategories())),
            BlocProvider<ItemsByCategoryBloc>(
              create: (context) => ItemsByCategoryBloc(
                pokemonRepository: context.read<PokemonRepository>(),
              ),
            ),
          ],
          child: const HomeLayout(),
        ),
      ),
    );
  }
}
