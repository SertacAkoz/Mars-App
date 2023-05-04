// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:mars_app/pages/asset_add_page/asset_add_cubit.dart';
import 'package:mars_app/pages/asset_add_page/asset_add_style.dart';

class AssetAddView extends StatelessWidget {
  AssetAddStyle style;
  AssetAddCubit viewModel;
  AssetAddView({
    Key? key,
    required this.style,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
