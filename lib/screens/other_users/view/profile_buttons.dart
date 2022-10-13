import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/current_user/provider/provider.dart';
import 'package:socio/services/follow.dart';
import 'package:socio/common/buttons.dart';

import '../../current_user/model/current_user_details.dart';

class ProfileButtons extends StatelessWidget {
  ProfileButtons({
    Key? key,
    required this.details,
  }) : super(key: key);

  final UserDetails? details;

  @override
  Widget build(BuildContext context) {
    // context.read<CurrentUserProvider>().checkFollowed(details!.id);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            context.read<CurrentUserProvider>().checkFollowed(details!.id);
            FollowAndUnfollow().followAndUnfollow(details!.id);
          },
          child: buttons(
              height * 0.06,
              width * 0.25,
              height * 0.03,
              context.watch<CurrentUserProvider>().isFollowing == true
                  ? "unfollow"
                  : "Follow",
              const Color.fromARGB(255, 190, 190, 190),
              Colors.white,
              height * 0.015,
              FontWeight.w500),
        ),
        buttons(
            height * 0.06,
            width * 0.25,
            height * 0.03,
            "${details!.posts.length.toString()}\nposts",
            const Color.fromARGB(255, 190, 190, 190),
            Colors.white,
            height * 0.015,
            FontWeight.w500),
        buttons(
            height * 0.06,
            width * 0.25,
            height * 0.03,
            "Message",
            const Color.fromARGB(255, 190, 190, 190),
            Colors.white,
            height * 0.015,
            FontWeight.w500),
      ],
    );
  }
}
