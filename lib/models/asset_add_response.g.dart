// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_add_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetAddResponse _$AssetAddResponseFromJson(Map<String, dynamic> json) =>
    AssetAddResponse(
      status: json['status'] as String?,
      messages: json['messages'] as String?,
    );

Map<String, dynamic> _$AssetAddResponseToJson(AssetAddResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'messages': instance.messages,
    };
