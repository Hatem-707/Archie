import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  var _currentPage = 0;
  int get currentPage => _currentPage;

  void changePage(int newPage) {
    _currentPage = newPage;
    notifyListeners();
  }
}
