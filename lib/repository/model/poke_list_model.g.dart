// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokeListModel _$PokeListModelFromJson(Map<String, dynamic> json) =>
    PokeListModel(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as int?,
      results: (json['results'] as List<dynamic>)
          .map((e) => ResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokeListModelToJson(PokeListModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
