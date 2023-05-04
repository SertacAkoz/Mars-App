// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'deneme_model.g.dart';

@JsonSerializable(fieldRename:FieldRename.snake)
class DenemeModel {
  
  @JsonKey(name:'picture_url')
  String pictureUrl;
  DenemeModel({
    required this.pictureUrl,
  });


  factory DenemeModel.fromJson(Map<String, dynamic> json) => _$DenemeModelFromJson(json);
  Map<String, dynamic> toJson() => _$DenemeModelToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DenemeModel &&
      other.pictureUrl == pictureUrl;
  }

  @override
  int get hashCode => pictureUrl.hashCode;

  @override
  String toString() {
    return 'pictureUrl : $pictureUrl';
  }
}
