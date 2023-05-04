// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:mars_app/models/company_model.dart';


part 'company_response.g.dart';

@JsonSerializable()
class CompanyResponse {
  
  final int? total;
  final List<CompanyModel>? rows;
  
  CompanyResponse({
    this.total,
    this.rows,
  });


  factory CompanyResponse.fromJson(Map<String, dynamic> json) => _$CompanyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyResponseToJson(this);
}
