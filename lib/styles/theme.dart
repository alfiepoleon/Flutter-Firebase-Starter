import 'package:firebase_flutter_starter/utils/common_libs.dart';

ThemeData customTheme = ThemeData(
  useMaterial3: true, // Enable Material 3

  colorScheme: ColorScheme.fromSeed(
    seedColor: $styles.colors.blue,
    brightness: Brightness.light,
  ),

  textTheme: _buildTextTheme($styles.text),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: $styles.colors.black,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: $styles.colors.blue,
      foregroundColor: $styles.colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: $styles.colors.blue,
    ),
  ),
);

TextTheme _buildTextTheme(AppTextStyles textStyles) {
  return TextTheme(
    headlineLarge: textStyles.h1,
    headlineMedium: textStyles.h2,
    headlineSmall: textStyles.h3,
    titleLarge: textStyles.h4,
    titleMedium: textStyles.h5,
    titleSmall: textStyles.h6,
    bodyLarge: textStyles.bodyLarge,
    bodyMedium: textStyles.body,
    bodySmall: textStyles.bodySmall,
    labelLarge: textStyles.labelLarge,
    labelMedium: textStyles.label,
    labelSmall: textStyles.labelSmall,
  );
}
