// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'custom_field.g.dart';

@JsonSerializable()
class CustomField {
  
  final String? field;
  final String? value;
  final String? field_format;
  final String? element;

  CustomField({
    this.field,
    this.value,
    this.field_format,
    this.element,
  });

  factory CustomField.fromJson(Map<String, dynamic> json) => _$CustomFieldFromJson(json);
  Map<String, dynamic> toJson() => _$CustomFieldToJson(this);
}
