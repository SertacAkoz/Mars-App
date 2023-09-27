import 'package:mars_app/inheritance/asset_feature_mixin.dart';
import 'package:mars_app/inheritance/list_mixin.dart';
import 'package:mars_app/models/dto/get_list_dto.dart';
import 'package:mars_app/models/asset_list_response.dart';
import 'package:mars_app/services/rest_service.dart';
import 'package:mars_app/utils/resource.dart';

class ListRepository with ListMixin, AssetFeatureMixin {
  final RestService _service;
  ListRepository({
    required RestService service,
  }) : _service = service;

  @override
  Future<Resource<AssetListResponse>> getAssetList(GetListDto dto) async {
    try {
      final response = await _service.getAssetListQuery(
        dto.limit!,
        dto.offset,
        dto.sort,
        dto.order,
        dto.location_id,
        dto.category_id,
        dto.company_id,
        dto.model_id,
      );
      return Resource.success(response.data);
    } catch (e) {
      return Resource.error(e.toString());
    }
  }

  // @override
  // Future<Resource<LocationResponse>> getLocations(GetLocationsDto dto) async {
  //   try {
  //     final response = await _service.getLocations(dto);
  //     return Resource.success(response.data);
  //   } catch (e) {
  //     return Resource.error(e.toString());
  //   }
  // }

  // @override
  // Future<Resource<CategoryResponse>> getCategories() async {
  //   try {
  //     final response = await _service.getCategories();
  //     return Resource.success(response.data);
  //   } catch (e) {
  //     return Resource.error(e.toString());
  //   }
  // }

  // @override
  // Future<Resource<CompanyResponse>> getCompanies() async {
  //   try {
  //     final response = await _service.getCompanies();
  //     return Resource.success(response.data);
  //   } catch (e) {
  //     return Resource.error(e.toString());
  //   }
  // }
}
