// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import 'package:mars_app/models/category_model.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  
  final int? total;
  final List<CategoryModel>? rows;
  
  CategoryResponse({
    this.total,
    this.rows,
  });


  factory CategoryResponse.fromJson(Map<String, dynamic> json) => _$CategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}
