import 'package:flutter/material.dart';
import 'package:pinch_zoom_release_unzoom/pinch_zoom_release_unzoom.dart';
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
                    ListTile(
                      leading: Container(
                        height: height * 0.06,
                        width: width * 0.13,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(value.MyDetails!.avatar),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      title: text1(value.MyDetails!.fullname,
                          color: Colors.white,
                          sizes: height * 0.017,
                          weight: FontWeight.w700,
                          overflow: TextOverflow.ellipsis),
                      subtitle: text(
                          value.MyDetails!.updatedAt.toString(),
                          const Color.fromARGB(207, 253, 247, 247),
                          height * 0.01,
                          FontWeight.w400,
                          1),
                      trailing: IconButton(
                          onPressed: () {
                            options(context, value.MyDetails!.posts[index].id);
                          },
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          )),
                    ),
                    Center(
                      child: PinchZoomReleaseUnzoomWidget(
                        child: Container(
                          height: height * 0.5,
                          width: width * 0.85,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      value.MyDetails!.posts[index].image),
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
                                value.MyDetails!.posts[index].caption,
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
                            id: value.MyDetails!.posts[index].id,
                            likes: value.MyDetails!.posts[index].likes,
                            count: value.MyDetails!.posts[index].likes.length
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
