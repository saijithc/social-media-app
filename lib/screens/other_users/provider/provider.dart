import 'package:flutter/widgets.dart';

class FollowersProvider with ChangeNotifier {
  double? tabviewHeight;
  int pCount = 0;
  int tCount = 0;
  setPMode(context) {
    setTabviewHeight(context: context, childCount: pCount, crossAxisCount: 2);
  }

  setTMode(context) {
    setTabviewHeight(context: context, childCount: tCount, crossAxisCount: 3);
  }

  setTabviewHeight(
      {required BuildContext context,
      required int childCount,
      required int crossAxisCount}) {
    double tileHeight = MediaQuery.of(context).size.width / crossAxisCount;
    if (childCount == 0) return;
    if (childCount % 2 != 0) {
      childCount++;
    }
    tabviewHeight = tileHeight * (childCount / crossAxisCount);
    notifyListeners();
  }
}
