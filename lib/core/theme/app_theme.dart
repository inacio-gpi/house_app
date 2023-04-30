// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const _lightGreyColor = Color(0xff616161);
  static const _darkGreyColor = Color(0xffbdbdbd);

  static const _lightColor = Color(0xfffafafa);
  static const _darkColor = Color(0xff070707);

  // static void toggleTheme(final BuildContext context) => Get.changeTheme(
  //       Theme.of(context).brightness == Brightness.dark ? lightTheme() : darkTheme(),
  //     );

  static ThemeData dynamicTheme(final BuildContext context) => _appTheme(Theme.of(context).brightness == Brightness.dark);

  static ThemeData lightTheme() => _appTheme(false);

  static ThemeData darkTheme() => _appTheme(true);

  static ThemeData _appTheme(final bool isDark) {
    final colorScheme = isDark ? _darkScheme() : _lightScheme();
    return ThemeData(
      useMaterial3: true,
      primaryColor: colorScheme.primary,
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      appBarTheme: AppBarTheme(
        elevation: 0,
        toolbarHeight: 48,
        backgroundColor: colorScheme.background,
        foregroundColor: colorScheme.onBackground,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: isDark ? Brightness.light : Brightness.dark,
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
          systemNavigationBarColor: colorScheme.background,
          statusBarColor: Colors.transparent,
        ),
        titleTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 2,
          color: colorScheme.onPrimary,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          // height: 1,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: colorScheme.surface.withOpacity(0.2), width: 1),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          visualDensity: VisualDensity.standard,
          padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
          foregroundColor: MaterialStateProperty.all(colorScheme.onBackground),
          overlayColor: MaterialStateProperty.all(colorScheme.onBackground.withOpacity(0.1)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: colorScheme.onPrimary,
          elevation: 0,
          backgroundColor: colorScheme.primary,
          minimumSize: const Size(120, 42),
          textStyle: TextStyle(
            color: colorScheme.onPrimary,
            // fontFamily: AppEnv.appFont,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.onBackground,
          elevation: 0,
          minimumSize: const Size(120, 42),
          textStyle: const TextStyle(
            // fontFamily: AppEnv.appFont,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: BorderSide(width: 2.0, color: colorScheme.primary),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          // foregroundColor: colorScheme.onBackground,
          minimumSize: const Size(120, 42),
          textStyle: const TextStyle(
            // fontFamily: AppEnv.appFont,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.background,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(29.0),
            topRight: Radius.circular(29.0),
          ),
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.background,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          // side: BorderSide(width: 2.0, color: colorScheme.primary),
        ),
      ),
      cardColor: colorScheme.background,
      cardTheme: CardTheme(
        color: colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(29.0),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        actionTextColor: colorScheme.primary,
        backgroundColor: colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentTextStyle: TextStyle(
          color: colorScheme.onBackground,
          // fontFamily: AppEnv.appFont,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        // selectedItemColor: appColor.primary,
        unselectedItemColor: colorScheme.onBackground,
      ),
      chipTheme: ChipThemeData(
        elevation: 0,
        pressElevation: 0,
        selectedColor: colorScheme.primary,
        checkmarkColor: colorScheme.onPrimary,
        backgroundColor: Colors.transparent,
        labelStyle: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          // fontFamily: AppEnv.appFont,
        ),
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      popupMenuTheme: PopupMenuThemeData(
        color: colorScheme.background,
        textStyle: TextStyle(
          // fontFamily: AppEnv.appFont,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: colorScheme.onBackground,
          letterSpacing: 1.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(width: 2.0, color: colorScheme.primary),
        ),
      ),
      colorScheme: colorScheme.copyWith(background: colorScheme.background),
    );
  }

  static ColorScheme _lightScheme() => const ColorScheme(
        primary: Color(0xffFF0000),
        secondary: Color(0xff750000),
        surface: _lightGreyColor,
        background: _lightColor,
        error: Colors.red,
        onPrimary: Color(0xff000000),
        onSecondary: Colors.white,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.black,
        brightness: Brightness.light,
      );

  static ColorScheme _darkScheme() => const ColorScheme(
        primary: Color(0xffFF0000),
        secondary: Color(0xff750000),
        surface: _darkGreyColor,
        background: _darkColor,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onBackground: Colors.white,
        onError: Colors.white,
        brightness: Brightness.dark,
      );
  // newColors = Colors(0xFF1ED760)
}
