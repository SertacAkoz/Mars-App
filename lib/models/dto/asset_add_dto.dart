// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'asset_add_dto.g.dart';

@JsonSerializable()
class AssetAddDto {

  final String model_id;
  final String asset_tag;
  final int status_id;
  final String name;
  double purchase_cost;
  int location_id;
  AssetAddDto({
    required this.model_id,
    required this.asset_tag,
    required this.status_id,
    required this.name,
    required this.purchase_cost,
    required this.location_id,
  });

  factory AssetAddDto.fromJson(Map<String, dynamic> json) =>
      _$AssetAddDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AssetAddDtoToJson(this);
}
