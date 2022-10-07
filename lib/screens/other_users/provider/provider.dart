import 'package:flutter/widgets.dart';
import 'package:socio/services/like_post.dart';
import 'package:socio/services/report.dart';

import '../../../services/current_user_details.dart';
import '../../current_user/model/current_user_details.dart';

class FollowersProvider with ChangeNotifier {
  double? tabviewHeight;
  int pCount = 0;
  int tCount = 0;
  bool like = false;
  UserDetails? profileDetails;
  bool isReporting = false;
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

  getFollowerProfileDetails(id) {
    profileDetails = null;
    CurrentUserDetails().getUserDetails(id).then((value) {
      profileDetails = value;
      notifyListeners();
    });
  }

  getPostLike(id) {
    like = !like;
    notifyListeners();
    LikePost().likePost(id);
  }

  reportPost(postId) {
    isReporting = true;
    notifyListeners();
    ReportApi().reportPost(postId).then(() {
      isReporting = false;
      notifyListeners();
    });
  }
}
