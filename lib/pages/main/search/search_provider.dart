import 'package:flutter/material.dart';

class SearchViewProvider with ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  int? currentIndex = 0;
  void updateStateSearch() => notifyListeners();
}
