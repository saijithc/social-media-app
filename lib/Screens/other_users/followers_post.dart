import 'package:flutter/material.dart';
import 'package:socio/Widgets/followers_postview.dart';

class FollowersPost extends StatelessWidget {
  const FollowersPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              followersPosts(context);
            },
            child: Container(
              height: height * 0.1,
              width: width * 0.1,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/wheels on the bus ➸ [larry au] - ღ chapter two ღ.jpeg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
        );
      },
    );
  }
}
