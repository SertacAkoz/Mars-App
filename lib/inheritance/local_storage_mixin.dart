import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mars_app/models/asset.dart';
import 'package:mars_app/utils/constants.dart';
import 'package:mars_app/utils/resource.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin LocalStorageMixin {
  late SharedPreferences prefs;

  Future<bool> saveAssetToLocalStorage(Asset asset) async {
    try {
      prefs = await SharedPreferences.getInstance();
      Resource<List<Asset>?> currentList = await getFavourites();
      if (currentList.data == null) {
        currentList.data = [asset];
      } else {
        if (!isExist(list: currentList.data!, asset: asset)) {
          currentList.data!.add(asset);
        }
      }
      final listString = json.encode(currentList.data);
      final result = prefs.setString(Constants.FAVOURITE_KEY, listString);
      return result;
    } catch (e) {
      debugPrint('Exception');
      debugPrint(e.toString());
      return false;
    }
  }

  bool isExist({required List<Asset> list, required Asset asset}) {
    bool result = false;
    for (var i = 0; i < list.length; i++) {
      if (list[i].id == asset.id) {
        result = true;
      }
    }
    return result;
  }

  Future<bool> saveFavouriteList({required List<Asset> assetList}) async {
    try {
      prefs = await SharedPreferences.getInstance();

      final listString = json.encode(assetList);
      final result = prefs.setString(Constants.FAVOURITE_KEY, listString);
      return result;
    } catch (e) {
      return false;
    }
  }

  Future<Resource<List<Asset>?>> getFavourites() async {
    try {
      prefs = await SharedPreferences.getInstance();
      final localString = prefs.getString(Constants.FAVOURITE_KEY);
      // debugPrint('Sepet Interface String');
      // debugPrint(localString);
      Iterable iterable = json.decode(localString ?? '[]');
      // debugPrint('Iterable -> ${iterable.toString()}');
      List<Asset> favouriteList =
          List<Asset>.from(iterable.map((model) => Asset.fromJson(model)));
      return Resource.success(favouriteList);
    } catch (e) {
      // debugPrint('Exception - ILocalSepet - getSepet() -> ${e.toString()}');
      return Resource.error(e.toString());
    }
  }
}
