// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:mars_app/models/asset_list_response.dart';
import 'package:mars_app/models/category_response.dart';
import 'package:mars_app/models/company_response.dart';
import 'package:mars_app/models/dto/get_list_dto.dart';
import 'package:mars_app/models/dto/get_locations_dto.dart';
import 'package:mars_app/models/location_response.dart';
import 'package:mars_app/utils/constants.dart';

import 'package:retrofit/retrofit.dart';

part 'rest_service.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class RestService {
  factory RestService(Dio dio, {String baseUrl}) = _RestService;

  @GET('/hardware')
  Future<HttpResponse<AssetListResponse>> getAssetList(@Body() GetListDto dto);

  @GET('/hardware')
  Future<HttpResponse<AssetListResponse>> getAssetListQuery(@Query('limit') String limit, @Query('offset') String offset, @Query('sort') String sort, @Query('order') String order, @Query('location_id') String? locationId, @Query('category_id') String? categoryId, @Query('company_id') String? companyId,);

  @GET('/locations')
  Future<HttpResponse<LocationResponse>> getLocations(@Body() GetLocationsDto dto);

  @GET('/categories')
  Future<HttpResponse<CategoryResponse>> getCategories();

  @GET('/companies')
  Future<HttpResponse<CompanyResponse>> getCompanies();
}