import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/current_user/provider/provider.dart';
import 'package:socio/screens/current_user/view/followerslist.dart';
import 'package:socio/common/text.dart';

Widget Counts(BuildContext context) {
  final h = MediaQuery.of(context).size.height;
  final w = MediaQuery.of(context).size.width;
  return Container(
    margin: const EdgeInsets.only(left: 5, right: 5),
    height: h * 0.1,
    width: w,
    decoration: BoxDecoration(
        color: Colors.black, borderRadius: BorderRadius.circular(50)),
    child: Consumer<CurrentUserProvider>(
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(value.MyDetails!.posts.length.toString(), Colors.white,
                    h * 0.03, FontWeight.w600, 1),
                text("Total Post", Colors.white, h * 0.015, FontWeight.w500, 1)
              ],
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => FollowersList(
                        details: value.MyDetails!.followers,
                        heading: "Followers",
                      ))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text(value.MyDetails!.followers.length.toString(),
                      Colors.white, h * 0.03, FontWeight.w600, 1),
                  text("Followers", Colors.white, h * 0.015, FontWeight.w500, 1)
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => FollowersList(
                        heading: "Following",
                        details: value.MyDetails!.following,
                      ))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text(value.MyDetails!.following.length.toString(),
                      Colors.white, h * 0.03, FontWeight.w600, 1),
                  text("Following", Colors.white, h * 0.015, FontWeight.w500, 1)
                ],
              ),
            )
          ],
        );
      },
    ),
  );
}
