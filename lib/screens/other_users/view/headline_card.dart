import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/current_user/model/user.dart';

import '../../../common/more.dart';
import '../../../common/options.dart';
import '../../../common/text.dart';
import '../../bottom/Provider/bottom_provider.dart';
import '../../current_user/model/timeline_post_model.dart';
import '../../current_user/provider/provider.dart';
import 'followers_profile.dart';
import '../provider/provider.dart';

class HeadLineCard extends StatelessWidget {
  const HeadLineCard({Key? key, required this.post}) : super(key: key);

  final GetPostModel post;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return ListTile(
      onTap: () {
        if (post.userId.id == CurrentUser.userId) {
          context.read<BottomProvder>().update(4);
        } else {
          context
              .read<FollowersProvider>()
              .getFollowerProfileDetails(post.userId.id);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const FollowersProfile()));
        }
      },
      leading: Container(
        height: h * 0.06,
        width: w * 0.13,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(post.userId.avatar), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10)),
      ),
      title: text1(post.userId.fullname,
          color: Colors.white,
          sizes: h * 0.017,
          weight: FontWeight.w700,
          overflow: TextOverflow.ellipsis),
      subtitle: text(
          post.updatedAt.toString(),
          const Color.fromARGB(207, 253, 247, 247),
          h * 0.01,
          FontWeight.w400,
          1),
      trailing: IconButton(
          onPressed: () {
            post.userId.id == CurrentUser.userId
                ? options(context, post.id)
                : more(context, post.userId.id);
            context.read<CurrentUserProvider>().checkFollowed(post.userId.id);
          },
          icon: const Icon(
            Icons.more_vert,
            color: Colors.white,
          )),
    );
  }
}
