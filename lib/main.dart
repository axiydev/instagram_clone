import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/pages/auth/signin/signin_page.dart';
import 'package:instagram_clone/pages/auth/signin/signin_provider.dart';
import 'package:instagram_clone/pages/auth/signup/signup_page.dart';
import 'package:instagram_clone/pages/auth/signup/signup_provider.dart';
import 'package:instagram_clone/pages/main/main_page.dart';
import 'package:instagram_clone/pages/main/main_provider.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSetup.setup;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppUtils.themeMode,
      builder: (context, value, child) => ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            AppRoutes.signIn: (_) => ChangeNotifierProvider(
                  create: (_) => SignInProvider(),
                  lazy: false,
                  child: const SignInPage(),
                ),
            AppRoutes.signUp: (_) => ChangeNotifierProvider(
                lazy: false,
                create: (_) => SignUpProvider(),
                child: const SignUpPage()),
            AppRoutes.mainPage: (_) => ChangeNotifierProvider(
                lazy: true,
                create: (_) => MainProvider(),
                child: const MainPage())
          },
          title: 'Flutter Demo',
          themeMode: value,
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }

              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return ChangeNotifierProvider(
                    create: (_) => MainProvider(),
                    lazy: false,
                    child: const MainPage(),
                  );
                } else {
                  return ChangeNotifierProvider(
                    create: (_) => SignInProvider(),
                    lazy: false,
                    child: const SignInPage(),
                  );
                }
              }
              return ChangeNotifierProvider(
                create: (_) => SignInProvider(),
                child: const SignInPage(),
              );
            },
          ),
        ),
      ),
    );
  }
}
