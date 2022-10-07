import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/other_users/provider/provider.dart';
import 'package:socio/widgets/followers_postview.dart';

class FollowersPost extends StatefulWidget {
  const FollowersPost({Key? key}) : super(key: key);

  @override
  State<FollowersPost> createState() => _FollowersPostState();
}

class _FollowersPostState extends State<FollowersPost> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FollowersProvider>().setPMode(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    context.read<FollowersProvider>().pCount =
        context.watch<FollowersProvider>().profileDetails!.posts.length;
    return Consumer<FollowersProvider>(
      builder: (context, value, child) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: value.pCount,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  followersPosts(context, value, index);
                },
                child: Container(
                  height: height * 0.1,
                  width: width * 0.1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              value.profileDetails!.posts[index].image),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
