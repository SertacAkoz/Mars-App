import 'package:flutter/material.dart';

class Utils {
  Utils._();

  static void navigate({
    required String navigationPath,
    required BuildContext context,
    Object? argumenents,
  }) {
    Navigator.pushNamed(context, navigationPath, arguments: argumenents);
  }
}
