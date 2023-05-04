// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:bloc/bloc.dart';
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

  String getRandomString(int length) {
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(
          _rnd.nextInt(_chars.length),
        ),
      ),
    );
  }
}
