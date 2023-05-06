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
  })  : _style = style,
        _asset = asset,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Detail : ${_asset.customFields?.ram?.field}');
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
          // const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _asset.age ?? 'No Data',
                  style: _style.ageTextStyle(),
                ),
                Text(
                  _asset.purchaseCost ?? 'No Data',
                  style: _style.purchaseCostTextStyle(),
                ),
              ],
            ),
          ),
          Text(
            _asset.manufacturer?.name ?? 'No Data',
            style: _style.titleTextStyle(),
          ),
          SizedBox(height: _style.whiteSpaceHeight()),
          Text(
            _asset.model?.name ?? 'No Data',
            style: _style.titleTextStyle(),
          ),
          // const Divider(),
          SizedBox(height: _style.whiteSpaceHeight()),
          // Text(_asset.category?.name ?? 'No Data'),
          // SizedBox(height: _style.whiteSpaceHeight()),
          // Text(_asset.purchaseCost ?? 'No Data'),
          // _tableWidget()
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Text(_asset.location?.name ?? 'No Data'),
          //       Text(_asset.purchaseCost ?? 'No Data'),
          //     ],
          //   ),
          // ),
          _customFields(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _tableContainer(
                          title: 'Category',
                          value: _asset.category?.name ?? 'No Data'),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: _tableContainer(
                          title: 'Location',
                          value: _asset.location?.name ?? 'No Data'),
                    )
                  ],
                ),
                SizedBox(height: _style.whiteSpaceHeight()),
                Row(
                  children: [
                    Expanded(
                      child: _tableContainer(
                          title: 'Supplier',
                          value: _asset.supplier?.name ?? 'No Data'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _customFields() {
    if (_asset.customFields?.ram != null) {
      return Column(
        children: [
          SizedBox(height: _style.whiteSpaceHeight()),
          Divider(
            color: _style.primaryColor(),
          ),
          _singleCustomField(
            title: 'RAM',
            value: _asset.customFields?.ram?.field ?? '',
          ),
          Divider(
            color: _style.primaryColor(),
          ),
          _singleCustomField(
            title: 'CPU',
            value: _asset.customFields?.cpu?.field ?? '',
          ),
          Divider(
            color: _style.primaryColor(),
          ),
          _singleCustomField(
            title: 'MAC Address',
            value: _asset.customFields?.macAddress?.field ?? '',
          ),
          Divider(
            color: _style.primaryColor(),
          ),
          SizedBox(height: _style.whiteSpaceHeight()),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _singleCustomField({required String title, required String value}) {
    if (_asset.customFields?.ram != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: _style.customFieldTitleTextStyle(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(value)],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _tableWidget() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            _tableRow(
                title: 'Category', value: _asset.category?.name ?? 'No Data'),
            SizedBox(height: _style.whiteSpaceHeight()),
            _tableRow(
                title: 'Purchase Cost',
                value: _asset.purchaseCost ?? 'No Data'),
          ],
        ),
      ),
    );
  }

  Widget _tableContainer({required String title, required String value}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: _style.primaryColor().withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Divider(color: Colors.black),
            Text(
              value,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tableRow({required String title, required String value}) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
