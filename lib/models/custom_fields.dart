// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import 'package:mars_app/models/custom_field.dart';

part 'custom_fields.g.dart';

@JsonSerializable(fieldRename:FieldRename.snake)
class CustomFields {
  
  @JsonKey(name:'RAM')
  final CustomField? ram;
  @JsonKey(name:'CPU')
  final CustomField? cpu;
  @JsonKey(name:'MAC Address')
  final CustomField? macAddress;
  
  CustomFields({
    this.ram,
    this.cpu,
    this.macAddress,
  });

  factory CustomFields.fromJson(Map<String, dynamic> json) => _$CustomFieldsFromJson(json);
  Map<String, dynamic> toJson() => _$CustomFieldsToJson(this);
}
