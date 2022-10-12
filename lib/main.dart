import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/pages/auth/auth.dart';
import 'package:instagram_clone/pages/main/story/create_story/create_story_view.dart';
import 'package:instagram_clone/pages/main/story/story/detail/view_story_item.dart';
import 'package:instagram_clone/pages/main/story/story/story_page.dart';
import 'package:instagram_clone/pages/main/story/story_view.dart';
import 'package:instagram_clone/services/notification/app_notification.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';
import 'package:instagram_clone/pages/main/main_view.dart';

/*
Created by Axmadjon Isaqov on 18:54:39 20.09.2022
© 2022 @axi_dev 
*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSetup.setup;
  final appNotification = AppNotificationsInsta();
  FirebaseMessaging.onBackgroundMessage(
      AppNotificationsInsta.backgrounNotification);
  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: AppUtils.themeMode,
      builder: (context, value, child) => ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          routes: {
            AppRoutes.signIn: (_) => SignInPage.view,
            AppRoutes.createPost: (_) => CreatePost.show,
            AppRoutes.signUp: (_) => SignUpPage.view,
            AppRoutes.postsPage: (_) => PostsPage.show,
            AppRoutes.comment: (_) => CommentPage.show,
            AppRoutes.searchView: (_) => SearchView.show,
            AppRoutes.searchPage: (_) => SearchPage.show,
            AppRoutes.mainPage: (_) => MainPage.view,
            AppRoutes.profilePage: (_) => ProfilePage.view,
            AppRoutes.userPageView: (_) => UserPageView.show,
            AppRoutes.reactionView: (_) => ReactionPage.view,
            AppRoutes.editProfile: (_) => EditProfile.show,
            AppRoutes.story: (_) => StoryView.show,
            AppRoutes.createStory: (_) => CreateStoryView.show,
            AppRoutes.storyView: (_) => StoryPage.show(),
            AppRoutes.viewStoryItem: (_) => ViewStoryItem.show()
          },
          title: 'Flutter Demo',
          themeMode: value,

          /// light [theme]
          theme: AppTheme.lightTheme,

          /// dark [theme]
          darkTheme: AppTheme.darkTheme,
          home: StreamBuilder<User?>(
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
