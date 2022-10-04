import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/current_user/myposts.dart';
import 'package:socio/screens/current_user/provider/provider.dart';
import 'package:socio/widgets/counts.dart';
import 'package:socio/widgets/fabicon.dart';
import 'package:socio/widgets/text.dart';
import '../theme/theme_mode.dart';
import 'highlights.dart';
import 'tags.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    final provider = context.read<CurrentUserProvider>();
    if (provider.MyDetails == null) {
      provider.getMyProfileDetai();
    }
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      log('called');
      if (tabController.index == 0) {
        // provider.setPMode(context);
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

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            excludeHeaderSemantics: true,
            // actions: [
            //   IconButton(
            //       onPressed: () {
            //         Navigator.of(context).push(MaterialPageRoute(
            //             builder: (ctx) => const Settings()));
            //       },
            //       icon: const Icon(
            //         Icons.settings_outlined,
            //         size: 25,
            //       ))
            // ],
            elevation: 0,
            backgroundColor: const Color.fromARGB(55, 138, 138, 138),
            title: text1(
              " profile",
              weight: FontWeight.bold,
            )),
        body: context.watch<CurrentUserProvider>().MyDetails == null
            ? Center(child: const CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () =>
                    context.read<CurrentUserProvider>().getMyProfileDetai(),
                child: SingleChildScrollView(
                  child: Consumer<CurrentUserProvider>(
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(55, 138, 138, 138),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50))),
                            height: height * 0.28,
                            width: width,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: height * 0.01,
                                      bottom: height * 0.01),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: width * 0.05,
                                            right: width * 0.05),
                                        child: Container(
                                          height: height * 0.1,
                                          width: width * 0.22,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      value.MyDetails!.avatar),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          text1(
                                            value.MyDetails!.fullname,
                                            sizes: height * 0.025,
                                            weight: FontWeight.bold,
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          text1(value.MyDetails!.bio,
                                              sizes: height * 0.015,
                                              weight: FontWeight.w300,
                                              maxlines: 5)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                // SizedBox(
                                //   height: height * 0.02,
                                // ),
                                // EditAndAddButtons(context),
                                SizedBox(height: height * 0.05),
                                Counts(context)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          const HighLights(),
                          SizedBox(
                            height: height * 0.02,
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
                                    ],
                                  ),
                                  SizedBox(
                                      height: context
                                              .watch<CurrentUserProvider>()
                                              .tabViewheight ??
                                          0,
                                      child: TabBarView(
                                          controller: tabController,
                                          children: const [
                                            MyPosts(),
                                            TagScreen()
                                          ]))
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
        floatingActionButton: FabiconButton(),
      ),
    );
  }
}
