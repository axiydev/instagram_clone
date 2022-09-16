import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/pages/auth/signup/signup_provider.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  void dispose() {
    context.read<SignUpProvider>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false, //? pixel errorda
      body: Consumer<SignUpProvider>(
        builder: (context, signUpProviderValue, _) => SafeArea(
            child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Instagram',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 80.w,
                width: 80.w,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(AppConstants.avatar),
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
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 44.h,
                width: 343.w,
                child: _cupertinoTextField(
                  controller: signUpProviderValue.userNameController,
                  placeholder: 'username',
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                height: 44.h,
                width: 343.w,
                child: _cupertinoTextField(
                    controller: signUpProviderValue.emailController,
                    placeholder: 'email',
                    obscure: true),
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                height: 44.h,
                width: 343.w,
                child: _cupertinoTextField(
                    controller: signUpProviderValue.passwordController,
                    placeholder: 'password',
                    obscure: true),
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                height: 44.h,
                width: 343.w,
                child: _cupertinoTextField(
                    controller: signUpProviderValue.confirmPasswordController,
                    placeholder: 'confirm password',
                    obscure: true),
              ),
              SizedBox(
                height: 19.h,
              ),
              SizedBox(
                width: 343.w,
                height: 44.h,
                child: CupertinoButton.filled(
                    padding: const EdgeInsets.symmetric(horizontal: .0),
                    onPressed: () {},
                    child: const Text('Sign Up')),
              ),
              SizedBox(
                height: 41.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    child: const Text('Sign In'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
              SizedBox(
                width: 230.w,
                child: Text(
                  'By signing up,you agree to our Terms & Privacy Policy.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(
                height: 19.h,
              ),
            ],
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppUtils.themeMode.value = AppUtils.themeMode.value == ThemeMode.light
              ? ThemeMode.dark
              : ThemeMode.light;
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    width: 0.5, color: Theme.of(context).dividerColor))),
        height: 80.h,
        alignment: FractionalOffset.center,
        child: const Text('Instagram from Meta'),
      ),
    );
  }

  Widget _cupertinoTextField(
      {required TextEditingController controller,
      required String? placeholder,
      bool? obscure = false}) {
    return CupertinoTextField(
      obscureText: obscure!,
      style: TextStyle(color: Theme.of(context).focusColor),
      controller: controller,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.h),
          border:
              Border.all(color: Theme.of(context).dividerColor, width: 0.8.h)),
      placeholder: placeholder,
      placeholderStyle: Theme.of(context).inputDecorationTheme.hintStyle,
    );
  }
}
