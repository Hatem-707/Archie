import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006a66),
      surfaceTint: Color(0xff006a66),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff92f9f3),
      onPrimaryContainer: Color(0xff007470),
      secondary: Color(0xff416562),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffc3eae7),
      onSecondaryContainer: Color(0xff476b68),
      tertiary: Color(0xff575e72),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffe0e7ff),
      onTertiaryContainer: Color(0xff60677b),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff6faf9),
      onSurface: Color(0xff171d1c),
      onSurfaceVariant: Color(0xff3d4948),
      outline: Color(0xff6d7978),
      outlineVariant: Color(0xffbcc9c7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3131),
      inversePrimary: Color(0xff70d7d1),
      primaryFixed: Color(0xff8df4ee),
      onPrimaryFixed: Color(0xff00201f),
      primaryFixedDim: Color(0xff70d7d1),
      onPrimaryFixedVariant: Color(0xff00504d),
      secondaryFixed: Color(0xffc3eae7),
      onSecondaryFixed: Color(0xff00201f),
      secondaryFixedDim: Color(0xffa8cecb),
      onSecondaryFixedVariant: Color(0xff294d4b),
      tertiaryFixed: Color(0xffdbe2fa),
      onTertiaryFixed: Color(0xff141b2c),
      tertiaryFixedDim: Color(0xffbfc6dd),
      onTertiaryFixedVariant: Color(0xff3f4759),
      surfaceDim: Color(0xffd6dbda),
      surfaceBright: Color(0xfff6faf9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f5f3),
      surfaceContainer: Color(0xffeaefed),
      surfaceContainerHigh: Color(0xffe4e9e8),
      surfaceContainerHighest: Color(0xffdfe3e2),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003d3b),
      surfaceTint: Color(0xff006a66),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff007a76),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff173c3a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4f7471),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2f3648),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff656d81),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff6faf9),
      onSurface: Color(0xff0d1212),
      onSurfaceVariant: Color(0xff2d3837),
      outline: Color(0xff495554),
      outlineVariant: Color(0xff636f6e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3131),
      inversePrimary: Color(0xff70d7d1),
      primaryFixed: Color(0xff007a76),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff005f5c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4f7471),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff375b59),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff656d81),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4d5568),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc3c7c6),
      surfaceBright: Color(0xfff6faf9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f5f3),
      surfaceContainer: Color(0xffe4e9e8),
      surfaceContainerHigh: Color(0xffd9dedc),
      surfaceContainerHighest: Color(0xffced3d1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003230),
      surfaceTint: Color(0xff006a66),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff005250),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff0a3230),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff2b4f4d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff242c3e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff42495c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff6faf9),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff232e2d),
      outlineVariant: Color(0xff404b4a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3131),
      inversePrimary: Color(0xff70d7d1),
      primaryFixed: Color(0xff005250),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003a37),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff2b4f4d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff123836),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff42495c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff2b3245),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb5bab9),
      surfaceBright: Color(0xfff6faf9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffedf2f0),
      surfaceContainer: Color(0xffdfe3e2),
      surfaceContainerHigh: Color(0xffd1d5d4),
      surfaceContainerHighest: Color(0xffc3c7c6),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xff70d7d1),
      onPrimary: Color(0xff003735),
      primaryContainer: Color(0xff8df4ee),
      onPrimaryContainer: Color(0xff00716d),
      secondary: Color(0xffa8cecb),
      onSecondary: Color(0xff103634),
      secondaryContainer: Color(0xff2b4f4d),
      onSecondaryContainer: Color(0xff9ac0bd),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff293042),
      tertiaryContainer: Color(0xffdbe2fa),
      onTertiaryContainer: Color(0xff5d6478),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0f1414),
      onSurface: Color(0xffdfe3e2),
      onSurfaceVariant: Color(0xffbcc9c7),
      outline: Color(0xff879392),
      outlineVariant: Color(0xff3d4948),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e2),
      inversePrimary: Color(0xff006a66),
      primaryFixed: Color(0xff8df4ee),
      onPrimaryFixed: Color(0xff00201f),
      primaryFixedDim: Color(0xff70d7d1),
      onPrimaryFixedVariant: Color(0xff00504d),
      secondaryFixed: Color(0xffc3eae7),
      onSecondaryFixed: Color(0xff00201f),
      secondaryFixedDim: Color(0xffa8cecb),
      onSecondaryFixedVariant: Color(0xff294d4b),
      tertiaryFixed: Color(0xffdbe2fa),
      onTertiaryFixed: Color(0xff141b2c),
      tertiaryFixedDim: Color(0xffbfc6dd),
      onTertiaryFixedVariant: Color(0xff3f4759),
      surfaceDim: Color(0xff0f1414),
      surfaceBright: Color(0xff353a3a),
      surfaceContainerLowest: Color(0xff0a0f0f),
      surfaceContainerLow: Color(0xff171d1c),
      surfaceContainer: Color(0xff1b2120),
      surfaceContainerHigh: Color(0xff262b2a),
      surfaceContainerHighest: Color(0xff313635),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xff70d7d1),
      onPrimary: Color(0xff003735),
      primaryContainer: Color(0xff8df4ee),
      onPrimaryContainer: Color(0xff00514e),
      secondary: Color(0xffbde4e1),
      onSecondary: Color(0xff022b29),
      secondaryContainer: Color(0xff739895),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff293042),
      tertiaryContainer: Color(0xffdbe2fa),
      onTertiaryContainer: Color(0xff40485b),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f1414),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd2dfdd),
      outline: Color(0xffa8b4b3),
      outlineVariant: Color(0xff869391),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e2),
      inversePrimary: Color(0xff00514e),
      primaryFixed: Color(0xff8df4ee),
      onPrimaryFixed: Color(0xff001413),
      primaryFixedDim: Color(0xff70d7d1),
      onPrimaryFixedVariant: Color(0xff003d3b),
      secondaryFixed: Color(0xffc3eae7),
      onSecondaryFixed: Color(0xff001413),
      secondaryFixedDim: Color(0xffa8cecb),
      onSecondaryFixedVariant: Color(0xff173c3a),
      tertiaryFixed: Color(0xffdbe2fa),
      onTertiaryFixed: Color(0xff091121),
      tertiaryFixedDim: Color(0xffbfc6dd),
      onTertiaryFixedVariant: Color(0xff2f3648),
      surfaceDim: Color(0xff0f1414),
      surfaceBright: Color(0xff404545),
      surfaceContainerLowest: Color(0xff040808),
      surfaceContainerLow: Color(0xff191f1e),
      surfaceContainer: Color(0xff242928),
      surfaceContainerHigh: Color(0xff2e3433),
      surfaceContainerHighest: Color(0xff393f3e),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xff70d7d1),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff8df4ee),
      onPrimaryContainer: Color(0xff00302e),
      secondary: Color(0xffd1f8f4),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffa4cac7),
      onSecondaryContainer: Color(0xff000e0d),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffdbe2fa),
      onTertiaryContainer: Color(0xff222a3b),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0f1414),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe6f3f1),
      outlineVariant: Color(0xffb9c5c3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e2),
      inversePrimary: Color(0xff00514e),
      primaryFixed: Color(0xff8df4ee),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff70d7d1),
      onPrimaryFixedVariant: Color(0xff001413),
      secondaryFixed: Color(0xffc3eae7),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffa8cecb),
      onSecondaryFixedVariant: Color(0xff001413),
      tertiaryFixed: Color(0xffdbe2fa),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffbfc6dd),
      onTertiaryFixedVariant: Color(0xff091121),
      surfaceDim: Color(0xff0f1414),
      surfaceBright: Color(0xff4c5150),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1b2120),
      surfaceContainer: Color(0xff2c3131),
      surfaceContainerHigh: Color(0xff373c3c),
      surfaceContainerHighest: Color(0xff434847),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
