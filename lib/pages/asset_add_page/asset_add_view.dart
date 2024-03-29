// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_app/models/dto/asset_add_dto.dart';

import 'package:mars_app/pages/asset_add_page/asset_add_cubit.dart';
import 'package:mars_app/pages/asset_add_page/asset_add_style.dart';
import 'package:mars_app/utils/resource.dart';
import 'package:mars_app/utils/utils.dart';
import 'package:mars_app/widgets/box.dart';
import 'package:mars_app/widgets/custom_header.dart';
import 'package:mars_app/widgets/loading_widget.dart';

class AssetAddView extends StatelessWidget {
  final AssetAddStyle _style;
  final AssetAddCubit _viewModel;
  const AssetAddView({
    Key? key,
    required AssetAddStyle style,
    required AssetAddCubit viewModel,
  })  : _style = style,
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
      body: Padding(
        padding: _style.headerPadding(),
        child: Column(
          children: [
            CustomHeaderWidget(
              title: 'Add Asset',
              textstyle: _style.headerTextStyle(),
              backgroundColor: _style.primaryColor(),
            ),
            BlocConsumer<AssetAddCubit, AssetAddState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is AssetAddInitial) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _viewModel.getLocations();
                  });
                  return _buildLoading();
                } else if (state is AssetAddSuccess) {
                  return _buildSuccess(state, context);
                } else {
                  return _buildLoading();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Expanded _buildLoading() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [LoadingWidget()],
          )
        ],
      ),
    );
  }

  Column _buildSuccess(AssetAddSuccess state, BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        _locationWidget(state),
        const SizedBox(height: 50),
        _inputName(),
        const Box(size: BoxSize.SMALL, type: BoxType.VERTICAL),
        _inputPurchase(),
        const Box(size: BoxSize.SMALL, type: BoxType.VERTICAL),
        _buttonAdd(state, context),
        const Box(size: BoxSize.SMALL, type: BoxType.VERTICAL),
        _postWidgets(state),
      ],
    );
  }

  ElevatedButton _buttonAdd(AssetAddSuccess state, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_viewModel.checkForm()) {
          try {
            AssetAddDto dto = AssetAddDto(
              model_id: '2',
              status_id: 1,
              asset_tag: _viewModel.getRandomString(),
              name: _viewModel.nameTextController.text,
              purchase_cost:
                  double.parse(_viewModel.purchaseTextController.text),
              location_id: int.parse(state.selectValueLocation!.value),
            );
            // debugPrint('View DTO : ${dto.status_id}');
            _viewModel.addAsset(dto);
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Please fill out the form completely'),
            ));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Please fill out the form completely'),
          ));
        }
      },
      child: const Text('Add Asset'),
    );
  }

  TextFormField _inputPurchase() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: _viewModel.purchaseTextController,
      decoration: const InputDecoration(
        icon: Icon(Icons.favorite),
        labelText: 'Asset PurchaseCost',
        border: OutlineInputBorder(),
      ),
    );
  }

  TextFormField _inputName() {
    return TextFormField(
      controller: _viewModel.nameTextController,
      decoration: const InputDecoration(
        icon: Icon(Icons.favorite),
        labelText: 'Asset Name',
        border: OutlineInputBorder(),
      ),
    );
  }

  InkWell _locationWidget(AssetAddSuccess state) {
    return InkWell(
      onTap: () {
        _viewModel.showLocationSelectBox();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Location'),
                Text(
                  Utils.getCityNameFromLabel(
                      state.selectValueLocation?.label ?? '...'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

Widget _postWidgets(AssetAddSuccess state) {
  // debugPrint('Deneme : ${state.response?.data?.messages}');
  if (state.response?.status == Status.ERROR) {
    return Column(
      children: [
        Text(
          state.response?.message ?? 'Something went wrong!',
          textAlign: TextAlign.center,
        ),
      ],
    );
  } else {
    return Column(
      children: [
        Text(
          state.response?.data?.messages ?? '',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // return Column(
  //     children: [
  //       Text(state.response?.data?.messages ?? ''),
  //     ],
  //   );
}
