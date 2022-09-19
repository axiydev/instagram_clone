import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/pages/main/main_provider.dart';
import 'package:instagram_clone/utils/app_constants.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, mainValue, _) {
      return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            items: [
              const BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
              const BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(CupertinoIcons.search)),
              const BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined)),
              const BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(CupertinoIcons.heart)),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 23.w,
                  height: 23.w,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(AppConstants.avatar),
                  ),
                ),
                activeIcon: Container(
                  padding: EdgeInsets.all(1.w),
                  height: 27.w,
                  width: 27.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL_JlCFnIGX5omgjEjgV9F3sBRq14eTERK9w&usqp=CAU")),
                      border: Border.all(width: 1.w, color: Colors.black)),
                ),
              ),
            ],
          ),
          tabBuilder: (context, index) => Container());
    });
  }
}
