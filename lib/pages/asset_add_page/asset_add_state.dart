part of 'asset_add_cubit.dart';

@immutable
abstract class AssetAddState {}

class AssetAddInitial extends AssetAddState {}

class AssetAddLoading extends AssetAddState {}

class AssetAddSuccess extends AssetAddState {
  final Resource<LocationResponse> locations;
  final NativeSelectItem? selectValueLocation;
  final Resource<AssetAddResponse>? response;
  AssetAddSuccess({
    required this.locations,
    this.selectValueLocation,
    this.response,
  });
}

