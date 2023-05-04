// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_select/flutter_native_select.dart';
import 'package:mars_app/models/asset_list_response.dart';
import 'package:mars_app/models/category_response.dart';
import 'package:mars_app/models/company_response.dart';
import 'package:mars_app/models/dto/get_list_dto.dart';
import 'package:mars_app/models/dto/get_locations_dto.dart';
import 'package:mars_app/models/location_response.dart';
import 'package:mars_app/utils/resource.dart';
import 'package:meta/meta.dart';

import 'package:mars_app/pages/list_page/list_repo.dart';

part 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  final ListRepository _repo;
  ListCubit({
    required ListRepository repo,
  })  : _repo = repo,
        super(ListInitial());

  late Resource<AssetListResponse> responseAssetList;

  late Resource<LocationResponse> responseLocations;
  late Resource<CategoryResponse> responseCategories;
  late Resource<CompanyResponse> responseCompanies;

  NativeSelectItem? selectValueLocation;
  NativeSelectItem? selectValueCategory;
  NativeSelectItem? selectValueCompany;

  Future<void> toggleFilter(bool value) async {
    // emit(ListSuccess(assets: responseAssetList, isExpandedFilterValue: value));
    emit(
      ListSuccess(
          assets: responseAssetList,
          categories: responseCategories,
          locations: responseLocations,
          companies: responseCompanies,
          isExpandedFilterValue: value),
    );
  }

  Future<void> getLocations() async {
    GetLocationsDto dto = GetLocationsDto();
    responseLocations = await _repo.getLocations(dto);
  }

  Future<void> getCategories() async {
    responseCategories = await _repo.getCategories();
  }

  Future<void> getCompanies() async {
    responseCompanies = await _repo.getCompanies();
  }

  Future<void> getAllDatas() async {
    emit(ListLoading());
    await getLocations();
    await getCategories();
    await getCompanies();
    await getAssetList(limit: '50');
    emit(
      ListSuccess(
        assets: responseAssetList,
        categories: responseCategories,
        locations: responseLocations,
        companies: responseCompanies,
      ),
    );
  }

  void showLocationSelectBox() async {
    List<NativeSelectItem> locationSelectList = [];
    for (var index = 0; index < responseLocations.data!.rows!.length; index++) {
      locationSelectList.add(NativeSelectItem(
          value: responseLocations.data!.rows![index].id.toString(),
          label:
              '${responseLocations.data!.rows![index].city} ${responseLocations.data!.rows![index].address} ${responseLocations.data!.rows![index].address2}'));
    }
    final selectedItem = await FlutterNativeSelect.openSelect(
      doneText: 'Select',
      items: locationSelectList,
    );

    if (selectedItem != null) {
      debugPrint('User selected: $selectedItem');
      final result = locationSelectList
          .where((element) => element.value == selectedItem)
          .toList();
      debugPrint('Result : ${result[0].label}');
      selectValueLocation = result[0];
      emit(
        ListSuccess(
          assets: responseAssetList,
          categories: responseCategories,
          locations: responseLocations,
          companies: responseCompanies,
          selectValueLocation: selectValueLocation,
        ),
      );
    }
  }

  Future<void> searchList() async {
    emit(ListLoading());
    GetListDto dto = GetListDto(
      limit: '50',
      location_id: selectValueLocation?.value,
    );
    responseAssetList = await _repo.getAssetList(dto);

    emit(
      ListSuccess(
        assets: responseAssetList,
        categories: responseCategories,
        locations: responseLocations,
        companies: responseCompanies,
      ),
    );
  }

  void clearFilterDatas() {
    emit(
      ListSuccess(
        assets: responseAssetList,
        categories: responseCategories,
        locations: responseLocations,
        companies: responseCompanies,
        selectValueLocation: null,
      ),
    );
  }

  String getCityNameFromLabel(String label) {
    return label.split(' ')[0];
  }

  Future<void> getAssetList({
    String? limit,
    String? locationId,
    String? offsetParam,
    String? orderParam,
    String? sortParam,
  }) async {
    // emit(ListLoading());
    GetListDto dto = GetListDto(
        limit: limit ?? '2',
        location_id: locationId,
        offsetParam: offsetParam,
        orderParam: orderParam,
        sortParam: sortParam);

    // debugPrint('DTO Limit : ${dto.limit}');
    debugPrint('| DTO GetAssetList |');
    debugPrint(dto.toString());

    // final response = await _repo.getAssetList(dto);
    responseAssetList = await _repo.getAssetList(dto);

    debugPrint(
        'Response List Lenght : ${responseAssetList.data?.rows?.length}');

    // emit(ListSuccess(assets: responseAssetList));
  }
}
