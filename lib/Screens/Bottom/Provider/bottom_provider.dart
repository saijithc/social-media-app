import 'package:flutter/widgets.dart';

class BottomProvder with ChangeNotifier {
  int currentIndex = 0;
  update(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
