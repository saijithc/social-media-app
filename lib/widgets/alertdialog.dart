import 'package:flutter/material.dart';
import 'package:pinch_zoom_release_unzoom/pinch_zoom_release_unzoom.dart';
import 'package:provider/provider.dart';
import '../screens/current_user/provider/provider.dart';
import 'like_button.dart';
import 'options.dart';
import 'text.dart';

customAlert(BuildContext context, CurrentUserProvider value, int index) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
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
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: height * 0.05,
                            width: width * 0.1,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        value.MyDetails!.otherDetails.avatar),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          text(value.MyDetails!.otherDetails.fullname,
                              Colors.white, height * 0.02, FontWeight.w700, 1),
                          SizedBox(
                            width: width * 0.08,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              text(
                                  value.MyDetails!.otherDetails.updatedAt
                                      .toString(),
                                  const Color.fromARGB(207, 253, 247, 247),
                                  height * 0.01,
                                  FontWeight.w400,
                                  1),
                              // SizedBox(
                              //   width: width * 0.1,
                              // ),
                              IconButton(
                                  onPressed: () {
                                    options(context);
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
                          width: width * 0.85,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(value.MyDetails!
                                      .currentUserPosts[index].image),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(30)),
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
                                value
                                    .MyDetails!.currentUserPosts[index].caption,
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
                        likeButton(
                            context: context,
                            id: value.MyDetails!.currentUserPosts[index].id,
                            likes:
                                value.MyDetails!.currentUserPosts[index].likes,
                            count: value
                                .MyDetails!.currentUserPosts[index].likes.length
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
