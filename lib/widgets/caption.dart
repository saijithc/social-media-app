import 'package:flutter/material.dart';
import 'package:socio/screens/other_users/followers_profile.dart';
import 'package:socio/widgets/text.dart';

class CaptionScreen extends StatelessWidget {
  const CaptionScreen({Key? key, required this.caption, required this.comment})
      : super(key: key);
  final String? caption;
  final dynamic comment;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: text1(caption, maxlines: 20, weight: FontWeight.bold)),
            ),
            Expanded(
              child: SizedBox(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: h * 0.09),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) =>
                                        const FollowersProfile()));
                              },
                              child: Container(
                                height: h * 0.065,
                                width: w * 0.15,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage("assets/Zayn.jpeg"),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            title: text1("comment", maxlines: 10),
                            subtitle: GestureDetector(
                                onTap: () {},
                                child: text1("Replay", sizes: 12)),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_outline,
                                  color: Colors.red,
                                )),
                          );
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(children: [
                            Expanded(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: ColoredBox(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TextField(
                                    //controller: messageController,
                                    style:
                                        const TextStyle(color: Colors.black87),
                                    decoration: const InputDecoration(
                                        hintText: "Type message",
                                        hintStyle:
                                            TextStyle(color: Colors.black45),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.send,
                                      color: Colors.green,
                                    )),
                              ),
                            )
                          ]),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//  ListView.builder(
//                 physics: BouncingScrollPhysics(),
//                 itemCount: 20,
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListTile(
//                     leading: GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (ctx) => const FollowersProfile()));
//                       },
//                       child: Container(
//                         height: h * 0.065,
//                         width: w * 0.15,
//                         decoration: BoxDecoration(
//                             image: const DecorationImage(
//                                 image: AssetImage("assets/Zayn.jpeg"),
//                                 fit: BoxFit.cover),
//                             borderRadius: BorderRadius.circular(10)),
//                       ),
//                     ),
//                     title: text1("comment", maxlines: 10),
//                     subtitle: GestureDetector(
//                         onTap: () {}, child: text1("Replay", sizes: 12)),
//                     trailing: IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           Icons.favorite_outline,
//                           color: Colors.red,
//                         )),
//                   );
//                 },
//               ),

//  SizedBox(
//           child: Stack(
//             children: [
//               Container(color: Colors.black54, height: h * 0.8),
//               Container(
//                   alignment: Alignment.bottomCenter,
//                   child: Container(
//                     color: Colors.transparent,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 10),
//                     child: Row(children: [
//                       Expanded(
//                           child: ClipRRect(
//                         borderRadius: BorderRadius.circular(30),
//                         child: ColoredBox(
//                           color: const Color.fromARGB(255, 255, 255, 255),
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 10),
//                             child: TextField(
//                               //controller: messageController,
//                               style: const TextStyle(color: Colors.black87),
//                               decoration: const InputDecoration(
//                                   hintText: "Type message",
//                                   hintStyle: TextStyle(color: Colors.black45),
//                                   border: InputBorder.none),
//                             ),
//                           ),
//                         ),
//                       )),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: CircleAvatar(
//                           backgroundColor: Colors.white,
//                           child: IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.send,
//                                 color: Colors.green,
//                               )),
//                         ),
//                       )
//                     ]),
//                   ))
//             ],
//           ),
//         ),