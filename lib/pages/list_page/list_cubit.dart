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
import 'package:mars_app/models/model_response.dart';
import 'package:mars_app/utils/resource.dart';

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
  late Resource<ModelResponse> responseModels;

  NativeSelectItem? selectValueLocation;
  NativeSelectItem? selectValueCategory;
  NativeSelectItem? selectValueCompany;
  NativeSelectItem? selectValueModel;

  Future<void> toggleFilter(bool value) async {
    // emit(ListSuccess(assets: responseAssetList, isExpandedFilterValue: value));
    emit(
      ListSuccess(
        assets: responseAssetList,
        categories: responseCategories,
        locations: responseLocations,
        companies: responseCompanies,
        models: responseModels,
        isExpandedFilterValue: value,
      ),
    );
  }

  Future<void> getLocations() async {
    GetLocationsDto dto = GetLocationsDto();
    responseLocations = await _repo.getLocations(dto);
  }

  Future<void> getCategories() async {
    responseCategories = await _repo.getCategories();
  }

  Future<void> getModels() async {
    responseModels = await _repo.getModels();
  }

  Future<void> getCompanies() async {
    responseCompanies = await _repo.getCompanies();
  }

  Future<void> getAllDatas() async {
    emit(ListLoading());

    _clearFilters();

    await getLocations();
    await getCategories();
    await getCompanies();
    await getModels();
    await getAssetList(limit: '50');
    if (responseAssetList.status == Status.SUCCESS) {
      emit(
        ListSuccess(
          assets: responseAssetList,
          categories: responseCategories,
          locations: responseLocations,
          companies: responseCompanies,
          models: responseModels,
        ),
      );
    } else if (responseAssetList.status == Status.ERROR) {
      emit(
        ListError(
          errorMessage: responseAssetList.message ?? 'Something went wrong!',
        ),
      );
    }
  }

  void showLocationSelectBox() async {
    List<NativeSelectItem> selectList = [];
    for (var index = 0; index < responseLocations.data!.rows!.length; index++) {
      selectList.add(NativeSelectItem(
          value: responseLocations.data!.rows![index].id.toString(),
          label:
              '${responseLocations.data!.rows![index].city} ${responseLocations.data!.rows![index].address} ${responseLocations.data!.rows![index].address2}'));
    }
    final selectedItem = await FlutterNativeSelect.openSelect(
      doneText: 'Select',
      items: selectList,
    );

    if (selectedItem != null) {
      debugPrint('User selected: $selectedItem');
      final result =
          selectList.where((element) => element.value == selectedItem).toList();
      debugPrint('Result : ${result[0].label}');
      selectValueLocation = result[0];
      emit(
        ListSuccess(
          assets: responseAssetList,
          categories: responseCategories,
          locations: responseLocations,
          companies: responseCompanies,
          models: responseModels,
          selectValueLocation: selectValueLocation,
          selectValueCompany: selectValueCompany,
          selectValueCategory: selectValueCategory,
          selectValueModels: selectValueModel,
        ),
      );
    }
  }

  void showModelsSelectBox() async {
    List<NativeSelectItem> selectList = [];
    for (var index = 0; index < responseModels.data!.rows!.length; index++) {
      selectList.add(NativeSelectItem(
          value: responseModels.data!.rows![index].id.toString(),
          label:
              '${responseModels.data!.rows![index].manufacturer?.name ?? ''} ${responseModels.data!.rows![index].name?.replaceAll('&quot;', '')}'));
    }
    final selectedItem = await FlutterNativeSelect.openSelect(
      doneText: 'Select',
      items: selectList,
    );

    if (selectedItem != null) {
      final result =
          selectList.where((element) => element.value == selectedItem).toList();
      selectValueModel = result[0];
      emit(
        ListSuccess(
          assets: responseAssetList,
          categories: responseCategories,
          locations: responseLocations,
          companies: responseCompanies,
          models: responseModels,
          selectValueLocation: selectValueLocation,
          selectValueCompany: selectValueCompany,
          selectValueCategory: selectValueCategory,
          selectValueModels: selectValueModel,
        ),
      );
    }
  }

  void showCompanySelectBox() async {
    List<NativeSelectItem> selectList = [];
    for (var index = 0; index < responseCompanies.data!.rows!.length; index++) {
      selectList.add(NativeSelectItem(
          value: responseCompanies.data!.rows![index].id.toString(),
          label: '${responseCompanies.data!.rows![index].name}'));
    }
    final selectedItem = await FlutterNativeSelect.openSelect(
      doneText: 'Select',
      items: selectList,
    );

    if (selectedItem != null) {
      debugPrint('User selected: $selectedItem');
      final result =
          selectList.where((element) => element.value == selectedItem).toList();
      debugPrint('Result : ${result[0].label}');
      selectValueCompany = result[0];
      emit(
        ListSuccess(
            assets: responseAssetList,
            categories: responseCategories,
            locations: responseLocations,
            companies: responseCompanies,
            models: responseModels,
            selectValueLocation: selectValueLocation,
            selectValueCompany: selectValueCompany,
            selectValueCategory: selectValueCategory,
            selectValueModels: selectValueModel),
      );
    }
  }

  void showCategorySelectBox() async {
    List<NativeSelectItem> selectList = [];
    for (var index = 0;
        index < responseCategories.data!.rows!.length;
        index++) {
      selectList.add(NativeSelectItem(
          value: responseCategories.data!.rows![index].id.toString(),
          label: '${responseCategories.data!.rows![index].name}'));
    }
    final selectedItem = await FlutterNativeSelect.openSelect(
      doneText: 'Select',
      items: selectList,
    );

    if (selectedItem != null) {
      debugPrint('User selected: $selectedItem');
      final result =
          selectList.where((element) => element.value == selectedItem).toList();
      debugPrint('Result : ${result[0].label}');
      selectValueCategory = result[0];
      emit(
        ListSuccess(
          assets: responseAssetList,
          categories: responseCategories,
          locations: responseLocations,
          companies: responseCompanies,
          models: responseModels,
          selectValueLocation: selectValueLocation,
          selectValueCompany: selectValueCompany,
          selectValueCategory: selectValueCategory,
          selectValueModels: selectValueModel,
        ),
      );
    }
  }

  Future<void> searchList() async {
    emit(ListLoading());
    GetListDto dto = GetListDto(
      limit: '50',
      location_id: selectValueLocation?.value,
      company_id: selectValueCompany?.value,
      category_id: selectValueCategory?.value,
      model_id: selectValueModel?.value,
    );
    responseAssetList = await _repo.getAssetList(dto);
    if (responseAssetList.status == Status.SUCCESS) {
      emit(
        ListSuccess(
          assets: responseAssetList,
          categories: responseCategories,
          locations: responseLocations,
          companies: responseCompanies,
          models: responseModels,
        ),
      );
    } else if (responseAssetList.status == Status.ERROR) {
      emit(
        ListError(
            errorMessage: responseAssetList.message ?? 'Something went wrong!'),
      );
    }

    _clearFilters();
  }

  void _clearFilters() {
    selectValueCategory = null;
    selectValueCompany = null;
    selectValueLocation = null;
    selectValueModel = null;
  }

  void clearFilterDatas() {
    emit(
      ListSuccess(
        assets: responseAssetList,
        categories: responseCategories,
        locations: responseLocations,
        companies: responseCompanies,
        models: responseModels,
        selectValueLocation: null,
        selectValueCategory: null,
        selectValueCompany: null,
        selectValueModels: null,
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
  }
}
