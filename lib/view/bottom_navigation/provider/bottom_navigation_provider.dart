import 'package:flutter/material.dart';

class BottomProvider extends ChangeNotifier {
  int currentIndex = 0;

  int updateIndex(int i) {
    currentIndex = i;
    notifyListeners();
    return currentIndex;
  }
}
