// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Asset _$AssetFromJson(Map<String, dynamic> json) => Asset(
      id: json['id'] as int?,
      name: json['name'] as String?,
      assetTag: json['asset_tag'] as String?,
      serial: json['serial'] as String?,
      model: json['model'] == null
          ? null
          : DefaultModel.fromJson(json['model'] as Map<String, dynamic>),
      modelNumber: json['model_number'] as String?,
      category: json['category'] == null
          ? null
          : DefaultModel.fromJson(json['category'] as Map<String, dynamic>),
      manufacturer: json['manufacturer'] == null
          ? null
          : DefaultModel.fromJson(json['manufacturer'] as Map<String, dynamic>),
      supplier: json['supplier'] == null
          ? null
          : DefaultModel.fromJson(json['supplier'] as Map<String, dynamic>),
      notes: json['notes'] as String?,
      orderNumber: json['order_number'] as String?,
      location: json['location'] == null
          ? null
          : DefaultModel.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String?,
      purchaseCost: json['purchase_cost'] as String?,
      age: json['age'] as String?,
      customFields: json['custom_fields'] == null
          ? null
          : CustomFields.fromJson(
              json['custom_fields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'asset_tag': instance.assetTag,
      'serial': instance.serial,
      'model': instance.model,
      'model_number': instance.modelNumber,
      'category': instance.category,
      'manufacturer': instance.manufacturer,
      'supplier': instance.supplier,
      'notes': instance.notes,
      'order_number': instance.orderNumber,
      'location': instance.location,
      'image': instance.image,
      'purchase_cost': instance.purchaseCost,
      'age': instance.age,
      'custom_fields': instance.customFields,
    };
