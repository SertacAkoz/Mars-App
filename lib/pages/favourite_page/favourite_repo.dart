import 'package:mars_app/inheritance/local_storage_mixin.dart';
import 'package:mars_app/models/asset.dart';
import 'package:mars_app/utils/resource.dart';

class FavouriteRepository with LocalStorageMixin {
  Future<bool> deleteAssetFromLocalStorage(Asset asset) async {
    final localList = await getFavourites();

    if (localList.status == Status.SUCCESS) {
      if (localList.data != null) {
        localList.data!.removeWhere((element) => element.id == asset.id);
        await saveFavouriteList(assetList: localList.data!);
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
