import 'package:bloc_app/repository/model/category_model.dart';
import 'package:bloc_app/repository/model/poke_list_model.dart';
import 'package:bloc_app/repository/service/pokemon_service.dart';

class PokemonRepository {
  const PokemonRepository({required this.service});

  final PokemonService service;

  Future<PokeListModel> getPokemons() async => service.getPokemons();
  Future<List<CategoryModel>> getCategory() async => service.getCategory();
  Future<List<CategoryModel>> getItemsByCategory(int id) async =>
      service.getPokemon(id);
}
