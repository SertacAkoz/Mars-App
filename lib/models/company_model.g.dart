// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) => CompanyModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      assetsCount: json['assets_count'] as int?,
      usersCount: json['users_count'] as int?,
    );

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'assets_count': instance.assetsCount,
      'users_count': instance.usersCount,
    };
