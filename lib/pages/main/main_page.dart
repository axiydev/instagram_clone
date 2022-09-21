import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/pages/main/main_provider.dart';
import 'package:instagram_clone/pages/main/post/create_post/create_post_page.dart';
import 'package:instagram_clone/pages/main/post/posts/posts_page.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List _pageList = [
    PostsPage.show,
    const Center(
      child: Text('search'),
    ),
    CreatePost.show,
    const Center(
      child: Text('heart'),
    ),
    const Center(
      child: Text('user'),
    )
  ];

  @override
  void didChangeDependencies() {
    context.read<MainProvider>().getUserAvatar();
    if (kDebugMode) {
      print("did Change Dep");
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, mainValue, _) {
      return CupertinoTabScaffold(
        controller: mainValue.cupertinoTabController,
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        tabBar: CupertinoTabBar(
          onTap: (newIndex) => mainValue.changeIndex(newIndex),
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                CupertinoIcons.home,
              ),
              activeIcon: Icon(
                CupertinoIcons.home,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .selectedItemColor,
              ),
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  CupertinoIcons.search,
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .selectedItemColor,
                ),
                icon: const Icon(CupertinoIcons.search)),
            BottomNavigationBarItem(
              icon: const Icon(Icons.add_box_outlined),
              activeIcon: Icon(
                Icons.add_box_outlined,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .selectedItemColor,
              ),
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  CupertinoIcons.heart_fill,
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .selectedItemColor,
                ),
                icon: const Icon(CupertinoIcons.heart)),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(2.w),
                height: 29.w,
                width: 29.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.w, color: Colors.transparent)),
                child: mainValue.imageUrl == null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(AppConstants.avatar),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              mainValue.imageUrl!,
                            ),
                          ),
                        ),
                      ),
              ),
              activeIcon: Container(
                padding: EdgeInsets.all(2.w),
                height: 29.w,
                width: 29.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 1.w, color: Theme.of(context).focusColor)),
                child: mainValue.imageUrl == null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(AppConstants.avatar),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              mainValue.imageUrl!,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
        tabBuilder: (context, index) => Material(
            color: Theme.of(context).backgroundColor, child: _pageList[index]),
      );
    });
  }
}
