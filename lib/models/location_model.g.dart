// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      address: json['address'] as String?,
      address2: json['address2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      zip: json['zip'] as String?,
      assignedAssetsCount: json['assigned_assets_count'] as int?,
      assetsCount: json['assets_count'] as int?,
      rtdAssetsCount: json['rtd_assets_count'] as int?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'address': instance.address,
      'address2': instance.address2,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'zip': instance.zip,
      'assigned_assets_count': instance.assignedAssetsCount,
      'assets_count': instance.assetsCount,
      'rtd_assets_count': instance.rtdAssetsCount,
      'currency': instance.currency,
    };
