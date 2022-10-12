import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/current_user/provider/provider.dart';
import 'package:socio/common/text.dart';

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
    log(details.toString());
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
            leading: CircleAvatar(
                // backgroundImage: NetworkImage(),
                ),
            title: text1(details[index].toString(),
                maxlines: 2,
                overflow: TextOverflow.ellipsis,
                sizes: 15,
                weight: FontWeight.w600),
            trailing: FollowButton(
              details: details[index],
            ),
          );
        },
      ),
    ));
  }
}

class FollowButton extends StatelessWidget {
  const FollowButton({
    Key? key,
    required this.details,
  }) : super(key: key);

  final String details;

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentUserProvider>(
      builder: (context, value, child) {
        return SizedBox(
          width: 100,
          child: ElevatedButton(
              onPressed: () {},
              child: value.MyDetails!.following.contains(details)
                  ? text1("Following")
                  : text1("Follow")),
        );
      },
    );
  }
}
