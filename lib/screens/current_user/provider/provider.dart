import 'dart:developer';
import 'package:flutter/widgets.dart';

class CurrentUserProvider with ChangeNotifier {
  double? tabViewheight;
  int pCount = 0;
  int tCount = 0;
  setPMode(context) {
    setTabaviewHeight(context: context, childCount: pCount, crossAxisCount: 2);
  }

  setTMode(context) {
    setTabaviewHeight(context: context, childCount: tCount, crossAxisCount: 3);
  }

  setTabaviewHeight(
      {required BuildContext context,
      required int childCount,
      required int crossAxisCount}) {
    double tileHeight = MediaQuery.of(context).size.width / crossAxisCount;
    if (childCount == 0) return;
    if (childCount % 2 != 0) {
      childCount++;
    }
    tabViewheight = tileHeight * (childCount / crossAxisCount);
    log('$tabViewheight,$tileHeight');
    notifyListeners();
  }
}
