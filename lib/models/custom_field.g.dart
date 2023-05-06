// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomField _$CustomFieldFromJson(Map<String, dynamic> json) => CustomField(
      field: json['field'] as String?,
      value: json['value'] as String?,
      field_format: json['field_format'] as String?,
      element: json['element'] as String?,
    );

Map<String, dynamic> _$CustomFieldToJson(CustomField instance) =>
    <String, dynamic>{
      'field': instance.field,
      'value': instance.value,
      'field_format': instance.field_format,
      'element': instance.element,
    };
