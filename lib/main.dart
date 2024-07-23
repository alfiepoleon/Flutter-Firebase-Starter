import 'dart:isolate';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:firebase_flutter_starter/firebase_options.dart';
import 'package:firebase_flutter_starter/router/router.dart';
import 'package:firebase_flutter_starter/styles/theme.dart';
import 'package:firebase_flutter_starter/translations/translations.dart';
import 'package:firebase_flutter_starter/utils/common_libs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    Log.printException(
      "Caught error: $error",
      throwError: true,
      stackTrace: stack,
    ); // Or use your preferred logging mechanism
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: false, printDetails: true);
    return true;
  };

  // Capture errors outside Flutter
  Isolate.current.addErrorListener(RawReceivePort((pair) async {
    final List<dynamic> errorAndStacktrace = pair;
    await FirebaseCrashlytics.instance.recordError(
      errorAndStacktrace.first,
      errorAndStacktrace.last,
      printDetails: true,
      fatal: true,
    );
  }).sendPort);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MojaTeam',
      theme: customTheme,
      translations: TranslationStrings(),
      locale: Get.locale ?? Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      getPages: AppRouter.pages,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('fr', 'FR'),
        Locale('sw', 'KE'),
      ],
    );
  }
}
