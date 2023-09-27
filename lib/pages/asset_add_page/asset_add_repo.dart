import 'package:flutter/material.dart';
import 'package:mars_app/inheritance/asset_add_mixin.dart';
import 'package:mars_app/inheritance/asset_feature_mixin.dart';
import 'package:mars_app/models/dto/asset_add_dto.dart';
import 'package:mars_app/models/asset_add_response.dart';
import 'package:mars_app/services/rest_service.dart';
import 'package:mars_app/utils/resource.dart';

class AssetAddRepository with AssetAddMixin, AssetFeatureMixin {
  final RestService _service;
  AssetAddRepository({
    required RestService service,
  }) : _service = service;

  @override
  Future<Resource<AssetAddResponse>> addAsset(AssetAddDto dto) async {
    // final response = await _service.addAsset(dto);
    // debugPrint('Repo Repo : ${response.data}');
    // return Resource.error('message');
    try {
      final response = await _service.addAsset(dto);
      debugPrint('Repo Status : ${response.data.status}');
      if (response.data.status == 'success') {
        debugPrint('Repo Success');
        return Resource.success(response.data);
      } else {
        debugPrint('Repo Error');
        debugPrint('Repo Message : ${response.data.messages}');
        return Resource.error(response.data.messages ?? 'Something went wrong!');
        // return Resource.error('asdasdasdasd');
      }
    } catch (e) {
      debugPrint('Repo Catch');
      return Resource.error(e.toString());
    }
  }
}
