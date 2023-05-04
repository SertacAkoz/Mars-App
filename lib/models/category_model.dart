// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable(fieldRename:FieldRename.snake)
class CategoryModel {
  
  final int? id;
  final String? name;
  @JsonKey(name:'category_type')
  final String? categoryType;
  @JsonKey(name:'item_count')
  final int? itemCount;
  @JsonKey(name:'assets_count')
  final int? assetsCount;
  
  CategoryModel({
    this.id,
    this.name,
    this.categoryType,
    this.itemCount,
    this.assetsCount,
  });


  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
