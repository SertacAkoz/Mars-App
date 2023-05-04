// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable(fieldRename:FieldRename.snake)
class LocationModel {
  
  
  final int? id;
  final String? name;
  final String? image;
  final String? address;
  final String? address2;
  final String? city;
  final String? state;
  final String? country;
  final String? zip;
  @JsonKey(name:'assigned_assets_count')
  final int? assignedAssetsCount;
  @JsonKey(name:'assets_count')
  final int? assetsCount;
  @JsonKey(name:'rtd_assets_count')
  final int? rtdAssetsCount;
  final String? currency;
  
  LocationModel({
    this.id,
    this.name,
    this.image,
    this.address,
    this.address2,
    this.city,
    this.state,
    this.country,
    this.zip,
    this.assignedAssetsCount,
    this.assetsCount,
    this.rtdAssetsCount,
    this.currency,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
