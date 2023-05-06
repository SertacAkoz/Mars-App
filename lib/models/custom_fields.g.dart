// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomFields _$CustomFieldsFromJson(Map<String, dynamic> json) => CustomFields(
      ram: json['RAM'] == null
          ? null
          : CustomField.fromJson(json['RAM'] as Map<String, dynamic>),
      cpu: json['CPU'] == null
          ? null
          : CustomField.fromJson(json['CPU'] as Map<String, dynamic>),
      macAddress: json['MAC Address'] == null
          ? null
          : CustomField.fromJson(json['MAC Address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomFieldsToJson(CustomFields instance) =>
    <String, dynamic>{
      'RAM': instance.ram,
      'CPU': instance.cpu,
      'MAC Address': instance.macAddress,
    };
