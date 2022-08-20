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
                height: height * 0.7,
                width: width * 0.9,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                          SizedBox(
                            width: width * 0.05,
                          ),
                          text("your_name", Colors.white, height * 0.02,
                              FontWeight.w700),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              text(
                                  "2hours ago",
                                  const Color.fromARGB(207, 253, 247, 247),
                                  height * 0.01,
                                  FontWeight.w400),
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
                          height: height * 0.05,
                          width: width * 0.8,
                          child: ListTile(
                            leading: text("Love on tour,New York City😋..",
                                Colors.white, height * 0.014, FontWeight.bold),
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
                            FontWeight.w600),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.mode_comment_outlined,
                              color: Colors.white,
                            )),
                        text("100  ", Colors.white, height * 0.012,
                            FontWeight.w600),
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
// AlertDialog(
//     content: Column(
//       children: [
//         Center(
//           child: Container(
//             color: Colors.blue,
//             height: 100,
//             width: 100,
//           ),
//         )
//       ],
//     ),
//     backgroundColor: Colors.amber,
//   );