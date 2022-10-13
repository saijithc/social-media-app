import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/common/text.dart';
import 'package:socio/screens/other_users/provider/provider.dart';
import 'package:socio/screens/other_users/view/followers_profile.dart';
import 'package:socio/screens/suggestions/view/follow_button.dart';

class FollowersList extends StatelessWidget {
  const FollowersList({
    Key? key,
    required this.heading,
    required this.details,
  }) : super(key: key);
  final String heading;

  final List<dynamic> details;
  @override
  Widget build(BuildContext context) {
    log("List =" + details.toString());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: text1(heading, weight: FontWeight.w800, sizes: 20),
      ),
      body: ListView.builder(
        itemCount: details.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              onTap: () {
                context
                    .read<FollowersProvider>()
                    .getFollowerProfileDetails(details[index]);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => FollowersProfile()));
              },
              leading: CircleAvatar(),
              title: text1(details[index].toString(),
                  maxlines: 2,
                  overflow: TextOverflow.ellipsis,
                  sizes: 15,
                  weight: FontWeight.w600),
              trailing: FollowButton(details: details[index]));
        },
      ),
    ));
  }
}
