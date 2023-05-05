import 'package:flutter/cupertino.dart';
import 'package:mars_app/di/dependecy_injection.dart';
import 'package:mars_app/models/asset.dart';
import 'package:mars_app/pages/asset_add_page/asset_add_cubit.dart';
import 'package:mars_app/pages/asset_add_page/asset_add_repo.dart';
import 'package:mars_app/pages/asset_add_page/asset_add_style.dart';
import 'package:mars_app/pages/asset_add_page/asset_add_view.dart';
import 'package:mars_app/pages/asset_detail_page/asset_detail_style.dart';
import 'package:mars_app/pages/asset_detail_page/asset_detail_view.dart';
import 'package:mars_app/pages/list_page/list_cubit.dart';
import 'package:mars_app/pages/list_page/list_repo.dart';
import 'package:mars_app/pages/list_page/list_style.dart';
import 'package:mars_app/pages/list_page/list_view.dart';
import 'package:mars_app/pages/not_found_page/not_found_style.dart';
import 'package:mars_app/pages/not_found_page/not_found_view.dart';
import 'package:mars_app/widgets/drawer.dart';


class RouteGenerator {
  static Route<dynamic>? _routeOlustur(
    Widget gidilecekWidget,
    RouteSettings settings,
  ) {
    return CupertinoPageRoute(settings: settings, builder: (context) => gidilecekWidget);
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/assetList':
        return _routeOlustur(AppDrawer(style: getIt.get<ListStyle>(),child: AssetListView(style: getIt.get<ListStyle>(), viewModel: ListCubit(repo: getIt.get<ListRepository>())),), settings);
      case '/assetDetail':
        return _routeOlustur(AssetDetailView(style: getIt.get<AssetDetailStyle>(), asset: settings.arguments as Asset), settings);
      case '/assetAdd':
        return _routeOlustur(AppDrawer(style: getIt.get<AssetAddStyle>(), child: AssetAddView(style: getIt.get<AssetAddStyle>(), viewModel: AssetAddCubit(repo: getIt.get<AssetAddRepository>()))), settings);
      default:
        return _routeOlustur(NotFoundView(style: getIt.get<NotFoundStyle>()), settings);
    }
  }
}
