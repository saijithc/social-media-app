import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/current_user/model/user.dart';
import 'package:socio/screens/other_users/provider/provider.dart';
import 'package:socio/widgets/text.dart';

Widget likeButton(
    {required BuildContext context,
    String? id,
    List? likes,
    required String count}) {
  final h = MediaQuery.of(context).size.height;
  return Row(
    children: [
      IconButton(
          onPressed: () {
            log("this is current user" + CurrentUser.userId.toString());
            log('tapped');
            context.read<FollowersProvider>().getPostLike(id);

            if (likes!.contains(CurrentUser.userId)) {
              likes.remove(CurrentUser.userId);
            } else {
              likes.add(CurrentUser.userId);
            }
          },
          icon: likes!.contains(CurrentUser.userId)
              ? Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.amber,
                )),
      text1(count,
          color: Colors.white, sizes: h * 0.012, weight: FontWeight.w600)
    ],
  );
}
// checkLikes(List likes) {
//     if (likes.contains(HelperFuction.userId)) {
//       like = true;
//       notifyListeners();
//       return likes;
//     } else {
//       like = false;
//       notifyListeners();
//       return likes;
//     }
//   }