// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable(fieldRename:FieldRename.snake)
class CompanyModel {
  
  final int? id;
  final String? name;
  @JsonKey(name:'assets_count')
  final int? assetsCount;
  @JsonKey(name:'users_count')
  final int? usersCount;

  CompanyModel({
    this.id,
    this.name,
    this.assetsCount,
    this.usersCount,
  });


  factory CompanyModel.fromJson(Map<String, dynamic> json) => _$CompanyModelFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}
