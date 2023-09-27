import 'package:flutter/material.dart';

import 'package:mars_app/models/asset.dart';
import 'package:mars_app/utils/utils.dart';

class FavouriteItem extends StatelessWidget {
  final Asset asset;
  final Function(Asset) onDelete;
  const FavouriteItem({
    Key? key,
    required this.asset,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Utils.navigate(navigationPath: '/assetDetail', context: context, argumenents: asset);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${asset.manufacturer?.name} ${asset.model?.name}'),
            IconButton(
              onPressed: () {
                onDelete(asset);
              },
              icon: const Icon(Icons.delete_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
