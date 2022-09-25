import 'package:flutter/material.dart';

import '../../../widgets/text.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Row(
            children: [
              Container(
                height: h * 0.065,
                width: w * 0.15,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("assets/Zayn.jpeg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text1("zayn malik", sizes: 24, maxlines: 1),
                  text1("online", color: Colors.green)
                ],
              ),
            ],
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        ),
        body: SizedBox(
          child: Stack(
            children: [
              Container(color: Colors.black54, height: h * 0.8),
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
                              style: const TextStyle(color: Colors.black87),
                              decoration: const InputDecoration(
                                  hintText: "Type message",
                                  hintStyle: TextStyle(color: Colors.black45),
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
    );
  }
}
