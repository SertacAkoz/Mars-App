// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import 'package:mars_app/models/asset.dart';

part 'asset_list_response.g.dart';

@JsonSerializable()
class AssetListResponse {
  
  final int? total;
  final List<Asset>? rows;
  AssetListResponse({
    this.total,
    this.rows,
  });


  factory AssetListResponse.fromJson(Map<String, dynamic> json) => _$AssetListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AssetListResponseToJson(this);
}
