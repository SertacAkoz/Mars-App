// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:mars_app/models/asset.dart';
import 'package:mars_app/pages/asset_detail_page/asset_detail_style.dart';

class AssetDetailView extends StatelessWidget {
  AssetDetailStyle style;
  Asset asset;
  AssetDetailView({
    Key? key,
    required this.style,
    required this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
