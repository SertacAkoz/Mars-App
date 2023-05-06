// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelResponse _$ModelResponseFromJson(Map<String, dynamic> json) =>
    ModelResponse(
      total: json['total'] as int?,
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ModelResponseToJson(ModelResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'rows': instance.rows,
    };
