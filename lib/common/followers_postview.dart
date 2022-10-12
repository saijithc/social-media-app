import 'package:flutter/material.dart';
import 'package:pinch_zoom_release_unzoom/pinch_zoom_release_unzoom.dart';
import 'package:socio/screens/other_users/provider/provider.dart';
import 'package:socio/common/more.dart';
import 'package:socio/common/text.dart';

import 'like_button.dart';

followersPosts(BuildContext context, FollowersProvider value, int index) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        scrollable: true,
        insetPadding:
            EdgeInsets.only(top: height * 0.08, bottom: height * 0.08),
        contentPadding: const EdgeInsets.all(0),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black,
                ),
                width: width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Container(
                        height: height * 0.06,
                        width: width * 0.13,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    NetworkImage(value.profileDetails!.avatar),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      title: text1(value.profileDetails!.fullname,
                          color: Colors.white,
                          sizes: height * 0.017,
                          weight: FontWeight.w700,
                          overflow: TextOverflow.ellipsis),
                      subtitle: text(
                          value.profileDetails!.updatedAt.toString(),
                          const Color.fromARGB(207, 253, 247, 247),
                          height * 0.01,
                          FontWeight.w400,
                          1),
                      trailing: IconButton(
                          onPressed: () {
                            more(
                                context, value.profileDetails!.posts[index].id);
                          },
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          )),
                    ),
                    Center(
                      child: PinchZoomReleaseUnzoomWidget(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 3, right: 3),
                          child: Image.network(
                              value.profileDetails!.posts[index].image),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: text(
                                value.profileDetails!.posts[index].caption,
                                Colors.white,
                                height * 0.014,
                                FontWeight.bold,
                                2),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        LikseButton(
                            id: value.profileDetails!.posts[index].id,
                            likes: value.profileDetails!.posts[index].likes,
                            count: value
                                .profileDetails!.posts[index].likes.length
                                .toString()),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.mode_comment_outlined,
                              color: Colors.white,
                            )),
                        text("100  ", Colors.white, height * 0.012,
                            FontWeight.w600, 1),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
      );
    },
  );
}
