import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/current_user/provider/provider.dart';
import 'package:socio/screens/other_users/provider/provider.dart';
import 'package:socio/services/follow.dart';
import 'package:socio/widgets/text.dart';

more(BuildContext context, id) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding:
              EdgeInsets.only(top: height * 0.25, bottom: height * 0.3),
          backgroundColor: Colors.white.withOpacity(0.2),
          content: Center(
            child: Consumer<CurrentUserProvider>(
              builder: (context, value, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.02),
                    GestureDetector(
                      onTap: () {
                        FollowAndUnfollow().followAndUnfollow(id);
                        value.getMyProfileDetai();
                        value.getPost(context);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: height * 0.06,
                        width: width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Center(
                          child: Consumer<CurrentUserProvider>(
                            builder: (context, value, child) {
                              return text(
                                  value.isFollowing == true
                                      ? "unfollow"
                                      : "follow",
                                  Colors.black,
                                  height * 0.02,
                                  FontWeight.bold,
                                  1);
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Container(
                      height: height * 0.06,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: Center(
                        child: text("Save", Colors.black, height * 0.02,
                            FontWeight.bold, 1),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Container(
                      height: height * 0.06,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: Center(
                        child: text("Share", Colors.black, height * 0.02,
                            FontWeight.bold, 1),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Consumer<FollowersProvider>(
                      builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () {
                            value.reportPost(id);
                          },
                          child: Container(
                            height: height * 0.06,
                            width: width * 0.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            child: Center(
                              child: value.isReporting == true
                                  ? const CircularProgressIndicator()
                                  : text("Report", Colors.black, height * 0.02,
                                      FontWeight.bold, 1),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                );
              },
            ),
          ),
        );
      });
}
