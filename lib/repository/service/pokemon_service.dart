import 'dart:convert';

import 'package:bloc_app/repository/model/category_model.dart';
import 'package:bloc_app/repository/model/poke_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PokemonService {
  final String baseUrl;
  final Client _httpClient;

  PokemonService(
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

  Future<List<CategoryModel>> getPokemon(int id) async {
    final response = await _httpClient.get(Uri.parse('$baseUrl/pokemon/$id'));
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        List<CategoryModel> categories = [];
        final body = jsonDecode(response.body);
        var cat = CategoryModel(
            id: id,
            image:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$id.png',
            name: body["name"],
            url: "https://pokeapi.co/api/v2/pokemon/$id");
        categories.add(cat);
        return categories;
      }
    }
    throw Exception('Erro');
  }

  Future<List<CategoryModel>> getCategory() async {
    final response = await _httpClient.get(Uri.parse('$baseUrl/pokemon'));
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var responseToJson = PokeListModel.fromJson(jsonDecode(response.body));
        var results = responseToJson.results;
        List<CategoryModel> categories = [];

        for (var el in results) {
          var urlParsed = el.url!.substring(0, el.url!.length - 1);
          var splittedUrl = urlParsed.split('/');
          var id = int.parse(splittedUrl[splittedUrl.length - 1]);
          var cat = CategoryModel(
              id: id,
              image:
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$id.png',
              name: el.name,
              url: el.url);
          categories.add(cat);
        }
        return categories;
      }
    }
    throw Exception('Erro');
  }
}
