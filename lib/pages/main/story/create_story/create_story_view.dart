import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/pages/main/main_view.dart';
import 'package:instagram_clone/pages/main/story/create_story/create_story_provider.dart';
import 'package:provider/provider.dart';

class CreateStoryView extends StatefulWidget {
  static Widget get show => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CreateStoryProvider(),
          ),
          ChangeNotifierProvider(create: (_) => MainProvider())
        ],
        child: const CreateStoryView(),
      );
  const CreateStoryView({super.key});

  @override
  State<CreateStoryView> createState() => _CreateStoryViewState();
}

class _CreateStoryViewState extends State<CreateStoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.h),
        child: AppBar(
          title: Text(
            'New Story',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          centerTitle: false,
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: .0,
          actions: [
            Consumer<CreateStoryProvider>(
              builder: (context, createStoryValue, _) => IconButton(
                onPressed: () => createStoryValue.showPostCreationType(context),
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
      body: Consumer2<CreateStoryProvider, MainProvider>(
        builder: (context, createStoryValue, mainProviderValue, _) => SafeArea(
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
                child: createStoryValue.imageFile == null
                    ? const SizedBox.shrink()
                    : Image.file(
                        createStoryValue.imageFile!,
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(
                height: 20.h,
              ),
              if (createStoryValue.imageFile != null)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                      controller: createStoryValue.descriptionController,
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
              if (createStoryValue.imageFile != null)
                CupertinoButton(
                    onPressed: () {
                      createStoryValue.publishingStory(
                        context,
                      );
                    },
                    child: const Text('Publish Story'))
            ],
          ),
        )),
      ),
    );
  }
}
