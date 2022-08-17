import 'package:flutter/material.dart';
import 'package:socio/Widgets/alertdialog.dart';
import 'package:socio/Widgets/buttons.dart';
import 'package:socio/Widgets/followers_postview.dart';
import 'package:socio/Widgets/text.dart';

class FollowersProfile extends StatelessWidget {
  const FollowersProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              // pinned: true,
              // floating: true,
              expandedHeight: height * 0.4,
              flexibleSpace: const FlexibleSpaceBar(
                  background: Image(
                image: AssetImage(
                  "assets/Stall  - Chapter 45_.png",
                ),
                fit: BoxFit.cover,
              )),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: width * 0.4,
                          child: const Divider(
                            color: Colors.black26,
                            thickness: 5,
                          )),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                text("musician", Colors.red, height * 0.015,
                                    FontWeight.w700)
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                text("harrystyles", Colors.black, height * 0.03,
                                    FontWeight.w800),
                                Column(
                                  children: [
                                    text("50 M", Colors.black, height * 0.03,
                                        FontWeight.w700),
                                    text("Followers", Colors.black38,
                                        height * 0.014, FontWeight.bold)
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  buttons(
                                      height * 0.06,
                                      width * 0.25,
                                      height * 0.03,
                                      "Follow",
                                      const Color.fromARGB(255, 190, 190, 190),
                                      Colors.white,
                                      height * 0.015,
                                      FontWeight.w500),
                                  buttons(
                                      height * 0.06,
                                      width * 0.25,
                                      height * 0.03,
                                      " 546\nposts",
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
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
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
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
