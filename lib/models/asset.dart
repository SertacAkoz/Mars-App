// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import 'package:mars_app/models/default_model.dart';

part 'asset.g.dart';

@JsonSerializable(fieldRename:FieldRename.snake)
class Asset {
  
  final int? id;
  final String? name;
  @JsonKey(name:'asset_tag')
  final String? assetTag;
  final String? serial;
  final DefaultModel? model;
  @JsonKey(name:'model_number')
  final String? modelNumber;
  final DefaultModel? category;
  final DefaultModel? manufacturer;
  final DefaultModel? supplier;
  final String? notes;
  @JsonKey(name:'order_number')
  final String? orderNumber;
  final DefaultModel? location;
  final String? image;
  @JsonKey(name:'purchase_cost')
  final String? purchaseCost;
  
  Asset({
    this.id,
    this.name,
    this.assetTag,
    this.serial,
    this.model,
    this.modelNumber,
    this.category,
    this.manufacturer,
    this.supplier,
    this.notes,
    this.orderNumber,
    this.location,
    this.image,
    this.purchaseCost,
  });


  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
  Map<String, dynamic> toJson() => _$AssetToJson(this);
}
