// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      categoryType: json['category_type'] as String?,
      itemCount: json['item_count'] as int?,
      assetsCount: json['assets_count'] as int?,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category_type': instance.categoryType,
      'item_count': instance.itemCount,
      'assets_count': instance.assetsCount,
    };
