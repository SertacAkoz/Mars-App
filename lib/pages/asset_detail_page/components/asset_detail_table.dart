import 'package:flutter/material.dart';

import 'package:mars_app/models/asset.dart';
import 'package:mars_app/pages/asset_detail_page/asset_detail_style.dart';
import 'package:mars_app/pages/asset_detail_page/components/asset_detail_container.dart';
import 'package:mars_app/widgets/box.dart';

class AssetDetailTable extends StatelessWidget {
  final AssetDetailStyle style;
  final Asset asset;
  const AssetDetailTable({
    Key? key,
    required this.style,
    required this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AssetDetailContainer(
                  title: 'Category',
                  value: asset.category?.name ?? 'No Data',
                  style: style,
                ),
              ),
              const SizedBox(width: 25),
              Expanded(
                child: AssetDetailContainer(
                  title: 'Location',
                  value: asset.location?.name ?? 'No Data',
                  style: style,
                ),
              )
            ],
          ),
          const Box(size: BoxSize.SMALL, type: BoxType.VERTICAL),
          Row(
            children: [
              Expanded(
                child: AssetDetailContainer(
                  title: 'Supplier',
                  value: asset.supplier?.name ?? 'No Data',
                  style: style,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
