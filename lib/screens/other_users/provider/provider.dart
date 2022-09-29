import 'package:flutter/widgets.dart';
import 'package:socio/services/like_post.dart';

class FollowersProvider with ChangeNotifier {
  double? tabviewHeight;
  int pCount = 0;
  int tCount = 0;
  bool like = false;
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

  getPostLike(id) {
    like = !like;
    notifyListeners();
    LikePost().likePost(id);
  }
  // getPostLike(id) {
  //   checkLike() {
  //     like = !like;
  //     notifyListeners();
  //   }

  //   LikePost().likePost(id).then((value) {
  //     if (like == false || value == "Post liked") {
  //       like = true;
  //       notifyListeners();
  //     }
  //   }
  //   );
  // }
}
// getPostLike(id) { 
//     like = !like;
//     notifyListeners();
//     LikePost().likePost(id);
//   }

  // checkLike() {
  //     like = !like;
  //     notifyListeners();
  //   }