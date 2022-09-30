import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../screens/current_user/add_post.dart';
import '../screens/current_user/provider/provider.dart';
import 'buttons.dart';

Widget EditAndAddButtons(BuildContext context) {
  final h = MediaQuery.of(context).size.height;
  final w = MediaQuery.of(context).size.width;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      GestureDetector(
        onTap: () {},
        child: buttons(
            h * 0.06,
            w * 0.35,
            h * 0.03,
            "Edit Profile",
            const Color.fromARGB(255, 112, 112, 112),
            Colors.white,
            h * 0.015,
            FontWeight.w500),
      ),
      GestureDetector(
        onTap: () {
          context.read<CurrentUserProvider>().image = null;
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => const AddPost()));
        },
        child: buttons(
            h * 0.06,
            w * 0.35,
            h * 0.03,
            "Add Post",
            const Color.fromARGB(255, 112, 112, 112),
            Colors.white,
            h * 0.015,
            FontWeight.w500),
      )
    ],
  );
}
