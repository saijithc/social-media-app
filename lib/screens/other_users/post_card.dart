import 'package:flutter/material.dart';
import 'package:pinch_zoom_release_unzoom/pinch_zoom_release_unzoom.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/current_user/model/user.dart';
import 'package:socio/screens/other_users/provider/provider.dart';

import '../../widgets/caption.dart';
import '../../widgets/like_button.dart';
import '../../widgets/more.dart';
import '../../widgets/options.dart';
import '../../widgets/text.dart';
import '../bottom/Provider/bottom_provider.dart';
import '../current_user/model/timeline_post_model.dart';
import '../current_user/provider/provider.dart';
import 'followers_profile.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.post,
  }) : super(key: key);

  final double height;
  final double width;
  final GetPostModel post;
  @override
  Widget build(BuildContext context) {
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
          width: width * 0.93,
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  if (post.userId.id == CurrentUser.userId) {
                    context.read<BottomProvder>().update(4);
                  } else {
                    context
                        .read<FollowersProvider>()
                        .getFollowerProfileDetails(post.userId.id);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const FollowersProfile()));
                  }
                },
                leading: Container(
                  height: height * 0.06,
                  width: width * 0.13,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(post.userId.avatar),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
                title: text1(post.userId.fullname,
                    color: Colors.white,
                    sizes: height * 0.017,
                    weight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis),
                subtitle: text(
                    post.updatedAt.toString(),
                    const Color.fromARGB(207, 253, 247, 247),
                    height * 0.01,
                    FontWeight.w400,
                    1),
                trailing: IconButton(
                    onPressed: () {
                      post.userId.id == CurrentUser.userId
                          ? options(context, post.id)
                          : more(context, post.userId.id);
                      context
                          .read<CurrentUserProvider>()
                          .checkFollowed(post.userId.id);
                    },
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    )),
              ),
              Center(
                child: PinchZoomReleaseUnzoomWidget(
                  child: Container(
                    margin: EdgeInsets.only(left: 3, right: 3),
                    // height: height * 0.5,
                    width: width,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: FadeInImage(
                      placeholder: AssetImage("assets/loading1.jpg"),
                      image: NetworkImage(post.image),
                      fit: BoxFit.fitWidth,
                    ),
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => CaptionScreen(
                                  comment: post.comments,
                                  caption: post.caption)));
                        },
                        child: text(post.caption, Colors.white, height * 0.014,
                            FontWeight.bold, 2),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Consumer<FollowersProvider>(
                      builder: (context, val, child) {
                        return LikseButton(
                            id: post.id,
                            likes: post.likes,
                            count: post.likes.length.toString());
                      },
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.mode_comment_outlined,
                          color: Colors.white,
                        )),
                    text(post.comments.length.toString(), Colors.white,
                        height * 0.012, FontWeight.w600, 1),
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
  }
}
