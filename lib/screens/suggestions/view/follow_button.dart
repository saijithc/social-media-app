import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/text.dart';
import '../../current_user/provider/provider.dart';
import '../provider/suggestion_provider.dart';

class FollowButton extends StatelessWidget {
  FollowButton({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<SuggestionProvider>(
      builder: (context, value, child) {
        return ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.white),
            onPressed: () {
              if (context.read<CurrentUserProvider>().loading == false) {
                context.read<CurrentUserProvider>().changeIsFollowingState();
                context
                    .read<CurrentUserProvider>()
                    .followAndUnfollow(value.suggestions[index].id);
                context.read<CurrentUserProvider>().getMyProfileDetai();
                context
                    .read<CurrentUserProvider>()
                    .checkFollowed(value.suggestions[index].id);
              }
            },
            child: Consumer<CurrentUserProvider>(
              builder: (context, value, child) {
                return context.watch<CurrentUserProvider>().loading == true
                    ? Center(
                        child: SizedBox(
                            width: 10,
                            height: 10,
                            child: const CircularProgressIndicator()))
                    : text1(value.isFollowing == true ? "unfollow" : "follow",
                        color: Colors.black);
              },
            ));
      },
    );
  }
}
