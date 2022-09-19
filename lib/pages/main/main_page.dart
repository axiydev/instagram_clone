import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/pages/main/main_provider.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List _pageList = [
    Center(
      child: TextButton(
          onPressed: () {
            AppUtils.themeChanger();
          },
          child: const Text('change')),
    ),
    const Center(
      child: Text('search'),
    ),
    const Center(
      child: Text('add'),
    ),
    const Center(
      child: Text('heart'),
    ),
    const Center(
      child: Text('user'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, mainValue, _) {
      return CupertinoTabScaffold(
        controller: mainValue.cupertinoTabController,
        backgroundColor: Theme.of(context).backgroundColor,
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
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AppConstants.avatar)),
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
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AppConstants.avatar)),
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
