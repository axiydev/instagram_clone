import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/pages/auth/signin/signin_provider.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SignInProvider>(
        builder: (context, signInProviderValue, _) => SafeArea(
            child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Instagram',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: 57.h,
                ),
                SizedBox(
                  height: 44.h,
                  width: 343.w,
                  child: const CupertinoTextField(
                    placeholder: 'username',
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                  height: 44.h,
                  width: 343.w,
                  child: const CupertinoTextField(
                    placeholder: 'password',
                  ),
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
                      onPressed: () {},
                      child: const Text('Log In')),
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
                      label: const Text('Log with Fasebook')),
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
              ],
            ),
            Positioned(
                child: Container(
              height: 84.h,
            ))
          ],
        )),
      ),
    );
  }
}
