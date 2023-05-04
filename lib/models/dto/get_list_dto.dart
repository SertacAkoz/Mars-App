// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'get_list_dto.g.dart';

@JsonSerializable()
class GetListDto {
  final String? limit;
  String offset;
  String sort;
  String order;
  final String? location_id;
  final String? category_id;
  final String? company_id;

  GetListDto({
    required this.limit,
    String? offsetParam,
    String? sortParam,
    String? orderParam,
    this.location_id,
    this.category_id,
    this.company_id,
  })  : sort = sortParam ?? 'created_at',
        order = orderParam ?? 'desc',
        offset = offsetParam ?? '0';

  factory GetListDto.fromJson(Map<String, dynamic> json) =>
      _$GetListDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetListDtoToJson(this);

  @override
  String toString() {
    return ' limit : $limit \n offset : $offset \n sort : $sort \n order : $order \n location_id : $location_id';
  }
}
