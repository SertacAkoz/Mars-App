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
  bool isExpandedFilter;

  NativeSelectItem? selectValueLocation;
  NativeSelectItem? selectValueCategory;
  NativeSelectItem? selectValueCompany;
  
  ListSuccess({
    required this.assets,
    required this.categories,
    required this.locations,
    required this.companies,
    this.selectValueLocation,
    this.selectValueCategory,
    this.selectValueCompany,
    bool? isExpandedFilterValue,
  }) : isExpandedFilter = isExpandedFilterValue ?? false;
}

class ListLoading extends ListState {}

class ListError extends ListState {}
