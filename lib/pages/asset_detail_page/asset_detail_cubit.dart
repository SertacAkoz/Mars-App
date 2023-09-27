// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:mars_app/models/asset.dart';
import 'package:meta/meta.dart';

import 'package:mars_app/pages/asset_detail_page/asset_detail_repo.dart';

part 'asset_detail_state.dart';

class AssetDetailCubit extends Cubit<AssetDetailState> {
  final AssetDetailRepository _repo;
  AssetDetailCubit({
    required AssetDetailRepository repo,
  })  : _repo = repo,
        super(AssetDetailInitial());

  Future<bool> addToFavourite(Asset asset) async {
    return await _repo.saveAssetToLocalStorage(asset);
  }
}
