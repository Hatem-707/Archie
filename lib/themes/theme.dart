import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff495d8e),
      surfaceTint: Color(0xff495d8e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9cb0e6),
      onPrimaryContainer: Color(0xff2e4271),
      secondary: Color(0xff575e73),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdbe2fb),
      onSecondaryContainer: Color(0xff5d6479),
      tertiary: Color(0xff7c4f7b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffd5a0d1),
      onTertiaryContainer: Color(0xff5e345e),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffaf8fd),
      onSurface: Color(0xff1b1b1f),
      onSurfaceVariant: Color(0xff44464f),
      outline: Color(0xff757780),
      outlineVariant: Color(0xffc5c6d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303034),
      inversePrimary: Color(0xffb1c6fd),
      primaryFixed: Color(0xffd9e2ff),
      onPrimaryFixed: Color(0xff001946),
      primaryFixedDim: Color(0xffb1c6fd),
      onPrimaryFixedVariant: Color(0xff314575),
      secondaryFixed: Color(0xffdbe2fb),
      onSecondaryFixed: Color(0xff141b2d),
      secondaryFixedDim: Color(0xffbfc6de),
      onSecondaryFixedVariant: Color(0xff3f465a),
      tertiaryFixed: Color(0xffffd6f9),
      onTertiaryFixed: Color(0xff310b33),
      tertiaryFixedDim: Color(0xffecb5e7),
      onTertiaryFixedVariant: Color(0xff623762),
      surfaceDim: Color(0xffdbd9de),
      surfaceBright: Color(0xfffaf8fd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f3f7),
      surfaceContainer: Color(0xffefedf2),
      surfaceContainerHigh: Color(0xffe9e7ec),
      surfaceContainerHighest: Color(0xffe3e2e6),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1f3563),
      surfaceTint: Color(0xff495d8e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff586c9e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2f3649),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff666d82),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4f2750),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff8c5d8a),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffaf8fd),
      onSurface: Color(0xff101114),
      onSurfaceVariant: Color(0xff34363e),
      outline: Color(0xff50525b),
      outlineVariant: Color(0xff6b6d76),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303034),
      inversePrimary: Color(0xffb1c6fd),
      primaryFixed: Color(0xff586c9e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff405484),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff666d82),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4d5469),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff8c5d8a),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff714570),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc7c6ca),
      surfaceBright: Color(0xfffaf8fd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f3f7),
      surfaceContainer: Color(0xffe9e7ec),
      surfaceContainerHigh: Color(0xffdedce1),
      surfaceContainerHighest: Color(0xffd2d1d5),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff142a58),
      surfaceTint: Color(0xff495d8e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff344877),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff252c3e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff42495d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff441d45),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff643a64),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffaf8fd),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2a2c34),
      outlineVariant: Color(0xff474951),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303034),
      inversePrimary: Color(0xffb1c6fd),
      primaryFixed: Color(0xff344877),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff1b315f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff42495d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2b3245),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff643a64),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4b234c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb9b8bd),
      surfaceBright: Color(0xfffaf8fd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f0f5),
      surfaceContainer: Color(0xffe3e2e6),
      surfaceContainerHigh: Color(0xffd5d4d8),
      surfaceContainerHighest: Color(0xffc7c6ca),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb9ccff),
      surfaceTint: Color(0xffb1c6fd),
      onPrimary: Color(0xff192f5d),
      primaryContainer: Color(0xff9cb0e6),
      onPrimaryContainer: Color(0xff2e4271),
      secondary: Color(0xffbfc6de),
      onSecondary: Color(0xff293043),
      secondaryContainer: Color(0xff3f465a),
      onSecondaryContainer: Color(0xffaeb4cc),
      tertiary: Color(0xfff2bbed),
      onTertiary: Color(0xff49214a),
      tertiaryContainer: Color(0xffd5a0d1),
      onTertiaryContainer: Color(0xff5e345e),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff121317),
      onSurface: Color(0xffe3e2e6),
      onSurfaceVariant: Color(0xffc5c6d0),
      outline: Color(0xff8f909a),
      outlineVariant: Color(0xff44464f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e2e6),
      inversePrimary: Color(0xff495d8e),
      primaryFixed: Color(0xffd9e2ff),
      onPrimaryFixed: Color(0xff001946),
      primaryFixedDim: Color(0xffb1c6fd),
      onPrimaryFixedVariant: Color(0xff314575),
      secondaryFixed: Color(0xffdbe2fb),
      onSecondaryFixed: Color(0xff141b2d),
      secondaryFixedDim: Color(0xffbfc6de),
      onSecondaryFixedVariant: Color(0xff3f465a),
      tertiaryFixed: Color(0xffffd6f9),
      onTertiaryFixed: Color(0xff310b33),
      tertiaryFixedDim: Color(0xffecb5e7),
      onTertiaryFixedVariant: Color(0xff623762),
      surfaceDim: Color(0xff121317),
      surfaceBright: Color(0xff38393d),
      surfaceContainerLowest: Color(0xff0d0e11),
      surfaceContainerLow: Color(0xff1b1b1f),
      surfaceContainer: Color(0xff1f1f23),
      surfaceContainerHigh: Color(0xff292a2d),
      surfaceContainerHighest: Color(0xff343438),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd1dcff),
      surfaceTint: Color(0xffb1c6fd),
      onPrimary: Color(0xff0b2351),
      primaryContainer: Color(0xff9cb0e6),
      onPrimaryContainer: Color(0xff0b2451),
      secondary: Color(0xffd5dcf4),
      onSecondary: Color(0xff1e2538),
      secondaryContainer: Color(0xff8990a7),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffcdfa),
      onTertiary: Color(0xff3d163e),
      tertiaryContainer: Color(0xffd5a0d1),
      onTertiaryContainer: Color(0xff3d163e),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff121317),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdbdce6),
      outline: Color(0xffb0b1bb),
      outlineVariant: Color(0xff8e9099),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e2e6),
      inversePrimary: Color(0xff324776),
      primaryFixed: Color(0xffd9e2ff),
      onPrimaryFixed: Color(0xff000f31),
      primaryFixedDim: Color(0xffb1c6fd),
      onPrimaryFixedVariant: Color(0xff1f3563),
      secondaryFixed: Color(0xffdbe2fb),
      onSecondaryFixed: Color(0xff091122),
      secondaryFixedDim: Color(0xffbfc6de),
      onSecondaryFixedVariant: Color(0xff2f3649),
      tertiaryFixed: Color(0xffffd6f9),
      onTertiaryFixed: Color(0xff250128),
      tertiaryFixedDim: Color(0xffecb5e7),
      onTertiaryFixedVariant: Color(0xff4f2750),
      surfaceDim: Color(0xff121317),
      surfaceBright: Color(0xff444448),
      surfaceContainerLowest: Color(0xff06070a),
      surfaceContainerLow: Color(0xff1d1d21),
      surfaceContainer: Color(0xff27282b),
      surfaceContainerHigh: Color(0xff323236),
      surfaceContainerHighest: Color(0xff3d3d41),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffedefff),
      surfaceTint: Color(0xffb1c6fd),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffaec2f9),
      onPrimaryContainer: Color(0xff000a25),
      secondary: Color(0xffedefff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffbbc2da),
      onSecondaryContainer: Color(0xff040b1c),
      tertiary: Color(0xffffeaf9),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffe8b1e3),
      onTertiaryContainer: Color(0xff1c001f),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff121317),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffefeffa),
      outlineVariant: Color(0xffc1c2cc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e2e6),
      inversePrimary: Color(0xff324776),
      primaryFixed: Color(0xffd9e2ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffb1c6fd),
      onPrimaryFixedVariant: Color(0xff000f31),
      secondaryFixed: Color(0xffdbe2fb),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffbfc6de),
      onSecondaryFixedVariant: Color(0xff091122),
      tertiaryFixed: Color(0xffffd6f9),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffecb5e7),
      onTertiaryFixedVariant: Color(0xff250128),
      surfaceDim: Color(0xff121317),
      surfaceBright: Color(0xff505054),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1f1f23),
      surfaceContainer: Color(0xff303034),
      surfaceContainerHigh: Color(0xff3b3b3f),
      surfaceContainerHighest: Color(0xff46464a),
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
