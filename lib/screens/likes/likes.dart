import 'package:flutter/material.dart';
import 'package:socio/screens/current_user/model/post_model.dart';
import 'package:socio/screens/other_users/followers_profile.dart';
import 'package:socio/services/get_posts.dart';
import 'package:socio/widgets/alertdialog.dart';
import 'package:socio/widgets/text.dart';

class Likes extends StatelessWidget {
  const Likes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 1,
        // backgroundColor: Colors.white,
        title:
            text1("Activity", sizes: height * 0.025, weight: FontWeight.w800),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => const FollowersProfile()));
              },
              child: Container(
                height: height * 0.065,
                width: width * 0.15,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("assets/Zayn.jpeg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            title: Row(
              children: [
                text1(
                  "Zayn_malik",
                  sizes: height * 0.02,
                  weight: FontWeight.w800,
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                text1(
                  "liked your post",
                  sizes: height * 0.015,
                  weight: FontWeight.w600,
                )
              ],
            ),
            trailing: GestureDetector(
              onTap: () {
                GetPosts().GetTimelinePosts();
                //customAlert(context);
                //TODO
              },
              child: Container(
                height: height * 0.06,
                width: width * 0.15,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("assets/Stall  - Chapter 45_.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          );
        },
      ),
    ));
  }
}
