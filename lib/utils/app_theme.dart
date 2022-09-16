import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static TextTheme? _lightTextTheme() => TextTheme(
      labelSmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF3797EF)),
      bodySmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF000000).withOpacity(0.4)),
      bodyMedium: TextStyle(
          fontSize: 50.sp,
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontFamily: 'Billabong'));
  static TextTheme? _darkTextTheme() => TextTheme(
        labelSmall: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF3797EF)),
        bodySmall: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFFFFFFF).withOpacity(0.4)),
        bodyMedium: TextStyle(
            fontSize: 50.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: 'Billabong'),
      );

  static ThemeData lightTheme() => ThemeData(
      textTheme: _lightTextTheme(),
      backgroundColor: Colors.white,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              textStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF3797EF)),
              padding: const EdgeInsets.symmetric(horizontal: 0))));
  static ThemeData darkTheme() => ThemeData(
      backgroundColor: Colors.black,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              textStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF3797EF)),
              padding: const EdgeInsets.symmetric(horizontal: 0))),
      textTheme: _darkTextTheme());
}
