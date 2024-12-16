import 'package:ecommerce_app/core/routes_manager/route_generator.dart';
import 'package:flutter/material.dart';

class UIUtils {
  static void showLoadingDialog() {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierColor: Colors.black.withOpacity(.1),
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          onPopInvokedWithResult: (didPop, result) => false,
          child: Dialog(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void hideDialog() {
    Navigator.of(navigatorKey.currentContext!, rootNavigator: true).pop();
  }

  static void showErrorDialog(String message) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return PopScope(
          onPopInvokedWithResult: (didPop, result) async => false,
          child: Dialog(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 50,
                    color: Colors.red,
                  ),
                  Text(message)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // static void showToastMessage(String message) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM,
  //     backgroundColor: Colors.black87,
  //     textColor: Colors.white,
  //     fontSize: 16.0,
  //   );
  // }
}
