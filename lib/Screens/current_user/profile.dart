import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/Screens/current_user/highlights.dart';
import 'package:socio/Screens/current_user/myposts.dart';
import 'package:socio/Screens/current_user/provider/theme_mode.dart';
import 'package:socio/Screens/current_user/settings.dart';
import 'package:socio/Screens/current_user/tags.dart';
import 'package:socio/Screens/current_user/add_post.dart';
import 'package:socio/Widgets/buttons.dart';
import 'package:socio/Widgets/text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            excludeHeaderSemantics: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => const Settings()));
                  },
                  icon: const Icon(
                    Icons.settings_outlined,
                    size: 25,
                  ))
            ],
            elevation: 0,
            backgroundColor: const Color.fromARGB(55, 138, 138, 138),
            title: text1(
              " profile",
              weight: FontWeight.bold,
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(55, 138, 138, 138),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                height: height * 0.35,
                width: width,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.01, bottom: height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.05, right: width * 0.05),
                            child: Container(
                              height: height * 0.1,
                              width: width * 0.22,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage("assets/me.jpg"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text1(
                                "your_name",
                                sizes: height * 0.025,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              text1("account_type",
                                  sizes: height * 0.015,
                                  weight: FontWeight.w300)
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: buttons(
                              height * 0.06,
                              width * 0.35,
                              height * 0.03,
                              "Edit Profile",
                              const Color.fromARGB(255, 112, 112, 112),
                              Colors.white,
                              height * 0.015,
                              FontWeight.w500),
                        ),
                        GestureDetector(
                          onTap: () {
                            addPost(context);
                          },
                          child: buttons(
                              height * 0.06,
                              width * 0.35,
                              height * 0.03,
                              "Add Post",
                              const Color.fromARGB(255, 112, 112, 112),
                              Colors.white,
                              height * 0.015,
                              FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(height: height * 0.048),
                    Container(
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      height: height * 0.1,
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              text("101", Colors.white, height * 0.03,
                                  FontWeight.w600, 1),
                              text("Total Post", Colors.white, height * 0.015,
                                  FontWeight.w500, 1)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              text("13K", Colors.white, height * 0.03,
                                  FontWeight.w600, 1),
                              text("Followers", Colors.white, height * 0.015,
                                  FontWeight.w500, 1)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              text("101", Colors.white, height * 0.03,
                                  FontWeight.w600, 1),
                              text("Following", Colors.white, height * 0.015,
                                  FontWeight.w500, 1)
                            ],
                          )
                        ],
                      ),
                    ),
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
                  return DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(
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
                            height: height - 205,
                            child: const TabBarView(
                                children: [MyPosts(), TagScreen()]))
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
