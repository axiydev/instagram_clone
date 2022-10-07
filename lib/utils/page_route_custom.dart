import 'package:flutter/material.dart';

class AppPageRouter extends PageRouteBuilder {
  Widget? child;
  AppPageRouter({required this.child})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => child!,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(scale: animation, child: child),
                    ),
            transitionDuration: const Duration(milliseconds: 500));
}
