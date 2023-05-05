// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_add_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetAddDto _$AssetAddDtoFromJson(Map<String, dynamic> json) => AssetAddDto(
      model_id: json['model_id'] as String,
      asset_tag: json['asset_tag'] as String,
      status_id: json['status_id'] as int,
      name: json['name'] as String,
      purchase_cost: (json['purchase_cost'] as num).toDouble(),
      location_id: json['location_id'] as int,
    );

Map<String, dynamic> _$AssetAddDtoToJson(AssetAddDto instance) =>
    <String, dynamic>{
      'model_id': instance.model_id,
      'asset_tag': instance.asset_tag,
      'status_id': instance.status_id,
      'name': instance.name,
      'purchase_cost': instance.purchase_cost,
      'location_id': instance.location_id,
    };
