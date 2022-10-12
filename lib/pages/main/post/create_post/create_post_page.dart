import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/pages/main/main_provider.dart';
import 'package:instagram_clone/pages/main/post/create_post/create_post_provider.dart';
import 'package:provider/provider.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});
  static Widget get show => MultiProvider(
        providers: [
          ChangeNotifierProvider<CreatePostProvider>(
            create: (context) => CreatePostProvider(),
            lazy: false,
            child: const CreatePost(),
          ),
          // ChangeNotifierProvider<MainProvider>(create: (_) => MainProvider())
        ],
        child: const CreatePost(),
      );
  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.h),
        child: AppBar(
          leading: Consumer2<MainProvider, CreatePostProvider>(
            builder: (context, mainProviderValue, createPostValue, _) =>
                IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.clear,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .selectedItemColor,
              ),
              onPressed: () {
                createPostValue.restore();
                // mainProviderValue.changeIndex(0);
                mainProviderValue.changeIndex(0);
                log(mainProviderValue.currentIndex.toString());
              },
            ),
          ),
          title: Text(
            'New Post',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          centerTitle: false,
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: .0,
          actions: [
            Consumer<CreatePostProvider>(
              builder: (context, postValue, _) => IconButton(
                onPressed: () => postValue.showPostCreationType(context),
                icon: Icon(
                  Icons.add_box_outlined,
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .selectedItemColor,
                ),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
          ],
        ),
      ),
      body: Consumer2<CreatePostProvider, MainProvider>(
        builder: (context, postValue, mainProviderValue, _) => SafeArea(
            child: SizedBox(
          width: 375.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 375.h,
                width: 375.w,
                child: postValue.imageFile == null
                    ? const SizedBox.shrink()
                    : Image.file(
                        postValue.imageFile!,
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(
                height: 20.h,
              ),
              if (postValue.imageFile != null)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                      controller: postValue.descriptionController,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        hintStyle: Theme.of(context).textTheme.titleMedium,
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor)),
                      )),
                ),
              if (postValue.imageFile != null)
                CupertinoButton(
                    onPressed: () {
                      postValue.publishingPost(
                          func: (index) =>
                              mainProviderValue.changeIndex(index));
                    },
                    child: const Text('Publish post'))
            ],
          ),
        )),
      ),
    );
  }
}
