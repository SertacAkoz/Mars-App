import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_app/helpers/dialog_controller.dart';
import 'package:mars_app/helpers/toast_controller.dart';
import 'package:mars_app/pages/favourite_page/components/favourite_item.dart';

import 'package:mars_app/pages/favourite_page/favourite_cubit.dart';
import 'package:mars_app/pages/favourite_page/favourite_style.dart';
import 'package:mars_app/widgets/custom_header.dart';
import 'package:mars_app/widgets/loading_widget.dart';

class FavouriteView extends StatelessWidget {
  final FavouriteCubit _viewModel;
  final FavouriteStyle _style;
  const FavouriteView({
    Key? key,
    required FavouriteCubit viewModel,
    required FavouriteStyle style,
  })  : _viewModel = viewModel,
        _style = style,
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
              title: 'Favourites',
              textstyle: _style.headerTextStyle(),
              backgroundColor: _style.primaryColor(),
            ),
            BlocConsumer<FavouriteCubit, FavouriteState>(
              listener: (context, state) {},
              builder: (context, state) {
                debugPrint(state.toString());
                if (state is FavouriteInitial) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _viewModel.getFavourites();
                  });
                  return _buildLoading();
                } else if (state is FavouriteLoading) {
                  return _buildLoading();
                } else if (state is FavouriteSuccess) {
                  return _buildSuccess(state);
                  // return Text('Success');
                } else {
                  final result = state as FavouriteError;
                  return Text('Error');
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSuccess(FavouriteSuccess state) {
    debugPrint(state.favouriteList?.length.toString());
    if (state.favouriteList == null) {
      return Container();
    } else {
      return Expanded(
        child: ListView.builder(
          itemCount: state.favouriteList?.length,
          itemBuilder: (BuildContext context, int index) {
            return FavouriteItem(
              asset: state.favouriteList![index],
              onDelete: (asset) async {
                debugPrint('Delete Clicked');
                DialogController.showQuestionDialog(
                  context: context,
                  question: 'Delete?',
                  callback: () async {
                    _viewModel.deleteAsset(asset);
                    Navigator.of(context).pop();
                    ToastController.showSuccess(context: context, value: 'Deleted');
                  },
                );
                // _viewModel.emitError();
              },
            );
          },
        ),
      );
    }
  }

  Widget _buildLoading() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [LoadingWidget()],
      ),
    );
  }
}
