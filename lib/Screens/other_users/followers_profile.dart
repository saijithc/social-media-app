import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/Screens/theme/theme_mode.dart';
import 'package:socio/Screens/current_user/tags.dart';
import 'package:socio/Screens/other_users/followers_highlits.dart';
import 'package:socio/Screens/other_users/followers_post.dart';
import 'package:socio/Widgets/buttons.dart';
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
              child: Consumer<ThemeChanger>(builder: (context, val, child) {
                return Container(
                  decoration: BoxDecoration(
                      color: val.thememode == ThemeMode.dark
                          ? Colors.black
                          : Colors.white,
                      borderRadius: const BorderRadius.only(
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
                              //color: Colors.black26,
                              thickness: 5,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  text("musician", Colors.red, height * 0.015,
                                      FontWeight.w700, 1)
                                ],
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  text1("harrystyles",
                                      sizes: height * 0.03,
                                      weight: FontWeight.w800),
                                  Column(
                                    children: [
                                      text1(
                                        "50 M",
                                        sizes: height * 0.03,
                                        weight: FontWeight.w700,
                                      ),
                                      text1("Followers",
                                          sizes: height * 0.014,
                                          weight: FontWeight.bold)
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
                                        const Color.fromARGB(
                                            255, 190, 190, 190),
                                        Colors.white,
                                        height * 0.015,
                                        FontWeight.w500),
                                    buttons(
                                        height * 0.06,
                                        width * 0.25,
                                        height * 0.03,
                                        " 546\nposts",
                                        const Color.fromARGB(
                                            255, 190, 190, 190),
                                        Colors.white,
                                        height * 0.015,
                                        FontWeight.w500),
                                    buttons(
                                        height * 0.06,
                                        width * 0.25,
                                        height * 0.03,
                                        "Message",
                                        const Color.fromARGB(
                                            255, 190, 190, 190),
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
                        const FollowersHighLights(),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Consumer<ThemeChanger>(
                          builder: (context, val, child) {
                            return DefaultTabController(
                              length: 2,
                              child: Column(
                                children: [
                                  TabBar(tabs: [
                                    Tab(
                                      icon: Icon(
                                        Icons.grid_view_outlined,
                                        color: val.thememode == ThemeMode.dark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    Tab(
                                      icon: Icon(
                                        Icons.person_pin_circle_outlined,
                                        color: val.thememode == ThemeMode.dark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: height - 120,
                                    child: const TabBarView(children: [
                                      FollowersPost(),
                                      TagScreen()
                                    ]),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
