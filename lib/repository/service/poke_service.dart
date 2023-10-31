import 'dart:convert';

import 'package:bloc_app/repository/model/poke_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PokeService {
  final String baseUrl;
  final Client _httpClient;

  PokeService(
      {http.Client? httpClient, this.baseUrl = 'https://pokeapi.co/api/v2'})
      : _httpClient = httpClient ?? http.Client();

  Future<PokeListModel> getPokemons() async {
    final response = await _httpClient.get(Uri.parse('$baseUrl/pokemon'));
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        return PokeListModel.fromJson(jsonDecode(response.body));
      }
    }
    throw Exception('Erro');
  }
}
