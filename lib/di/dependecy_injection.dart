import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mars_app/pages/asset_add_page/asset_add_repo.dart';
import 'package:mars_app/pages/asset_add_page/asset_add_style.dart';
import 'package:mars_app/pages/asset_detail_page/asset_detail_repo.dart';
import 'package:mars_app/pages/asset_detail_page/asset_detail_style.dart';
import 'package:mars_app/pages/favourite_page/favourite_repo.dart';
import 'package:mars_app/pages/favourite_page/favourite_style.dart';
import 'package:mars_app/pages/list_page/list_repo.dart';
import 'package:mars_app/pages/list_page/list_style.dart';
import 'package:mars_app/pages/not_found_page/not_found_style.dart';
import 'package:mars_app/services/rest_service.dart';

final getIt = GetIt.instance;

class DependecyInjection {
  static final instance = DependecyInjection._();

  DependecyInjection._() {
    _provideStyles();
    _provideServices();
    _provideRepositories();
    debugPrint('Constuctor Triggered');
  }

  void _provideStyles() {
    getIt.registerSingleton<ListStyle>(ListStyle());
    getIt.registerSingleton<AssetAddStyle>(AssetAddStyle());
    getIt.registerSingleton<AssetDetailStyle>(AssetDetailStyle());
    getIt.registerSingleton<NotFoundStyle>(NotFoundStyle());
    getIt.registerSingleton<FavouriteStyle>(FavouriteStyle());
  }

  void _provideServices() {
    getIt.registerSingleton<RestService>(RestService(Dio(BaseOptions(headers: {'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTU2MDc0MjVmYjM5YTEwYjFjNTZlZTAxMTBmZDk4ZjQ0ZjVjODMzYjcxZWVhYjZlNDk1NGMwOThlY2YzMzU2MDY4Mzg4MmFhMDMzOTAzNzciLCJpYXQiOjE2MzI4NjU5MTgsIm5iZiI6MTYzMjg2NTkxOCwiZXhwIjoyMjY0MDIxNTE4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.LgGVzyH67IRhXvccHd4j2Dn6TDuIuQTBoo30_wD9jPehy8v_h0xBmE1-dOUBRJyeJOI8B4gwPeALsWaudpGj9Lb5qWAtKV7eYtH9IYQKoLF_iHgOGXnAUcNwID6zBU_YyLNSI6gp8zjutLJias33CBLsHy5ZRNpxVibVrZouJ_HjYuIYbtZyLus-KFFeibtZoPiTWOeHhQFD37MR6ifx4dBqT37fN-xDS99mONtrkAplEIou5aSO1oZ4IlJIPCUyA1lixPgpn1YU7PxiBDZp1teeugD0WEmrAqxRS2I0bH4qPsuTsrVXS_lo87Sf5LBGLW7lGHKqyYH6J47OZOM0K-SrxLKtE1ww8jyLBgnnxH0lJHRLCBiwUnL5ZGTUmiOysUA-wSJ6s78o8Pc-ec6bpBvAlelHdiQ-wslE7gzEJDptbejFg-75b_CEwgJYh7J2D18ul6Qu5EFCUEgt033mm04dgVk0isWTDt6EW5ZvTo5Qhr1LY0YnEIXCTqIRN-BSQjL55sZaCrtwR_21bnBGgniyI5MRDYblFawVmFKroeClCpSjBo9vi66akdD5hjpvx67RL3r33BZQhEXmPifUPNH5wP_U-IHGFUD99TJk2c1awF0RASveZRLSunbJb1x6hGAVUaIvQV4r2quWzXqYyKLph9kGTyJYrb6iJtH5smE'}))));
  }

  void _provideRepositories() {
    getIt.registerSingleton<ListRepository>(ListRepository(service: getIt.get<RestService>()));
    getIt.registerSingleton<AssetAddRepository>(AssetAddRepository(service: getIt.get<RestService>()));
    getIt.registerSingleton<FavouriteRepository>(FavouriteRepository());
    getIt.registerSingleton<AssetDetailRepository>(AssetDetailRepository());
  }
}
