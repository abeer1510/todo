 import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/theme/theme.dart';

class LightTheme extends BaseTheme{
  @override
  Color get backgroundColor => Color(0xffF2FEFF);

  @override
  Color get primaryColor => Color(0xff5669FF);

  @override
  Color get textColor => Color(0xff1C1C1C);

  @override
  ThemeData get themeData => ThemeData(
    hintColor: Color(0xff7B7B7B),
    focusColor: Color(0xff7B7B7B),
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: backgroundColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.white,
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize:30,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
    )
  );


 }