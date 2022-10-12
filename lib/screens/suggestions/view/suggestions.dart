import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/current_user/provider/provider.dart';
import 'package:socio/screens/other_users/view/followers_profile.dart';
import 'package:socio/screens/suggestions/provider/suggestion_provider.dart';
import 'package:socio/common/text.dart';

import '../../other_users/provider/provider.dart';
import 'follow_button.dart';

class ShowSuggestions extends StatelessWidget {
  const ShowSuggestions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Consumer<SuggestionProvider>(builder: (context, value, child) {
      return ListView.builder(
        itemCount: value.suggestions.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                context
                    .read<FollowersProvider>()
                    .getFollowerProfileDetails(value.suggestions[index].id);
                context
                    .read<CurrentUserProvider>()
                    .checkFollowed(value.suggestions[index].id);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => FollowersProfile()));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(255, 214, 85, 46),
                      Color.fromARGB(255, 240, 150, 16)
                    ])),
                // color: Colors.amber,
                height: h * 0.1,
                width: w * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          value.suggestions[index].avatar,
                        )),
                    text1(value.suggestions[index].fullname,
                        color: Colors.white, weight: FontWeight.bold),
                    FollowButton(
                      index: index,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
