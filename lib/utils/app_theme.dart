import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static TextTheme? _lightTextTheme() => TextTheme(
      labelSmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'SfPro',
          color: const Color(0xFF3797EF)),
      displaySmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'SfPro',
          color: Colors.black),
      titleMedium: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'SfPro',
          color: Colors.grey),
      displayMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'SfPro',
          color: Colors.black),
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
        displaySmall: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'SfPro',
            color: Colors.white),
        labelSmall: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'SfPro',
            color: const Color(0xFF3797EF)),
        displayMedium: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'SfPro',
            color: Colors.white),
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
  static ThemeData get lightTheme => ThemeData(
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
          barBackgroundColor: const Color(0xFF767680).withOpacity(.12)),
      textTheme: _lightTextTheme(),
      dialogTheme: const DialogTheme(backgroundColor: Colors.white),
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFFAFAFA)),
      primaryColor: Colors.black,
      dialogBackgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      focusColor: Colors.black,
      listTileTheme: const ListTileThemeData(tileColor: Colors.white),
      dividerColor: Colors.grey,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black, backgroundColor: Colors.white),
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

//? Dark Theme
  static ThemeData get darkTheme => ThemeData(
      backgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF121212)),
      cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
          barBackgroundColor: Color(0xFF262626)),
      scaffoldBackgroundColor: Colors.black,
      dialogBackgroundColor: Colors.black,
      dialogTheme: const DialogTheme(backgroundColor: Colors.black),
      primaryColor: Colors.white,
      dividerColor: Colors.white,
      brightness: Brightness.light,
      focusColor: Colors.white,
      listTileTheme: ListTileThemeData(tileColor: Colors.grey[900]),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white, backgroundColor: Colors.black),
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
