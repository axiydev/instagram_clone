import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/pages/main/main_provider.dart';
import 'package:instagram_clone/pages/main/profile/edit_profile/edit_profile_provider.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  static Widget get show => MultiProvider(
        providers: [
          ChangeNotifierProvider<EditProfileProvider>(
              lazy: false, create: (_) => EditProfileProvider()),
          ChangeNotifierProvider<MainProvider>(create: (_) => MainProvider()),
        ],
        child: const EditProfile(),
      );

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    context.read<EditProfileProvider>().initUserValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.h),
        child: AppBar(
          leading: Consumer2<MainProvider, EditProfileProvider>(
            builder: (context, mainProviderValue, editProfileProvider, _) =>
                IconButton(
              padding: EdgeInsets.zero,
              icon: editProfileProvider.isLoading!
                  ? const CupertinoActivityIndicator()
                  : Icon(
                      Icons.clear,
                      color: Theme.of(context)
                          .bottomNavigationBarTheme
                          .selectedItemColor,
                    ),
              onPressed: () {
                editProfileProvider.back(context);
              },
            ),
          ),
          title: Text(
            'Edit Profile',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          centerTitle: false,
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: .0,
          actions: [
            Consumer<EditProfileProvider>(
              builder: (context, editProviderValue, _) => IconButton(
                onPressed: () {
                  editProviderValue.updateUser(context);
                },
                padding: EdgeInsets.all(2.w),
                icon: Icon(
                  Icons.check,
                  color: Colors.blue,
                  size: 30.w,
                ),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Consumer<EditProfileProvider>(
          builder: (context, editProviderValue, _) {
        if (editProviderValue.user == null) {
          return const Center(child: CupertinoActivityIndicator());
        }
        return SafeArea(
            child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: editProviderValue.globalKeyForFormField,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(100.w),
                  onTap: () {
                    editProviderValue.uploadImageToAvatar();
                  },
                  child: SizedBox(
                    height: 80.w,
                    width: 80.w,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        editProviderValue.imageFile != null
                            ? CircleAvatar(
                                backgroundImage:
                                    FileImage(editProviderValue.imageFile!),
                              )
                            : CircleAvatar(
                                backgroundImage: NetworkImage(
                                    editProviderValue.user!.photoAvatarUrl!),
                              ),
                        Positioned(
                            bottom: .0,
                            right: .0,
                            child: Icon(
                              CupertinoIcons.camera,
                              color: Theme.of(context).focusColor,
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 44.h,
                  width: 343.w,
                  child: _cupertinoTextField(
                    controller: editProviderValue.userNameController,
                    placeholder: 'username',
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                  height: 19.h,
                ),
                SizedBox(
                  height: 44.h,
                  width: 343.w,
                  child: _cupertinoTextField(
                      controller: editProviderValue.bioController,
                      placeholder: 'Bio',
                      obscure: false),
                ),
              ],
            ),
          ),
        ));
      }),
    );
  }

  Widget _cupertinoTextField(
      {required TextEditingController controller,
      required String? placeholder,
      bool? obscure = false}) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      obscureText: obscure!,
      style: TextStyle(color: Theme.of(context).focusColor),
      controller: controller,
      decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          disabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 1.h, color: Theme.of(context).focusColor)),
          enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 1.h, color: Theme.of(context).focusColor)),
          errorBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 1.h, color: Theme.of(context).focusColor)),
          border: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 1.h, color: Theme.of(context).focusColor))),
    );
  }
}
