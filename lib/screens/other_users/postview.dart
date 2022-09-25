import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pinch_zoom_release_unzoom/pinch_zoom_release_unzoom.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/current_user/model/post_model.dart';
import 'package:socio/screens/current_user/provider/provider.dart';
import 'package:socio/screens/other_users/followers_profile.dart';
import 'package:socio/services/get_posts.dart';
import 'package:socio/widgets/more.dart';
import 'package:socio/widgets/text.dart';

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return FutureBuilder(
      future: context.read<CurrentUserProvider>().getPost(),
      //initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Consumer<CurrentUserProvider>(
          builder: (context, value, child) {
            log("post count = " + value.POSTS.length.toString());
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: value.POSTS.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    SizedBox(
                      height: height * 0.008,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black,
                      ),
                      // height: height * 0.7,
                      width: width * 0.93,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                const FollowersProfile()));
                                  },
                                  child: Container(
                                    height: height * 0.05,
                                    width: width * 0.1,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                value.POSTS[index].image),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                const FollowersProfile()));
                                  },
                                  child: text("harrystyles", Colors.white,
                                      height * 0.02, FontWeight.w700, 1),
                                ),
                                SizedBox(
                                  width: width * 0.1,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    text(
                                        value.POSTS[index].updatedAt.toString(),
                                        const Color.fromARGB(
                                            207, 253, 247, 247),
                                        height * 0.01,
                                        FontWeight.w400,
                                        1),
                                    IconButton(
                                        onPressed: () {
                                          more(context);
                                        },
                                        icon: const Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: PinchZoomReleaseUnzoomWidget(
                              child: Container(
                                height: height * 0.5,
                                width: width * 0.9,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            value.POSTS[index].image),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                //height: height * 0.03,
                                width: width * 0.8,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: text(
                                      value.POSTS[index].caption,
                                      Colors.white,
                                      height * 0.014,
                                      FontWeight.bold,
                                      2),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                    )),
                                text(
                                    value.POSTS[index].likes.length.toString(),
                                    Colors.white,
                                    height * 0.012,
                                    FontWeight.w600,
                                    1),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.mode_comment_outlined,
                                      color: Colors.white,
                                    )),
                                text(
                                    value.POSTS[index].comments.length
                                        .toString(),
                                    Colors.white,
                                    height * 0.012,
                                    FontWeight.w600,
                                    1),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    )
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
