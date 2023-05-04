// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import 'package:mars_app/models/location_model.dart';

part 'location_response.g.dart';

@JsonSerializable()
class LocationResponse {
  
  final int? total;
  final List<LocationModel>? rows;
  
  LocationResponse({
    this.total,
    this.rows,
  });


  factory LocationResponse.fromJson(Map<String, dynamic> json) => _$LocationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);
}
