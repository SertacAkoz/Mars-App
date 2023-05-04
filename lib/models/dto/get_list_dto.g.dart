// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetListDto _$GetListDtoFromJson(Map<String, dynamic> json) => GetListDto(
      limit: json['limit'] as String?,
      location_id: json['location_id'] as String?,
      category_id: json['category_id'] as String?,
      company_id: json['company_id'] as String?,
    )
      ..offset = json['offset'] as String
      ..sort = json['sort'] as String
      ..order = json['order'] as String;

Map<String, dynamic> _$GetListDtoToJson(GetListDto instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'sort': instance.sort,
      'order': instance.order,
      'location_id': instance.location_id,
      'category_id': instance.category_id,
      'company_id': instance.company_id,
    };
