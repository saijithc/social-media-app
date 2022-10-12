import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/other_users/view/profile_buttons.dart';
import 'package:socio/screens/other_users/provider/provider.dart';
import 'package:socio/screens/other_users/view/tag.dart';
import 'package:socio/screens/theme/theme_mode.dart';
import 'package:socio/screens/other_users/view/followers_highlits.dart';
import 'package:socio/screens/other_users/view/followers_post.dart';
import 'package:socio/common/text.dart';

class FollowersProfile extends StatefulWidget {
  const FollowersProfile({Key? key}) : super(key: key);
  @override
  State<FollowersProfile> createState() => _FollowersProfileState();
}

class _FollowersProfileState extends State<FollowersProfile>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    final provider = context.read<FollowersProvider>();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      if (tabController.index == 0) {
      } else {
        provider.setTMode(context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Consumer<FollowersProvider>(
          builder: (context, value, child) {
            return value.profileDetails == null
                ? Center(child: const CircularProgressIndicator())
                : CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        // pinned: true,
                        // floating: true,
                        expandedHeight: height * 0.4,
                        flexibleSpace: FlexibleSpaceBar(
                            background: Image(
                          image: NetworkImage(
                            value.profileDetails!.avatar,
                          ),
                          fit: BoxFit.cover,
                        )),
                      ),
                      SliverToBoxAdapter(
                        child: Consumer<ThemeChanger>(
                            builder: (context, val, child) {
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
                                            text(
                                                value.profileDetails!.bio,
                                                Colors.red,
                                                height * 0.015,
                                                FontWeight.w700,
                                                1)
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            text1(
                                                value.profileDetails!.fullname,
                                                sizes: height * 0.03,
                                                weight: FontWeight.w800),
                                            Column(
                                              children: [
                                                text1(
                                                  value.profileDetails!
                                                      .followers.length
                                                      .toString(),
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
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: ProfileButtons(
                                            details: value.profileDetails,
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
                                      return Column(
                                        children: [
                                          TabBar(
                                              controller: tabController,
                                              tabs: [
                                                Tab(
                                                  icon: Icon(
                                                    Icons.grid_view_outlined,
                                                    color: val.thememode ==
                                                            ThemeMode.dark
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                                Tab(
                                                  icon: Icon(
                                                    Icons
                                                        .person_pin_circle_outlined,
                                                    color: val.thememode ==
                                                            ThemeMode.dark
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ]),
                                          SizedBox(
                                            height: context
                                                    .watch<FollowersProvider>()
                                                    .tabviewHeight ??
                                                0,
                                            child: TabBarView(
                                                controller: tabController,
                                                children: const [
                                                  FollowersPost(),
                                                  FollowersTagScreen()
                                                ]),
                                          ),
                                        ],
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
                  );
          },
        ),
      ),
    );
  }
}
