import 'package:bloc_app/repository/model/poke_list_model.dart';
import 'package:bloc_app/repository/service/poke_service.dart';

class PokeRepository {
  const PokeRepository({required this.service});

  final PokeService service;

  Future<PokeListModel> getPokeList() async => service.getPokemons();
}
