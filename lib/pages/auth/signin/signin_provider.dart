import 'package:flutter/material.dart';

class SignInProvider with ChangeNotifier {
  int _counter = 0;
  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  int get counter => _counter;
}
