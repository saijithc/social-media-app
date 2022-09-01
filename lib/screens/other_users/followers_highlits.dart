import 'package:flutter/material.dart';
import 'package:socio/widgets/text.dart';

class FollowersHighLights extends StatelessWidget {
  const FollowersHighLights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.13,
      width: width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: width * 0.01,
            ),
            SizedBox(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.09,
                            width: width * 0.2,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage("assets/_ (4).jpeg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          const SizedBox(height: 5),
                          text1("Highlight",
                              sizes: height * 0.015, weight: FontWeight.w600),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
