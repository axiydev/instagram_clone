import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/pages/auth/auth_export.dart';
import 'package:instagram_clone/pages/main/main_page.dart';
import 'package:instagram_clone/pages/main/post/comment/comment_page.dart';
import 'package:instagram_clone/pages/main/post/create_post/create_post_page.dart';
import 'package:instagram_clone/pages/main/post/posts/posts_page.dart';
import 'package:instagram_clone/pages/profile/profile/profile_page_provider.dart';
import 'package:instagram_clone/pages/search/search_page.dart';
import 'package:instagram_clone/pages/search/search_view.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';

/*
Created by Axmadjon Isaqov on 18:54:39 20.09.2022
© 2022 @axi_dev 
*/
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
            AppRoutes.signIn: (_) => SignInPage.view,
            AppRoutes.createPost: (_) => CreatePost.show,
            AppRoutes.signUp: (_) => SignUpPage.view,
            AppRoutes.postsPage: (_) => PostsPage.show,
            AppRoutes.comment: (_) => CommentPage.show,
            AppRoutes.searchView: (_) => SearchView.show,
            AppRoutes.searchPage: (_) => SearchPage.show,
            AppRoutes.mainPage: (_) => MainPage.view,
            AppRoutes.profilePage: (_) => ProfilePage.view
          },
          title: 'Flutter Demo',
          themeMode: value,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
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
                  return MainPage.view;
                } else {
                  return SignInPage.view;
                }
              }
              return SignInPage.view;
            },
          ),
        ),
      ),
    );
  }
}
