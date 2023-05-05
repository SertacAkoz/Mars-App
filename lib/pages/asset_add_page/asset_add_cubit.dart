// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_select/flutter_native_select.dart';
import 'package:mars_app/models/asset_add_response.dart';
import 'package:mars_app/models/dto/asset_add_dto.dart';
import 'package:mars_app/models/dto/get_locations_dto.dart';
import 'package:mars_app/models/location_response.dart';
import 'package:mars_app/utils/resource.dart';
import 'package:meta/meta.dart';

import 'package:mars_app/pages/asset_add_page/asset_add_repo.dart';

part 'asset_add_state.dart';

class AssetAddCubit extends Cubit<AssetAddState> {
  final AssetAddRepository _repo;
  AssetAddCubit({
    required AssetAddRepository repo,
  })  : _repo = repo,
        super(AssetAddInitial());

  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  int randomStringLenght = 40;

  late Resource<LocationResponse> responseLocations;
  NativeSelectItem? selectValueLocation;

  late Resource<AssetAddResponse> responseAssetAdd;

  TextEditingController nameTextController = TextEditingController();
  TextEditingController purchaseTextController = TextEditingController();

  Future<void> addAsset(AssetAddDto dto) async {
    emit(AssetAddLoading());
    responseAssetAdd = await _repo.addAsset(dto);
    debugPrint('Cubit Status : ${responseAssetAdd.status}');
    debugPrint('Cubit Messages : ${responseAssetAdd.message}');
    emit(
      AssetAddSuccess(
        locations: responseLocations,
        selectValueLocation: selectValueLocation,
        response: responseAssetAdd,
      ),
    );
  }

  bool checkForm() {
    if (selectValueLocation == null ||
        nameTextController.text == '' ||
        purchaseTextController.text == '') {
      return false;
    } else {
      return true;
    }
  }

  String getRandomString() {
    randomStringLenght++;
    return String.fromCharCodes(
      Iterable.generate(
        randomStringLenght,
        (_) => _chars.codeUnitAt(
          _rnd.nextInt(_chars.length),
        ),
      ),
    );
  }

  Future<void> getLocations() async {
    GetLocationsDto dto = GetLocationsDto();
    responseLocations = await _repo.getLocations(dto);
    emit(AssetAddSuccess(locations: responseLocations));
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
      final result =
          selectList.where((element) => element.value == selectedItem).toList();
      selectValueLocation = result[0];
      emit(
        AssetAddSuccess(
          locations: responseLocations,
          selectValueLocation: selectValueLocation,
        ),
      );
    }
  }
}
