import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/pages/main/search/search_provider.dart';
import 'package:instagram_clone/pages/main/search/widget/user_widget.dart';
import 'package:instagram_clone/services/fire/fire_src.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  static Widget get show => ChangeNotifierProvider(
        create: (_) => SearchViewProvider(),
        child: const SearchPage(),
      );
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppBar(
          elevation: .4,
          toolbarHeight: 60.h,
          leading: IconButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                FocusScope.of(context).unfocus();
                Navigator.of(context).pop();
              }
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).focusColor,
            ),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          leadingWidth: 30.w,
          title: Consumer<SearchViewProvider>(
              builder: (context, providerValue, _) {
            return CupertinoTextField(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  providerValue.updateStateSearch();
                }
              },
              style: Theme.of(context).textTheme.displaySmall,
              controller: providerValue.searchController,
              prefix: Padding(
                padding: EdgeInsets.only(left: 11.w),
                child: Icon(
                  CupertinoIcons.search,
                  size: 18.w,
                  color: Theme.of(context)
                      .copyWith(focusColor: const Color(0xFF8E8E93))
                      .focusColor,
                ),
              ),
              placeholder: "Search",
              placeholderStyle: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: const Color(0xFF8E8E93), fontSize: 16.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: Theme.of(context)
                      .cupertinoOverrideTheme!
                      .barBackgroundColor),
            );
          }),
        ),
      ),
      body: Consumer<SearchViewProvider>(builder: (context, searchProvider, _) {
        return StreamBuilder(
          stream: FireSrc.firebaseFirestore
              .collection('users')
              .where('username',
                  isGreaterThanOrEqualTo: searchProvider.searchController.text)
              .orderBy('username', descending: false)
              .get()
              .asStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CupertinoActivityIndicator());
            }

            if (!snapshot.hasData) {
              return const Center(child: CupertinoActivityIndicator());
            }

            if (snapshot.hasError) {
              return const Center(child: Text('Your app has an error'));
            }
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.size,
                itemBuilder: (context, index) {
                  UserModel? userModel = UserModel.fromDocumentSnapshot(
                      snapshot.data!.docs[index]);
                  return UserWidget(
                    user: userModel,
                    onPress: () {
                      Navigator.of(context).pushNamed(AppRoutes.userPageView,
                          arguments: {
                            'uid': userModel.uid,
                            'fcm': userModel.fcmToken
                          });
                    },
                  );
                });
          },
        );
      }),
    );
  }
}
