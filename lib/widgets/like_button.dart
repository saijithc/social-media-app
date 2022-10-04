import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/current_user/model/user.dart';
import 'package:socio/screens/other_users/provider/provider.dart';
import 'package:socio/widgets/text.dart';

class LikseButton extends StatefulWidget {
  LikseButton(
      {Key? key, required this.id, required this.likes, required this.count})
      : super(key: key);
  String? id;
  List? likes;
  String count;
  @override
  State<LikseButton> createState() => _LikseButtonState();
}

class _LikseButtonState extends State<LikseButton> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Row(
      children: [
        IconButton(
            splashRadius: 5,
            onPressed: () {
              log("this is current user" + CurrentUser.userId.toString());
              log('tapped');
              context.read<FollowersProvider>().getPostLike(widget.id);

              if (widget.likes!.contains(CurrentUser.userId)) {
                widget.likes!.remove(CurrentUser.userId);
              } else {
                widget.likes!.add(CurrentUser.userId);
              }
              setState(() {});
            },
            icon: widget.likes!.contains(CurrentUser.userId)
                ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.red,
                  )),
        text1(widget.likes!.length.toString(),
            color: Colors.white, sizes: h * 0.012, weight: FontWeight.w600)
      ],
    );
  }
}
// Widget likeButton(
//     {required BuildContext context,
//     String? id,
//     List? likes,
//     required String count}) {
//   final h = MediaQuery.of(context).size.height;
//   return Row(
//     children: [
//       IconButton(
//           onPressed: () {
//             log("this is current user" + CurrentUser.userId.toString());
//             log('tapped');
//             context.read<FollowersProvider>().getPostLike(id);

//             if (likes!.contains(CurrentUser.userId)) {
//               likes.remove(CurrentUser.userId);
//             } else {
//               likes.add(CurrentUser.userId);
//             }
//           },
//           icon: likes!.contains(CurrentUser.userId)
//               ? Icon(
//                   Icons.favorite,
//                   color: Colors.red,
//                 )
//               : Icon(
//                   Icons.favorite_border_outlined,
//                   color: Colors.amber,
//                 )),
//       text1(count,
//           color: Colors.white, sizes: h * 0.012, weight: FontWeight.w600)
//     ],
//   );
// }
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