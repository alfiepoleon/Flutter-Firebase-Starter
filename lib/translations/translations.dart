import 'package:get/get.dart';
import 'package:firebase_flutter_starter/translations/en.dart';
import 'package:firebase_flutter_starter/translations/es.dart';
import 'package:firebase_flutter_starter/translations/fr.dart';
import 'package:firebase_flutter_starter/translations/sw.dart';

class TranslationStrings extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enTranslations,
        'es_ES': esTranslations,
        'fr_FR': frTranslations,
        'sw_KE': swTranslations,
      };
}
