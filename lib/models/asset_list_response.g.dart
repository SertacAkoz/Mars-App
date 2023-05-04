// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetListResponse _$AssetListResponseFromJson(Map<String, dynamic> json) =>
    AssetListResponse(
      total: json['total'] as int?,
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AssetListResponseToJson(AssetListResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'rows': instance.rows,
    };
