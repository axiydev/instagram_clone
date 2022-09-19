import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static TextTheme? _lightTextTheme() => TextTheme(
      labelSmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'SfPro',
          color: const Color(0xFF3797EF)),
      titleMedium: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'SfPro',
          color: Colors.grey),
      bodySmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'SfPro',
          color: const Color(0xFF000000).withOpacity(0.4)),
      bodyMedium: TextStyle(
          fontSize: 14.sp,
          color: Colors.black.withOpacity(0.4),
          fontWeight: FontWeight.w400,
          fontFamily: 'SfPro'),
      bodyLarge: TextStyle(
          fontSize: 50.sp,
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontFamily: 'Billabong'));
  static TextTheme? _darkTextTheme() => TextTheme(
        labelSmall: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'SfPro',
            color: const Color(0xFF3797EF)),
        titleMedium: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'SfPro',
            color: Colors.white),
        bodyMedium: TextStyle(
            fontSize: 14.sp,
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontFamily: 'SfPro'),
        bodySmall: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'SfPro',
            color: const Color(0xFFFFFFFF).withOpacity(0.4)),
        bodyLarge: TextStyle(
            fontSize: 50.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: 'Billabong'),
      );
//? Light Theme
  static ThemeData lightTheme() => ThemeData(
      textTheme: _lightTextTheme(),
      backgroundColor: Colors.white,
      focusColor: Colors.black,
      dividerColor: Colors.grey,
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'SfPro',
            color: Colors.grey),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              textStyle: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'SfPro',
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF3797EF)),
              padding: const EdgeInsets.symmetric(horizontal: 0))));

//! Dark Theme
  static ThemeData darkTheme() => ThemeData(
      backgroundColor: Colors.black,
      dividerColor: Colors.white,
      focusColor: Colors.white,
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: Colors.black),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'SfPro',
            color: Colors.white60),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              textStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SfPro',
                  color: const Color(0xFF3797EF)),
              padding: const EdgeInsets.symmetric(horizontal: 0))),
      textTheme: _darkTextTheme());
}
