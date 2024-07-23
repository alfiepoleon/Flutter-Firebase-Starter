import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_flutter_starter/utils/common_libs.dart';

export 'colors.dart';

final $styles = AppStyle();

@immutable
class AppStyle {
  /// The current theme colors for the app
  final AppColors colors = AppColors();

  /// Text styles
  // ignore: library_private_types_in_public_api
  late final AppTextStyles text = AppTextStyles();
}

@immutable
class AppTextStyles {
  TextStyle get headlineFont => GoogleFonts.lato();

  TextStyle get titleFont => GoogleFonts.lato();

  TextStyle get contentFont => GoogleFonts.lato();

  TextStyle get labelFont => GoogleFonts.lato(fontWeight: FontWeight.bold);

  late final TextStyle h1 = headlineFont.copyWith(fontSize: dpiSizeCalculator(32), fontWeight: FontWeight.w600);
  late final TextStyle h2 = headlineFont.copyWith(fontSize: dpiSizeCalculator(28), fontWeight: FontWeight.w600);
  late final TextStyle h3 = headlineFont.copyWith(fontSize: dpiSizeCalculator(24), fontWeight: FontWeight.w500);

  late final TextStyle h4 = titleFont.copyWith(fontSize: dpiSizeCalculator(22), fontWeight: FontWeight.w700);
  late final TextStyle h5 = titleFont.copyWith(fontSize: dpiSizeCalculator(16), fontWeight: FontWeight.w600);
  late final TextStyle h6 = titleFont.copyWith(fontSize: dpiSizeCalculator(14), fontWeight: FontWeight.w600);

  late final TextStyle bodyLarge = contentFont.copyWith(fontSize: dpiSizeCalculator(16));
  late final TextStyle body = contentFont.copyWith(fontSize: dpiSizeCalculator(14));
  late final TextStyle bodySmall = contentFont.copyWith(fontSize: dpiSizeCalculator(12));

  late final TextStyle labelLarge = labelFont.copyWith(fontSize: dpiSizeCalculator(14));
  late final TextStyle label = labelFont.copyWith(fontSize: dpiSizeCalculator(12));
  late final TextStyle labelSmall = labelFont.copyWith(fontSize: dpiSizeCalculator(11));

  double dpiSizeCalculator(double size) {
    late double s2;
    double pixelRatio = WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
    switch (pixelRatio) {
      case < 2.4:
        s2 = size * 0.8;
        break;
      case > 2.4 && < 3.4:
        s2 = size;
        break;
      case > 3.4:
        s2 = size * 1.2;
        break;
      default:
    }
    return s2;
  }
}
