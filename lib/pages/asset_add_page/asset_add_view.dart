// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_app/models/dto/asset_add_dto.dart';

import 'package:mars_app/pages/asset_add_page/asset_add_cubit.dart';
import 'package:mars_app/pages/asset_add_page/asset_add_style.dart';
import 'package:mars_app/utils/resource.dart';
import 'package:mars_app/utils/utils.dart';
import 'package:mars_app/widgets/custom_header.dart';
import 'package:mars_app/widgets/loading_widget.dart';

class AssetAddView extends StatelessWidget {
  AssetAddStyle _style;
  AssetAddCubit _viewModel;
  AssetAddView({
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
        padding: const EdgeInsets.fromLTRB(0.0, 63.0, 0.0, 0.0),
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
        InkWell(
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
        ),
        const SizedBox(height: 50),
        TextFormField(
          controller: _viewModel.nameTextController,
          decoration: const InputDecoration(
            icon: Icon(Icons.favorite),
            labelText: 'Asset Name',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: _style.whiteSpaceHeight()),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: _viewModel.purchaseTextController,
          decoration: const InputDecoration(
            icon: Icon(Icons.favorite),
            labelText: 'Asset PurchaseCost',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: _style.whiteSpaceHeight()),
        ElevatedButton(
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
        ),
        SizedBox(height: _style.whiteSpaceHeight()),
        _postWidgets(state),
      ],
    );
  }
}

Widget _postWidgets(AssetAddSuccess state) {
  // debugPrint('Deneme : ${state.response?.data?.messages}');
  if (state.response?.status == Status.ERROR ) {
    return Column(
      children: [
        Text(state.response?.message ?? 'Something went wrong!', textAlign: TextAlign.center,),
      ],
    );
  } else {
    return Column(
      children: [
        Text(state.response?.data?.messages ?? '', textAlign: TextAlign.center,),
      ],
    );
  }

  // return Column(
  //     children: [
  //       Text(state.response?.data?.messages ?? ''),
  //     ],
  //   );
}
