import 'dart:developer';

import 'package:flutter/foundation.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

class Log {
  static printDebug(String s) {
    debugPrint(s);
  }

  static printLog(String s) {
    if (kDebugMode) {
      log(s);
    }
  }

  static printError(String s, {bool throwError = false, Error? error}) async {
    if (kDebugMode) {
      log(s, error: error);
    }
    if (throwError && error != null) {
      // await Sentry.captureException(
      //   error,
      //   stackTrace: error.stackTrace,
      // );
      throw error;
    }
  }

  static printException(String s, {bool throwError = false, Object? exception, StackTrace? stackTrace}) async {
    if (kDebugMode) {
      log(s, error: s);
    }
    if (throwError && exception != null && stackTrace != null) {
      // await Sentry.captureException(
      //   exception,
      //   stackTrace: stackTrace,
      // );
      if (kDebugMode) {
        print(exception);
        print(stackTrace);
      }
    }
  }

  static throwError(String s, [Exception? err]) {
    if (kDebugMode) {
      log(s, error: s);
    } else {
      printDebug(s);
      printDebug(err.toString());
    }

    if (err != null) {
      throw err;
    } else {
      throw Exception(s);
    }
  }
}
