import 'package:bloc_app/repository/poke_repository.dart';
import 'package:bloc_app/repository/service/poke_service.dart';
import 'package:bloc_app/ui/home/pages/home_layout.dart';
import 'package:bloc_app/ui/home/widgets/bloc/pokemons_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent.shade400,
      body: RepositoryProvider(
        create: (context) => PokeRepository(service: PokeService()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<PokemonsBloc>(
                create: (context) =>
                    PokemonsBloc(pokeRepository: context.read<PokeRepository>())
                      ..add(GetPokemons())),
          ],
          child: const HomeLayout(),
        ),
      ),
    );
  }
}
