import 'package:mars_app/models/asset_add_response.dart';
import 'package:mars_app/models/dto/asset_add_dto.dart';
import 'package:mars_app/utils/resource.dart';

mixin AssetAddMixin{
  Future<Resource<AssetAddResponse>> addAsset(AssetAddDto dto);
}