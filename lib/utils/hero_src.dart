import 'package:flutter/material.dart';

class HeroSrc extends StatelessWidget {
  final String? tag;
  final Widget? child;
  const HeroSrc({super.key, required this.tag, required this.child});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Hero(
        tag: tag!,
        child: child!,
      );
    });
  }
}
