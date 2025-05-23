import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/theme/theme.dart';

class DarkTheme extends BaseTheme{
  @override
  Color get backgroundColor => Color(0xff101127);

  @override
  Color get primaryColor => Color(0xff5669FF);

  @override
  Color get textColor => Color(0xffF4EBDC);

  @override
  ThemeData get themeData => ThemeData(
      cardColor: backgroundColor,
      focusColor: Color(0xff5669FF),
      hintColor: textColor,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide(
                color: Colors.white,
                width: 4,
              )
          )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: backgroundColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
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