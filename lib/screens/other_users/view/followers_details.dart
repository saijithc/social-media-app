import 'package:flutter/material.dart';
import 'package:socio/screens/current_user/model/current_user_details.dart';
import 'package:socio/screens/other_users/view/profile_buttons.dart';
import '../../../common/text.dart';
import '../../current_user/view/followerslist.dart';

class FollowerDetails extends StatelessWidget {
  const FollowerDetails({Key? key, required this.value}) : super(key: key);
  final UserDetails value;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          children: [
            text(value.bio, Colors.red, height * 0.015, FontWeight.w700, 1)
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            text1(value.fullname,
                sizes: height * 0.03, weight: FontWeight.w800),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => FollowersList(
                      heading: "Followers", details: value.followers))),
              child: Column(
                children: [
                  text1(
                    value.followers.length.toString(),
                    sizes: height * 0.03,
                    weight: FontWeight.w700,
                  ),
                  text1("Followers",
                      sizes: height * 0.014, weight: FontWeight.bold)
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ProfileButtons(
            details: value,
          ),
        ),
      ],
    );
  }
}
