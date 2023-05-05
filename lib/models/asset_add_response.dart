// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'asset_add_response.g.dart';

@JsonSerializable()
class AssetAddResponse {
  
  final String? status;
  final String? messages;

  AssetAddResponse({
    required this.status,
    required this.messages,
  });


  factory AssetAddResponse.fromJson(Map<String, dynamic> json) => _$AssetAddResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AssetAddResponseToJson(this);
}
