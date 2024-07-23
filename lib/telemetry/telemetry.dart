import 'package:firebase_analytics/firebase_analytics.dart';

// Firebase analytics instance to be used all through the app
late FirebaseAnalytics firebaseAnalyticsInstance;

class AppTelemetry {
  static Future<void> logUserLogin(String loginMethod) {
    return FirebaseAnalytics.instance.logLogin(loginMethod: loginMethod);
  }

  static Future<void> logEvent(name, {Map<String, Object>? parameters, AnalyticsCallOptions? callOptions}) {
    return FirebaseAnalytics.instance.logEvent(name: name, parameters: parameters, callOptions: callOptions);
  }
}
