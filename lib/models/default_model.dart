// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'default_model.g.dart';

@JsonSerializable()
class DefaultModel {
  
  final int? id;
  final String? name;
  DefaultModel({
    this.id,
    this.name,
  });


  factory DefaultModel.fromJson(Map<String, dynamic> json) => _$DefaultModelFromJson(json);
  Map<String, dynamic> toJson() => _$DefaultModelToJson(this);
}
