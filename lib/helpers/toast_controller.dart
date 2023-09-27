import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ToastController {
  ToastController._();

  static const Duration _displayDuration = Duration(seconds: 1);
  static const Duration _displayDurationError = Duration(seconds: 3);

  static void showSuccess(
      {required BuildContext context, required String value}) {
    showTopSnackBar(
      displayDuration: _displayDuration,
      Overlay.of(context),
      CustomSnackBar.success(
        message: value,
      ),
    );
  }

  static void showError(
      {required BuildContext context, required String value}) {
    showTopSnackBar(
      displayDuration: _displayDurationError,
      Overlay.of(context),
      CustomSnackBar.error(
        message: value,
      ),
    );
  }

  static void showInfo({required BuildContext context, required String value}) {
    showTopSnackBar(
      displayDuration: _displayDuration,
      Overlay.of(context),
      CustomSnackBar.info(
        message: value,
      ),
    );
  }
}