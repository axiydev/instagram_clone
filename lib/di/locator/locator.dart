import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void get setup async {
  locator.registerFactory<PageController>(() => PageController(initialPage: 0));
}
