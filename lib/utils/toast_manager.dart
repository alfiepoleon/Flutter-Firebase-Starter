import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType { error, success, info }

class ToastManager {
  static final Map<ToastType, Color> _toastColors = {
    ToastType.error: Colors.red.shade900,
    ToastType.success: Colors.green.shade700,
    ToastType.info: Colors.blueGrey, // Use a standard blue-gray for info
  };

  static void show({required ToastType type, required String message, Color? textColor}) {
    textColor ??= Colors.white; // Default text color is white

    Fluttertoast.cancel();

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: _toastColors[type],
      textColor: textColor,
      fontSize: 14.0,
    );
  }

  // Convenience methods
  static void error(String message, {Color? textColor}) =>
      show(type: ToastType.error, message: message, textColor: textColor);
  static void success(String message, {Color? textColor}) =>
      show(type: ToastType.success, message: message, textColor: textColor);
  static void info(String message, {Color? textColor}) =>
      show(type: ToastType.info, message: message, textColor: textColor);
}
