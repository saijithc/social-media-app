import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socio/widgets/text.dart';

Widget Counts(BuildContext context, value) {
  final h = MediaQuery.of(context).size.height;
  final w = MediaQuery.of(context).size.width;
  return Container(
    margin: const EdgeInsets.only(left: 5, right: 5),
    height: h * 0.1,
    width: w,
    decoration: BoxDecoration(
        color: Colors.black, borderRadius: BorderRadius.circular(50)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text(value.MyDetails!.currentUserPosts.length.toString(),
                Colors.white, h * 0.03, FontWeight.w600, 1),
            text("Total Post", Colors.white, h * 0.015, FontWeight.w500, 1)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text(value.MyDetails!.otherDetails.followers.length.toString(),
                Colors.white, h * 0.03, FontWeight.w600, 1),
            text("Followers", Colors.white, h * 0.015, FontWeight.w500, 1)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text(value.MyDetails!.otherDetails.following.length.toString(),
                Colors.white, h * 0.03, FontWeight.w600, 1),
            text("Following", Colors.white, h * 0.015, FontWeight.w500, 1)
          ],
        )
      ],
    ),
  );
}
