import 'package:flutter/material.dart';
import 'package:socio/Widgets/options.dart';
import 'package:socio/Widgets/text.dart';

customAlert(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        insetPadding:
            EdgeInsets.only(top: height * 0.08, bottom: height * 0.08),
        contentPadding: const EdgeInsets.all(0),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black,
                ),
                width: width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: height * 0.05,
                            width: width * 0.1,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage("assets/me.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          text("your_name", Colors.white, height * 0.02,
                              FontWeight.w700, 1),
                          SizedBox(
                            width: width * 0.08,
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
                                width: width * 0.1,
                              ),
                              IconButton(
                                  onPressed: () {
                                    options(context);
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
                        width: width * 0.85,
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
                          // height: height * 0.05,
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
            )
          ],
        ),
        backgroundColor: Colors.transparent,
      );
    },
  );
}
