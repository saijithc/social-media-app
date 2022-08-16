import 'package:flutter/material.dart';
import 'package:socio/Screens/highlights.dart';
import 'package:socio/Screens/myposts.dart';
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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(55, 138, 138, 138),
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title: text("profile", Colors.black, height * 0.02, FontWeight.bold),
        ),
        body: ListView(children: [
          Column(
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
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              text("your_name", Colors.black, height * 0.025,
                                  FontWeight.bold),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              text(
                                  "account_type",
                                  const Color.fromARGB(255, 21, 19, 19),
                                  height * 0.015,
                                  FontWeight.w300)
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
                              width * 0.4,
                              height * 0.03,
                              "Edit Profile",
                              const Color.fromARGB(255, 112, 112, 112),
                              Colors.white,
                              height * 0.015,
                              FontWeight.w500),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: buttons(
                              height * 0.06,
                              width * 0.4,
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
                      height: height * 0.1,
                      width: width,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(215, 96, 248, 243),
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              text("101", Colors.white, height * 0.03,
                                  FontWeight.w600),
                              text("Total Post", Colors.white, height * 0.015,
                                  FontWeight.w500)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              text("13K", Colors.white, height * 0.03,
                                  FontWeight.w600),
                              text("Followers", Colors.white, height * 0.015,
                                  FontWeight.w500)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              text("101", Colors.white, height * 0.03,
                                  FontWeight.w600),
                              text("Following", Colors.white, height * 0.015,
                                  FontWeight.w500)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: height,
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Column(
                        children: [
                          const HighLights(),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          const MyPosts()
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
