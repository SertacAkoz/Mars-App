import 'package:mars_app/models/asset_list_response.dart';
import 'package:mars_app/models/category_response.dart';
import 'package:mars_app/models/company_response.dart';
import 'package:mars_app/models/dto/get_list_dto.dart';
import 'package:mars_app/models/dto/get_locations_dto.dart';
import 'package:mars_app/models/location_response.dart';
import 'package:mars_app/utils/resource.dart';

mixin ListMixin{
  Future<Resource<AssetListResponse>> getAssetList(GetListDto dto);
  Future<Resource<LocationResponse>> getLocations(GetLocationsDto dto);
  Future<Resource<CategoryResponse>> getCategories();
  Future<Resource<CompanyResponse>> getCompanies();
}