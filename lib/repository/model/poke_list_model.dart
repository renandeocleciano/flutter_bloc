import 'package:bloc_app/repository/model/result_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'poke_list_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokeListModel {
  final int? count;
  final String? next;
  final int? previous;
  final List<ResultModel> results;

  const PokeListModel({
    this.count,
    this.next,
    this.previous,
    required this.results,
  });

  static const empty =
      PokeListModel(results: [], count: 0, next: '', previous: 0);

  factory PokeListModel.fromJson(Map<String, dynamic> json) =>
      _$PokeListModelFromJson(json);
}
