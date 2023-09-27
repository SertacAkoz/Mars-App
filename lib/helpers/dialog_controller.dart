import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class DialogController {
  DialogController._();

  static void showSuccessDialog({
    required BuildContext context,
    required String title,
  }) async{
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: title,
      confirmBtnText: 'Okay',
    );
  }

  static void showErrorDialog({
    required BuildContext context,
    required String title,
    required String text,
  }) async{
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: title,
      text: text,
      confirmBtnText: 'Okay',
    );
  }

  static void showWarningDialog({
    required BuildContext context,
    required String text,
  }) async{
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      title: 'Warning',
      text: text,
      confirmBtnText: 'Okay',
    );
  }

  static void showQuestionDialog({
    required BuildContext context,
    required String question,
    required Function() callback,
  }) async{
    await QuickAlert.show(
      title: 'Are you sure?',
      context: context,
      type: QuickAlertType.confirm,
      text: question,
      confirmBtnText: 'Confirm',
      cancelBtnText: 'Declaine',
      onConfirmBtnTap: () {
        callback();
      },
    );
  }
}