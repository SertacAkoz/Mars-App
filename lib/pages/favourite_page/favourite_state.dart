part of 'favourite_cubit.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteSuccess extends FavouriteState {
  final List<Asset>? favouriteList;

  FavouriteSuccess({
    required this.favouriteList,
  });
}

class FavouriteError extends FavouriteState {
  final String message;

  FavouriteError({
    required this.message,
  });
}
