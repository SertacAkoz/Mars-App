import 'package:mars_app/di/dependecy_injection.dart';
import 'package:mars_app/models/category_response.dart';
import 'package:mars_app/models/company_response.dart';
import 'package:mars_app/models/dto/get_locations_dto.dart';
import 'package:mars_app/models/location_response.dart';
import 'package:mars_app/models/model_response.dart';
import 'package:mars_app/services/rest_service.dart';
import 'package:mars_app/utils/resource.dart';

mixin AssetFeatureMixin {
  final _service = getIt.get<RestService>();

  Future<Resource<LocationResponse>> getLocations(GetLocationsDto dto) async {
    try {
      final response = await _service.getLocations(dto);
      return Resource.success(response.data);
    } catch (e) {
      return Resource.error(e.toString());
    }
  }

  Future<Resource<CategoryResponse>> getCategories() async {
    try {
      final response = await _service.getCategories();
      return Resource.success(response.data);
    } catch (e) {
      return Resource.error(e.toString());
    }
  }

  Future<Resource<CompanyResponse>> getCompanies() async {
    try {
      final response = await _service.getCompanies();
      return Resource.success(response.data);
    } catch (e) {
      return Resource.error(e.toString());
    }
  }

  Future<Resource<ModelResponse>> getModels() async {
    try {
      final response = await _service.getModels();
      return Resource.success(response.data);
    } catch (e) {
      return Resource.error(e.toString());
    }
  }
}
