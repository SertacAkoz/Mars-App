import 'package:mars_app/inheritance/asset_add_mixin.dart';
import 'package:mars_app/network/rest_service.dart';

class AssetAddRepository with AssetAddMixin {
  final RestService _service;
  AssetAddRepository({
    required RestService service,
  }) : _service = service;
}
