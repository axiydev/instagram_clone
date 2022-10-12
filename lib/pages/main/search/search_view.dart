import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:instagram_clone/models/post_model.dart';
import 'package:instagram_clone/pages/main/search/search_provider.dart';
import 'package:instagram_clone/services/fire/fire_src.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  static Widget get show => ChangeNotifierProvider(
        create: (_) => SearchViewProvider(),
        lazy: false,
        child: const SearchView(),
      );
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<SearchViewProvider>(
            builder: (context, searchViewProvider, _) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: IgnorePointer(
                    ignoring: false,
                    child: CupertinoTextField(
                      dragStartBehavior: DragStartBehavior.down,
                      onTap: () {
                        if (kDebugMode) {
                          Navigator.of(context).pushNamed(AppRoutes.searchPage);
                        }
                      },
                      style: Theme.of(context).textTheme.displaySmall,
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
                          .copyWith(
                              color: const Color(0xFF8E8E93), fontSize: 16.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          color: Theme.of(context)
                              .cupertinoOverrideTheme!
                              .barBackgroundColor),
                    ),
                  ),
                ),

                // final user = snapshot.docs[index].data();
                FirestoreQueryBuilder(
                    query: FireSrc.firebaseFirestore
                        .collection('posts')
                        .orderBy('datePublished', descending: true),
                    pageSize: 15,
                    builder: (context, snapshot, _) {
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('you have an error'),
                        );
                      }

                      if (!snapshot.hasData) {
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }
                      return GridView.custom(
                          shrinkWrap: true,
                          primary: false,
                          gridDelegate: SliverQuiltedGridDelegate(
                            crossAxisCount: 3,
                            mainAxisSpacing: 2.h,
                            crossAxisSpacing: 2.w,
                            repeatPattern: QuiltedGridRepeatPattern.inverted,
                            pattern: [
                              const QuiltedGridTile(2, 1),
                              const QuiltedGridTile(1, 1),
                              const QuiltedGridTile(1, 1),
                              const QuiltedGridTile(1, 1),
                              const QuiltedGridTile(1, 1),
                            ],
                          ),
                          childrenDelegate: SliverChildBuilderDelegate(
                            childCount: snapshot.docs.length,
                            (context, index) {
                              if (snapshot.hasMore &&
                                  index + 1 == snapshot.docs.length) {
                                // Tell FirestoreQueryBuilder to try to obtain more items.
                                // It is safe to call this function from within the build method.
                                snapshot.fetchMore();
                              }

                              final post = PostModel.fromJson(
                                  snapshot.docs[index].data());
                              return CupertinoContextMenu(
                                actions: [
                                  CupertinoContextMenuAction(
                                    child: Text(
                                      post.username ?? "post",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                                previewBuilder: (context, animation, child) =>
                                    FadeTransition(
                                  opacity: animation,
                                  child: Card(
                                    color: Colors.transparent,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Card(
                                            color: Colors.transparent,
                                            margin: EdgeInsets.zero,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.w)),
                                            child: ListTile(
                                              dense: true,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.w)),
                                              tileColor: Theme.of(context)
                                                  .backgroundColor,
                                              leading: Container(
                                                  padding: EdgeInsets.all(3.w),
                                                  height: 50.w,
                                                  width: 50.w,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.w),
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      imageUrl:
                                                          post.userAvatar ?? '',
                                                      placeholder: (context,
                                                              url) =>
                                                          const SizedBox
                                                              .shrink(),
                                                      width: 25.w,
                                                      height: 25.w,
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const SizedBox
                                                              .shrink(),
                                                    ),
                                                  )),
                                              title: RichText(
                                                text: TextSpan(
                                                  text: post.username ?? 'user',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            )),
                                        Flexible(
                                          child: Card(
                                              margin: EdgeInsets.zero,
                                              color: Colors.transparent,
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.w),
                                                  child: child)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                child: Card(
                                  margin: EdgeInsets.zero,
                                  child: CachedNetworkImage(
                                    imageUrl: post.imageUrl ?? '',
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) =>
                                        const SizedBox.shrink(),
                                    placeholder: (context, url) =>
                                        const SizedBox.shrink(),
                                  ),
                                ),
                              );
                            },
                          ));
                    }),
              ],
            ),
          );
        }),
      ),
    );
  }
}
