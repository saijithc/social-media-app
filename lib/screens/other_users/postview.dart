import 'package:flutter/material.dart';
import 'package:socio/screens/other_users/followers_profile.dart';
import 'package:socio/widgets/more.dart';
import 'package:socio/widgets/text.dart';

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 12,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            SizedBox(
              height: height * 0.008,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black,
              ),
              // height: height * 0.7,
              width: width * 0.93,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => const FollowersProfile()));
                          },
                          child: Container(
                            height: height * 0.05,
                            width: width * 0.1,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/Stall  - Chapter 45_.png"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                        // SizedBox(
                        //   width: width * 0.01,
                        // ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => const FollowersProfile()));
                          },
                          child: text("harrystyles", Colors.white,
                              height * 0.02, FontWeight.w700, 1),
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            text(
                                "2hours ago",
                                const Color.fromARGB(207, 253, 247, 247),
                                height * 0.01,
                                FontWeight.w400,
                                1),
                            SizedBox(
                              width: width * 0.12,
                            ),
                            IconButton(
                                onPressed: () {
                                  more(context);
                                },
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      height: height * 0.5,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/music.jpeg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        //height: height * 0.03,
                        width: width * 0.8,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: text(
                              "Love on tour,New York City😋..jhfdkjhkdhdkkdkffhfggkhdfgihkdfg      khjjkdscvhjks ihjkdsxcvn nm iuhdcfvjnbxdcb biuhdfkn hihidfgiihdfghkjhfgdhffhlfhgiejjfdfhkhdkjfggkdfghdkfgdgdfgigurgjeoj",
                              Colors.white,
                              height * 0.014,
                              FontWeight.bold,
                              2),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          )),
                      text("1.2K", Colors.white, height * 0.012,
                          FontWeight.w600, 1),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.mode_comment_outlined,
                            color: Colors.white,
                          )),
                      text("100  ", Colors.white, height * 0.012,
                          FontWeight.w600, 1),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.01,
            )
          ],
        );
      },
    );
  }
}
