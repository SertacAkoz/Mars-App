// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mars_app/models/asset.dart';
import 'package:mars_app/models/default_model.dart';
import 'package:mars_app/utils/resource.dart';
import 'package:meta/meta.dart';

import 'package:mars_app/pages/favourite_page/favourite_repo.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final FavouriteRepository _repo;
  FavouriteCubit({
    required FavouriteRepository repo,
  })  : _repo = repo,
        super(FavouriteInitial());

  Future<void> getFavourites() async {
    emit(FavouriteLoading());
    final favouriteResult = await _repo.getFavourites();

    if (favouriteResult.status == Status.SUCCESS) {
      emit(FavouriteSuccess(favouriteList: favouriteResult.data));
    } else {
      emit(
        FavouriteError(
          message: favouriteResult.message ??
              'Something went wrong, please tryn again later.',
        ),
      );
    }
  }

  void emitError(){
    emit(FavouriteError(message: 'Error'));
  }

  Future<void> deleteAsset(Asset asset) async {
    emit(FavouriteLoading());
    await _repo.deleteAssetFromLocalStorage(asset);
    getFavourites();
  }
}
