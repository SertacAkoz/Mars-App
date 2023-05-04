// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'get_locations_dto.g.dart';

@JsonSerializable()
class GetLocationsDto {
  String? limit = '50';
  String? offset = '0';
  String? sort = 'created_at';

  GetLocationsDto({
    String? limitParam,
    String? offsetParam,
    String? sortParam,
  })  : limit = limitParam,
        offset = offsetParam,
        sort = sortParam;

  factory GetLocationsDto.fromJson(Map<String, dynamic> json) =>
      _$GetLocationsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetLocationsDtoToJson(this);
}
