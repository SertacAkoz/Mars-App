// ignore_for_file: must_be_immutable

part of 'list_cubit.dart';

@immutable
abstract class ListState {}

class ListInitial extends ListState {}

class ListSuccess extends ListState {
  Resource<AssetListResponse> assets;
  Resource<CategoryResponse> categories;
  Resource<LocationResponse> locations;
  Resource<CompanyResponse> companies;
  Resource<ModelResponse> models;
  bool isExpandedFilter;

  NativeSelectItem? selectValueLocation;
  NativeSelectItem? selectValueCategory;
  NativeSelectItem? selectValueCompany;
  NativeSelectItem? selectValueModels;
  
  ListSuccess({
    required this.assets,
    required this.categories,
    required this.locations,
    required this.companies,
    required this.models,
    this.selectValueLocation,
    this.selectValueCategory,
    this.selectValueCompany,
    this.selectValueModels,
    bool? isExpandedFilterValue,
  }) : isExpandedFilter = isExpandedFilterValue ?? false;
}

class ListLoading extends ListState {}

class ListError extends ListState {
  final String errorMessage;
  ListError({
    required this.errorMessage,
  });
}
