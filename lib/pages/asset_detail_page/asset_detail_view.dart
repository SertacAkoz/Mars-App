// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:mars_app/models/asset.dart';
import 'package:mars_app/pages/asset_detail_page/asset_detail_style.dart';

class AssetDetailView extends StatelessWidget {
  final AssetDetailStyle _style;
  final Asset _asset;
  const AssetDetailView({
    Key? key,
    required AssetDetailStyle style,
    required Asset asset,
  }) : _style = style, _asset = asset, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _style.primaryColor(),
        title: const Text('Asset Detail'),
      ),
      body: Column(
        children: [
          Hero(
            tag: _asset.id!,
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: CachedNetworkImage(
                    imageUrl: _asset.image!,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
          ),
          Text(_asset.model?.name ?? 'No Data'),
          Text(_asset.purchaseCost ?? 'No Data'),
        ],
      ),
    );
  }
}
