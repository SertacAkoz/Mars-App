// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_app/helpers/toast_controller.dart';

import 'package:mars_app/models/asset.dart';
import 'package:mars_app/pages/asset_detail_page/asset_detail_cubit.dart';
import 'package:mars_app/pages/asset_detail_page/asset_detail_style.dart';
import 'package:mars_app/pages/asset_detail_page/components/asset_detail_table.dart';
import 'package:mars_app/widgets/box.dart';

class AssetDetailView extends StatelessWidget {
  final AssetDetailStyle _style;
  final AssetDetailCubit _viewModel;
  final Asset _asset;
  const AssetDetailView({
    Key? key,
    required AssetDetailStyle style,
    required AssetDetailCubit viewModel,
    required Asset asset,
  })  : _style = style,
        _asset = asset,
        _viewModel = viewModel,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel,
      child: _buildScaffold(),
    );
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _style.primaryColor(),
        title: const Text('Asset Detail'),
      ),
      // body: _buildBody(),
      body: BlocConsumer<AssetDetailCubit, AssetDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _buildBody(context);
        },
      ),
    );
  }

  Column _buildBody(BuildContext context) {
    return Column(
      children: [
        _imageWidget(context),
        // const Divider(),
        _costWidget(),
        _titleWidget(),
        const Box(size: BoxSize.SMALL, type: BoxType.VERTICAL),
        _subTitleWidget(),
        // const Divider(),
        const Box(size: BoxSize.SMALL, type: BoxType.VERTICAL),
        // Text(_asset.category?.name ?? 'No Data'),
        // const Box(size: BoxSize.SMALL, type: BoxType.VERTICAL),
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
        AssetDetailTable(style: _style, asset: _asset),
      ],
    );
  }

  Text _subTitleWidget() {
    return Text(
      _asset.model?.name ?? 'No Data',
      style: _style.titleTextStyle(),
    );
  }

  Text _titleWidget() {
    return Text(
      _asset.manufacturer?.name ?? 'No Data',
      style: _style.titleTextStyle(),
    );
  }

  Padding _costWidget() {
    return Padding(
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
    );
  }

  Hero _imageWidget(BuildContext context) {
    return Hero(
      tag: _asset.id!,
      child: Stack(
        children: [
          Padding(
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
          Positioned(
            bottom: 20,
            right: 20,
            child: Material(
              child: IconButton(
                onPressed: () async {
                  debugPrint('Favourites Clicked');
                  final result = await _viewModel.addToFavourite(_asset);
                  if (context.mounted) {
                    if (result) {
                      ToastController.showSuccess(
                        context: context,
                        value: 'Asset Added to Favourite',
                      );
                    } else {
                      ToastController.showError(
                        context: context,
                        value: 'Something went wrong!',
                      );
                    }
                  }
                },
                icon: const Icon(
                  Icons.favorite_rounded,
                  size: 50,
                  color: Colors.red,
                ),
              ),
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
          const Box(size: BoxSize.SMALL, type: BoxType.VERTICAL),
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
          const Box(size: BoxSize.SMALL, type: BoxType.VERTICAL),
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

  // Widget _tableContainer({required String title, required String value}) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: const BorderRadius.all(
  //         Radius.circular(10),
  //       ),
  //       color: _style.primaryColor().withOpacity(0.2),
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsets.all(10.0),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             title,
  //             style: const TextStyle(
  //               fontWeight: FontWeight.bold,
  //               color: Colors.black,
  //             ),
  //           ),
  //           const Divider(color: Colors.black),
  //           Text(
  //             value,
  //             style: const TextStyle(color: Colors.black),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
