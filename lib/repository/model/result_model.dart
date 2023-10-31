import 'package:json_annotation/json_annotation.dart';

part 'result_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ResultModel {
  ResultModel({this.name, this.url});

  final String? name;
  final String? url;

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);
}
