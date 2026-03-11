
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../reusable widget/loading_dialog.dart';
import '../reusable widget/message_dialog.dart';

class DialogUtils {
  static void showLoadingDialog({required BuildContext context}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => LoadingDialog(),
    );
  }

  static void showMessageDialog({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => MessageDialog(message: message),
    );
  }

  static void showToast({
    required BuildContext context,
    required String message,
    required Color color,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}