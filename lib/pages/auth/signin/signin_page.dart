import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/pages/auth/signin/signin_provider.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  static Widget get view => ChangeNotifierProvider<SignInProvider>(
        create: (_) => SignInProvider(),
        lazy: false,
        child: const SignInPage(),
      );
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false, //? pixel errorda
      body: Consumer<SignInProvider>(
        builder: (context, signInProviderValue, _) => SafeArea(
            child: SizedBox(
          width: 375.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Instagram',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 57.h,
              ),
              SizedBox(
                height: 44.h,
                width: 343.w,
                child: _cupertinoTextField(
                  controller: signInProviderValue.userNameController,
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
                    controller: signInProviderValue.passwordController,
                    placeholder: 'password',
                    obscure: true),
              ),
              SizedBox(
                height: 19.h,
              ),
              SizedBox(
                width: 343.w,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      style: Theme.of(context).textButtonTheme.style,
                      child: const Text(
                        'forgot password?',
                      )),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                width: 343.w,
                height: 44.h,
                child: CupertinoButton.filled(
                    padding: const EdgeInsets.symmetric(horizontal: .0),
                    onPressed: () => signInProviderValue.signIn(
                          context,
                        ),
                    child: signInProviderValue.isLoading!
                        ? CupertinoActivityIndicator(
                            color: Theme.of(context).backgroundColor,
                          )
                        : const Text('Log In')),
              ),
              SizedBox(
                height: 38.5.h,
              ),
              SizedBox(
                width: 170.w,
                height: 18.h,
                child: TextButton.icon(
                    icon: Icon(
                      Icons.facebook,
                      size: 17.w,
                    ),
                    onPressed: () {},
                    label: const Text('Log with Facebook')),
              ),
              SizedBox(
                height: 41.h,
              ),
              SizedBox(
                width: 343.w,
                height: 18.h,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 1.h,
                      width: 132.w,
                      color: Theme.of(context).textTheme.bodySmall!.color,
                    ),
                    Text(
                      'OR',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Container(
                      height: 1.h,
                      width: 132.w,
                      color: Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 41.5.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    child: const Text('Sign Up'),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.signUp);
                    },
                  )
                ],
              ),
            ],
          ),
        )),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     AppUtils.themeChanger();
      //   },
      // ),

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
      clearButtonMode: OverlayVisibilityMode.editing,
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
