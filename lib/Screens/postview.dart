import 'package:flutter/material.dart';
import 'package:socio/Screens/followers_profile.dart';
import 'package:socio/Widgets/more.dart';

import 'package:socio/Widgets/text.dart';

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
              height: height * 0.015,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black,
              ),
              height: height * 0.7,
              width: width * 0.93,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => FollowersProfile()));
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
                        SizedBox(
                          width: width * 0.05,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => FollowersProfile()));
                          },
                          child: text("user_name", Colors.white, height * 0.02,
                              FontWeight.w700),
                        ),
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
                                  more(context);
                                },
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        // text(
                        //     "2hours ago",
                        //     const Color.fromARGB(207, 253, 247, 247),
                        //     height * 0.01,
                        //     FontWeight.w400),
                        // SizedBox(
                        //   width: width * 0.23,
                        // ),
                        // IconButton(
                        //     onPressed: () {
                        //       more(context);
                        //     },
                        //     icon: const Icon(
                        //       Icons.more_vert,
                        //       color: Colors.white,
                        //     ))
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
                        height: height * 0.03,
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
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.mode_comment_outlined,
                            color: Colors.white,
                          ))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            )
          ],
        );
      },
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:socio/Widgets/text.dart';

// class PostView extends StatelessWidget {
//   const PostView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Column(
//         children: [
//           Center(
//             child: Container(
//               height: height,
//               width: width,
//               color: Colors.white.withOpacity(0.1),
//               child: Center(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(25),
//                     color: Colors.black,
//                   ),
//                   height: height * 0.7,
//                   width: width * 0.9,
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             Container(
//                               height: height * 0.05,
//                               width: width * 0.1,
//                               decoration: BoxDecoration(
//                                   image: const DecorationImage(
//                                       image: AssetImage("assets/me.jpg"),
//                                       fit: BoxFit.cover),
//                                   borderRadius: BorderRadius.circular(30)),
//                             ),
//                             SizedBox(
//                               width: width * 0.05,
//                             ),
//                             text("your_name", Colors.white, height * 0.02,
//                                 FontWeight.w700),
//                             SizedBox(
//                               width: width * 0.05,
//                             ),
//                             text(
//                                 "2hours ago",
//                                 const Color.fromARGB(207, 253, 247, 247),
//                                 height * 0.01,
//                                 FontWeight.w400),
//                             SizedBox(
//                               width: width * 0.18,
//                             ),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(
//                                   Icons.more_vert,
//                                   color: Colors.white,
//                                 ))
//                           ],
//                         ),
//                       ),
//                       Center(
//                         child: Container(
//                           height: height * 0.5,
//                           width: width * 0.85,
//                           decoration: BoxDecoration(
//                               image: const DecorationImage(
//                                   image: AssetImage("assets/music.jpeg"),
//                                   fit: BoxFit.cover),
//                               borderRadius: BorderRadius.circular(30)),
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: height * 0.05,
//                             width: width * 0.8,
//                             child: ListTile(
//                               leading: text(
//                                   "Love on tour,New York City😋..",
//                                   Colors.white,
//                                   height * 0.014,
//                                   FontWeight.bold),
//                             ),
//                           )
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           IconButton(
//                               onPressed: () {},
//                               icon: const Icon(
//                                 Icons.favorite_border,
//                                 color: Colors.red,
//                               )),
//                           IconButton(
//                               onPressed: () {},
//                               icon: const Icon(
//                                 Icons.mode_comment_outlined,
//                                 color: Colors.white,
//                               ))
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
