import 'package:flutter/material.dart';

class Utils {
  Utils._();

  static void navigate({
    required String navigationPath,
    required BuildContext context,
    Object? argumenents,
  }) {
    if (ModalRoute.of(context)?.settings.name != navigationPath) {
      debugPrint('IFIFIFIFIFIFIFIFIF');
      Navigator.pushNamed(context, navigationPath, arguments: argumenents);
    }
  }

  static String getCityNameFromLabel(String label) {
    return label.split(' ')[0];
  }
}
