// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_locations_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLocationsDto _$GetLocationsDtoFromJson(Map<String, dynamic> json) =>
    GetLocationsDto()
      ..limit = json['limit'] as String?
      ..offset = json['offset'] as String?
      ..sort = json['sort'] as String?;

Map<String, dynamic> _$GetLocationsDtoToJson(GetLocationsDto instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'sort': instance.sort,
    };
