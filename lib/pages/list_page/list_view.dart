// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_app/models/asset.dart';

import 'package:mars_app/pages/list_page/list_cubit.dart';
import 'package:mars_app/pages/list_page/list_style.dart';
import 'package:mars_app/utils/utils.dart';
import 'package:mars_app/widgets/custom_header.dart';
import 'package:mars_app/widgets/loading_widget.dart';

class AssetListView extends StatelessWidget {
  final ListStyle _style;
  final ListCubit _viewModel;
  const AssetListView({
    Key? key,
    required ListStyle style,
    required ListCubit viewModel,
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
      body: RefreshIndicator(
        onRefresh: () async {
          _viewModel.getAllDatas();
        },
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 63.0, 0.0, 0.0),
            child: Column(
              children: [
                CustomHeaderWidget(
                  title: 'Assets',
                  textstyle: _style.headerTextStyle(),
                  backgroundColor: _style.primaryColor(),
                ),
                Expanded(
                  child: BlocConsumer<ListCubit, ListState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is ListInitial) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          // _viewModel.getAssetList(limit: '10');
                          // _viewModel.getLocations();
                          _viewModel.getAllDatas();
                        });

                        return const LoadingWidget();
                      } else if (state is ListSuccess) {
                        return _buildSuccess(state, context);
                      } else {
                        return const LoadingWidget();
                      }
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget _buildSuccess(ListSuccess state, BuildContext context) {
    return Column(
      children: [
        _filterWidget(state, context),
        Expanded(child: _assetsGridView(state)),
      ],
    );
  }

  ExpansionTile _filterWidget(ListSuccess state, BuildContext context) {
    return ExpansionTile(
      leading: Icon(
        Icons.search_rounded,
        color: state.isExpandedFilter ? _style.primaryColor() : Colors.black,
      ),
      title: Text(
        'Filter',
        style: TextStyle(
          color: state.isExpandedFilter ? _style.primaryColor() : Colors.black,
        ),
      ),
      children: <Widget>[
        InkWell(
          onTap: () {
            _viewModel.showLocationSelectBox();
          },
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: _style.filterRowPadding()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Location'),
                Text(
                  _viewModel.getCityNameFromLabel(
                      state.selectValueLocation?.label ?? '...'),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: _style.filterWhitespaceHeight()),
        InkWell(
          onTap: () {
            _viewModel.showCompanySelectBox();
          },
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: _style.filterRowPadding()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Company'),
                Text(state.selectValueCompany?.label ?? '...'),
              ],
            ),
          ),
        ),
        SizedBox(height: _style.filterWhitespaceHeight()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _style.filterRowPadding()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Category'),
              Text('...'),
            ],
          ),
        ),
        SizedBox(height: _style.filterWhitespaceHeight()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: _style.primaryColor()),
              onPressed: () {
                _viewModel.searchList();
              },
              child: const Icon(Icons.search_rounded),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: _style.primaryColor()),
              onPressed: () {
                // _viewModel.getAllDatas();
                _viewModel.clearFilterDatas();
              },
              child: const Icon(Icons.clear_rounded),
            ),
          ],
        ),
      ],
      onExpansionChanged: (bool expanding) =>
          _viewModel.toggleFilter(expanding),
    );
  }

  Widget _assetsGridView(ListSuccess state) {
    if (state.assets.data!.rows!.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.warning_rounded, color: _style.primaryColor(), size: 45,)],
            ),
            SizedBox(height: _style.errorWhitespaceHeight()),
            const Text(
              'No products were found matching your search criteria. Please refresh the page to see all products.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: _style.errorWhitespaceHeight()),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: _style.primaryColor()),
              onPressed: () {
                _viewModel.getAllDatas();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Refresh'),
                  SizedBox(width: _style.errorWhitespaceHeight()),
                  const Icon(Icons.refresh_rounded),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 30,
            mainAxisExtent: 300,
          ),
          itemCount: state.assets.data?.rows?.length,
          itemBuilder: (BuildContext context, int index) {
            return _assetGridViewRow(state.assets.data!.rows![index], context);
          },
        ),
      );
    }
  }

  Widget expandedListTileItem(Text title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ListTile(
        title: title,
        leading: const SizedBox(
          height: 50,
          child: Icon(Icons.scatter_plot, size: 15),
        ),
      ),
    );
  }

  InkWell _assetGridViewRow(Asset asset, BuildContext context) {
    return InkWell(
      onTap: () {
        Utils.navigate(navigationPath: '/assetDetail', context: context, argumenents: asset);
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 8,
          right: 8,
        ),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Image.network(
            //     asset.image!,
            //   ),
            // ),
            Hero(
              tag: asset.id!,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: CachedNetworkImage(
                    imageUrl: asset.image!,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            const Divider(height: 0),
            Text(asset.manufacturer?.name ?? 'No Data'),
            Text(asset.category?.name ?? 'No Data'),
            Text(asset.model?.name ?? 'No Data'),
            Text(asset.location?.name ?? 'No Data'),
            Text(asset.purchaseCost ?? 'No Data'),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );

    // return Container(
    //   decoration: BoxDecoration(
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.grey.withOpacity(0.5),
    //         spreadRadius: 5,
    //         blurRadius: 7,
    //         offset: Offset(0, 3), // changes position of shadow
    //       ),
    //     ],

    //     // color: _style.primaryColor(),
    //     // border: Border.all(width: 1.0),
    //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //   ),
    //   child: Column(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.all(20.0),
    //         child: Image.network(
    //           asset.image!,
    //         ),
    //       ),
    //       Text(asset.model?.name ?? 'null'),
    //       Text(asset.model?.name ?? 'null'),
    //       Text(asset.model?.name ?? 'null'),
    //       Text(asset.model?.name ?? 'null'),
    //     ],
    //   ),
    // );
  }

  Widget _assetListView(ListSuccess state) {
    debugPrint('Deneme : ${state.assets.data?.rows?.length}');
    return Expanded(
      child: ListView.builder(
        itemCount: state.assets.data?.rows?.length,
        itemBuilder: (BuildContext context, int index) {
          return _assetRow(state.assets.data!.rows![index]);
        },
      ),
    );
  }

  Widget _assetRow(Asset asset) {
    // return Row(
    //   children: [],
    // );
    return Text(asset.model?.name ?? 'null');
  }
}
