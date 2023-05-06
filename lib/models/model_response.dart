// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import 'package:mars_app/models/asset.dart';

part 'model_response.g.dart';

@JsonSerializable()
class ModelResponse {
  
  final int? total;
  final List<Asset>? rows;
  
  ModelResponse({
    this.total,
    this.rows,
  });


  factory ModelResponse.fromJson(Map<String, dynamic> json) => _$ModelResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ModelResponseToJson(this);
}
